package poly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.util.MongoDbErrorCodes;
import org.springframework.stereotype.Service;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

import poly.dto.RecipeInfoDTO;
import poly.persistance.mongo.IRecipeListMapper;
import poly.service.IRecipeDetailService;
import poly.service.IRecipeListService;
import poly.util.CmmUtil;
import java.util.Arrays;

@Service("RecipeListService")
public class RecipeListService implements IRecipeListService {

	@Resource(name = "RecipeListMapper")
	private IRecipeListMapper recipeListMapper; // MongoDB에 저장할 Mapper
	
	@Resource(name="RecipeDetailService")
	private IRecipeDetailService recipeDetailService;

	@Autowired
	private MongoTemplate mongodb;

	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());

	@Override		//mongoDB 레시피 아이디 가져오기
	public List<RecipeInfoDTO> getRecipeInfo() throws Exception{
	
		String colNm = "RecipeList";
		
		List<RecipeInfoDTO> rList = new ArrayList<>();//recipeListMapper.getRecipeInfo(colNm);
		
		if(rList==null) {
			rList = new ArrayList<RecipeInfoDTO>();
		}
		
		return rList;
	}
	
	@Override
	public void collectRecipeList() throws Exception {

		//log.info(this.getClass().getName() + "collectRecipeList Start!");
		
		List<RecipeInfoDTO> rList = new ArrayList<RecipeInfoDTO>();
		RecipeInfoDTO rDTO = new RecipeInfoDTO(); 

		String colNm = "RecipeList";
		
		List<String> recipeList = recipeListMapper.getRecipeInfo(colNm);
		
		if(recipeList==null) {
			recipeList = new ArrayList<String>();
		}
		
		try {
			for(int j = 1;j<=3;j++) {			// 3으로 수정
				String url = "https://www.10000recipe.com/recipe/list.html?order=date&page=";
				log.info("페이지 ######################: "+j);
				int pgNm = j;			
				
				Document doc = Jsoup.connect(url+Integer.toString(pgNm)).get();
				
				Elements element = doc.select("div.rcp_m_list2 > div.row");
				Iterator<Element> foodList = element.select("> div.col-xs-3").iterator();
				
				int cnt = 1;
				boolean loop = true;
				while(foodList.hasNext()&&loop) {
					Element foodInfo = foodList.next();
					if(cnt==6||cnt==15||cnt==26||cnt==35) {
						//광고위치
					}else {
						rDTO = new RecipeInfoDTO();
						String recipe_id = foodInfo.select(" > a.thumbnail").attr("href");					//레시피 아이디(번호)
						int i = recipe_id.lastIndexOf("/");
						recipe_id = recipe_id.substring(i+1);
						if(!recipeList.contains(recipe_id)) {
							recipeDetailService.collectRecipeDetail(recipe_id);
							String recipe_main_img = foodInfo.select(" > a.thumbnail > img").attr("src");		//메인사진
							String recipe_name = foodInfo.select(" > a.thumbnail > div.caption > h4").text();	//레시피 제목
							//log.info("레시피 아이디 : "+recipe_id);
							//log.info("레시피 메인 이미지: "+recipe_main_img);
							//log.info("레시피 이름 : "+recipe_name);
							
							rDTO.setRecipe_id(recipe_id);
							rDTO.setRecipe_main_img(recipe_main_img);
							rDTO.setRecipe_name(recipe_name);
							
							
							rList.add(rDTO);
						}else {
							loop=false;
						}
						rDTO = null;
					}
					cnt++;
				}
			}
			
				
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		recipeListMapper.insertRecipe(rList, colNm);
		
		//log.info(this.getClass().getName() + "collectRecipeList end!");
	
	}

	@Override
	public List<String> getRecipeList(String cookTime) {
		
		DBCollection rCol = mongodb.getCollection("RecipeDetail");
		
		BasicDBObject query = new BasicDBObject();
		
		Iterator<DBObject> cursor;
		
		if(cookTime.equals("10")) {
			query.put("$or", Arrays.asList(
                    new BasicDBObject()
                            .append("recipe_time", "5분 이내"),
                    new BasicDBObject()
                            .append("recipe_time", "10분 이내")
						)
					);
			cursor = rCol.find(query);  
		}else if(cookTime.equals("20")) {
			query.put("$or", Arrays.asList(
                    new BasicDBObject()
                            .append("recipe_time", "15분 이내"),
                    new BasicDBObject()
                            .append("recipe_time", "20분 이내")
						)
					);
			cursor = rCol.find(query);
		}else if(cookTime.equals("30")) {
			query.put("$or", Arrays.asList(
                    new BasicDBObject()
                            .append("recipe_time", "25분 이내"),
                    new BasicDBObject()
                            .append("recipe_time", "30분 이내")
						)
					);
			cursor = rCol.find(query);
		}else if(cookTime.equals("60")) {
			query.put("$or", Arrays.asList(
                    new BasicDBObject()
                            .append("recipe_time", "35분 이내"),
                    new BasicDBObject()
                            .append("recipe_time", "40분 이내"),
                    new BasicDBObject()
                            .append("recipe_time", "45분 이내"),
                    new BasicDBObject()
                            .append("recipe_time", "50분 이내"),    
                    new BasicDBObject()
                            .append("recipe_time", "55분 이내"),
                    new BasicDBObject()
                            .append("recipe_time", "60분 이내")
						)
					);
			cursor = rCol.find(query);
		}else {
			query.put("$and", Arrays.asList(
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "5분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "10분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "15분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "20분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "25분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "30분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "35분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "40분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "45분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "50분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                            		.append("$ne", "55분 이내")
                            ),
                    new BasicDBObject()
                            .append("recipe_time", new BasicDBObject()
                                    .append("$ne", "60분 이내")
                            ),
                    /*new BasicDBObject()
                    .append("recipe_time", new BasicDBObject()
                                    .append("$ne", "")
                            ),*/
                    new BasicDBObject()
                    .append("recipe_time", new BasicDBObject()
                                    .append("$ne", null)
                            )                  
                )
            );
			cursor = rCol.find(query);
		}
			
		//레시피 아이디
		List<String> recipe_id_list = new ArrayList<String>();
		
		while(cursor.hasNext()) {
			DBObject current = cursor.next();
			
			//레시피 아이디 가져오기
			String recipe_id = CmmUtil.nvl((String) current.get("recipe_id"));
			if(!recipe_id.equals("")) {
				if(!recipe_id_list.contains(recipe_id)) {
					recipe_id_list.add(recipe_id);
				}
			}
			
		}
		for(int i = 0; i < 100; i++) {
			
			log.info("조리시간 선택 시 레시피 아이디 리스트 : "+recipe_id_list.get(i));
			
		}
		
		return recipe_id_list;
	}

	@Override
	public Map<String, Object> getSearchRecipeList(String recipeSearch) {
		log.info(this.getClass().getName() + "getSearchRecipeList Start!");
		
		DBCollection rCol = mongodb.getCollection("RecipeList");
		
		BasicDBObject query = new BasicDBObject();
		
		//전체 레시피 이름 목록에서 사용자가 검색한 이름을 포함할 경우
		query.put("recipe_name", Pattern.compile("^.*"+recipeSearch+".*$", Pattern.CASE_INSENSITIVE));
		
		Iterator<DBObject> cursor = rCol.find(query);
		
		//메인 이미지
		List<String> recipe_main_img_list = new ArrayList<String>();
		
		//레시피 제목
		List<String> recipe_name_list = new ArrayList<String>();
		
		//레시피 아이디
		List<String> recipe_id_list = new ArrayList<String>();
		
		//레시피 리스트들을 담을 Map
		Map<String, Object> pMap = new HashMap<>();
		
		while(cursor.hasNext()) {
			DBObject current = cursor.next();
			
			// 레시피 메인 이미지 가져오기
			String recipe_main_img = CmmUtil.nvl((String) current.get("recipe_main_img"));
			recipe_main_img_list.add(recipe_main_img);
			
			// 레시피 제목 가져오기
			String recipe_name = CmmUtil.nvl((String) current.get("recipe_name"));
			recipe_name_list.add(recipe_name);
			
			//레시피 아이디
			String recipe_id = CmmUtil.nvl((String) current.get("recipe_id"));
			recipe_id_list.add(recipe_id);
		}
		
		pMap.put("recipe_main_img_list", recipe_main_img_list);
		pMap.put("recipe_name_list", recipe_name_list);
		pMap.put("recipe_id_list", recipe_id_list);
		
		return pMap;
	}

	@Override
	public List<String> getPersonnelRecipeList(String personnel) {
		
		DBCollection rCol = mongodb.getCollection("RecipeDetail");
		
		BasicDBObject query = new BasicDBObject();
		
		if(personnel.equals("1")) {
			 query.put("recipe_personnel", Pattern.compile("^.*1.*$", Pattern.CASE_INSENSITIVE));
		}else if(personnel.equals("2")){
			query.put("recipe_personnel", Pattern.compile("^.*2.*$", Pattern.CASE_INSENSITIVE));
		}else if(personnel.equals("3")) {
			query.put("recipe_personnel", Pattern.compile("^.*3.*$", Pattern.CASE_INSENSITIVE));
		}else {
			query.put("$and", Arrays.asList(
                    new BasicDBObject()
                            .append("recipe_personnel", new BasicDBObject()
                                    .append("$not", Pattern.compile("^.*1.*$", Pattern.CASE_INSENSITIVE))
                            ),
                    new BasicDBObject()
                            .append("recipe_personnel", new BasicDBObject()
                                    .append("$not", Pattern.compile("^.*2.*$", Pattern.CASE_INSENSITIVE))
                            ),
                    new BasicDBObject()
                            .append("recipe_personnel", new BasicDBObject()
                                    .append("$not", Pattern.compile("^.*3.*$", Pattern.CASE_INSENSITIVE))
                            ),
                    new BasicDBObject()
                            .append("recipe_personnel", new BasicDBObject()
                                    .append("$not", Pattern.compile("^.*3.*$", Pattern.CASE_INSENSITIVE))
                            ),
                    new BasicDBObject()
                            .append("recipe_personnel", new BasicDBObject()
                                    .append("$not", Pattern.compile("^.*4.*$", Pattern.CASE_INSENSITIVE))
                            ),
                            new BasicDBObject()
                            .append("recipe_personnel", new BasicDBObject()
                            		.append("$ne", null)
                            )                            
                )
            );
		}
		
		Iterator<DBObject> cursor = rCol.find(query);
		List<String> recipe_id_list = new ArrayList<>();
		
		while(cursor.hasNext()) {
			DBObject current = cursor.next();
			
			//레시피 아이디
			String recipe_id = CmmUtil.nvl((String) current.get("recipe_id"));
			if(!recipe_id.equals("")) {
				if(!recipe_id_list.contains(recipe_id)) {
					recipe_id_list.add(recipe_id);
				}
			}
		}
		
		return recipe_id_list;
	}

	@Override
	public Map<String, Object> getRecipeListById(List<String> recipe_id_list) {
		
		DBCollection rCol = mongodb.getCollection("RecipeList");
		
		BasicDBObject query = new BasicDBObject();
		
		//메인 이미지
		List<String> recipe_main_img_list = new ArrayList<String>();
		
		//레시피 제목
		List<String> recipe_name_list = new ArrayList<String>();
		
		//레시피 리스트들을 담을 Map
		Map<String, Object> pMap = new HashMap<>();		
		
		int j = recipe_id_list.size();
		
		for(int i = 0; i < j; i++) {		
			log.info("레시피 아이디로 리스트가져오기 : " + i);
			
			query.put("recipe_id", recipe_id_list.get(i));
			
			Iterator<DBObject> cursor = rCol.find(query);
			
			DBObject current = cursor.next(); 
			
			// 레시피 메인 이미지 가져오기
			String recipe_main_img = CmmUtil.nvl((String) current.get("recipe_main_img"));
			recipe_main_img_list.add(recipe_main_img);
	
			// 레시피 제목 가져오기
			String recipe_name = CmmUtil.nvl((String) current.get("recipe_name"));
			recipe_name_list.add(recipe_name);
			
		}
		
		pMap.put("recipe_main_img_list", recipe_main_img_list);
		pMap.put("recipe_name_list", recipe_name_list);
		
		return pMap;
	}

	@Override
	public List<String> getStepRecipeList(String step) {
		
		DBCollection rCol = mongodb.getCollection("RecipeDetail");
		
		BasicDBObject query = new BasicDBObject();
		
		Iterator<DBObject> cursor;
		
		if(step.equals("1")) {
			query.put("$or", Arrays.asList(
                    new BasicDBObject()
                            .append("recipe_step", "아무나"),
                    new BasicDBObject()
                            .append("recipe_step", "초급")
                )
            );
			cursor = rCol.find(query);
		}else if(step.equals("2")) {
			query.put("$or", Arrays.asList(
                    new BasicDBObject()
                            .append("recipe_step", "중급")
                )
            );
			cursor = rCol.find(query);
		}else {
			query.put("$or", Arrays.asList(
                    new BasicDBObject()
                            .append("recipe_step", "고급"),
                    new BasicDBObject()
                            .append("recipe_step", "신의경지")
                )
            );
			cursor = rCol.find(query);
		}
		
		List<String> recipe_id_list = new ArrayList<>();
		
		while(cursor.hasNext()) {
			DBObject current = cursor.next();
			
			//레시피 아이디
			String recipe_id = CmmUtil.nvl((String) current.get("recipe_id"));
			if(!recipe_id.equals("")) {
				if(!recipe_id_list.contains(recipe_id)) {
					recipe_id_list.add(recipe_id);
				}
			}
		}		

		return recipe_id_list;
	}
	
	

}
