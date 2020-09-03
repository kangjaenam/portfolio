package poly.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.stereotype.Service;

import com.mongodb.BasicDBObject;
import com.mongodb.Cursor;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

import poly.dto.RecipeInfoDTO;
import poly.persistance.mongo.IRecipeDetailMapper;
import poly.service.IRecipeDetailService;
import poly.util.CmmUtil;

@Service("RecipeDetailService")
public class RecipeDetailService implements IRecipeDetailService {

	@Resource(name = "RecipeDetailMapper")
	private IRecipeDetailMapper recipeDetailMapper;

	@Autowired
	private MongoTemplate mongodb;

	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public void collectRecipeDetail(String recipe_id) throws Exception {

		log.info(this.getClass().getName() + "collectRecipeDetail Start!");

		List<RecipeInfoDTO> rList = new ArrayList<RecipeInfoDTO>();
		RecipeInfoDTO rDTO = new RecipeInfoDTO();

		try {

			String url = "https://www.10000recipe.com/recipe/";

			Document doc = Jsoup.connect(url + recipe_id).get();

			Elements element = doc.select("div#contents_area");

			// 인분
			String recipe_personnel = element
					.select(" > div.view2_summary > div.view2_summary_info > span.view2_summary_info1").text();
			// 조리 시간
			String recipe_time = element
					.select(" > div.view2_summary > div.view2_summary_info > span.view2_summary_info2").text();
			// 난이도
			String recipe_step = element
					.select(" > div.view2_summary > div.view2_summary_info > span.view2_summary_info3").text();
			// 재료
			String recipe_material = element.select(" > div.view_cont > div.cont_ingre > dl > dd").text();

			// log.info("인분 : "+recipe_personnel);
			// log.info("조리시간 : "+recipe_time);
			// log.info("난이도 : "+recipe_step);
			// log.info("재료 : "+recipe_material);

			rDTO.setRecipe_id(recipe_id);
			rDTO.setRecipe_personnel(recipe_personnel);
			rDTO.setRecipe_time(recipe_time);
			rDTO.setRecipe_step(recipe_step);
			rDTO.setRecipe_material(recipe_material);

			rList.add(rDTO);

			Iterator<Element> foodList = element.select("> div.view_step > div.view_step_cont").iterator();

			while (foodList.hasNext()) {
				rDTO = new RecipeInfoDTO();
				Element foodInfo = foodList.next();
				String recipe_img = foodInfo.select("img").attr("src"); // 레시피 사진
				String recipe_cooking = foodInfo.select("div.media-body").text(); // 조리법
				// log.info("조리 이미지 : "+recipe_img);
				// log.info("조리법 : "+recipe_cooking);
				rDTO.setRecipe_id(recipe_id);
				rDTO.setRecipe_img(recipe_img);
				rDTO.setRecipe_cooking(recipe_cooking);

				rList.add(rDTO);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		String colNm = "RecipeDetail";
		log.info("service colNm : " + colNm);

		recipeDetailMapper.insertRecipeDetail(rList, colNm);

		log.info(this.getClass().getName() + "collectRecipeList end!");

	}

	@Override
	public Map<String, Object> getRecipeDetail(String recipe_id) throws Exception {

		// 데이터를 가져올 컬렉션 선택
		DBCollection rCol = mongodb.getCollection("RecipeDetail");

		// 리스트 페이지에서 넘어온 아이디 == 레시피 디테일에 있는 아이디 가 같은 것 만 조리방법과 조리이미지 가져오기
		BasicDBObject query = new BasicDBObject();
		query.put("recipe_id", recipe_id);

		// 컬렉션으로부터 데이터 가져오기
		Iterator<DBObject> cursor = rCol.find(query);

		// 조리 방법 리스트
		List<String> cooking_list = new ArrayList<String>();

		// 조리 이미지 리스트
		List<String> img_list = new ArrayList<String>();
		
		//조리시간, 난이도, 재료, 인분 이 들어갈 DTO
		RecipeInfoDTO rDTO = new RecipeInfoDTO();

		while (cursor.hasNext()) {

			final DBObject current = cursor.next();
			if(!CmmUtil.nvl((String) current.get("recipe_time")).equals("")) {
				String recipe_time = CmmUtil.nvl((String) current.get("recipe_time"));
				String recipe_step = CmmUtil.nvl((String) current.get("recipe_step"));
				String recipe_material = CmmUtil.nvl((String) current.get("recipe_material"));
				String recipe_personnel = CmmUtil.nvl((String) current.get("recipe_personnel"));
				
				rDTO = new RecipeInfoDTO();
				
				rDTO.setRecipe_time(recipe_time);
				rDTO.setRecipe_step(recipe_step);
				rDTO.setRecipe_material(recipe_material);
				rDTO.setRecipe_personnel(recipe_personnel);
				
			}
			// 아이디에 해당하는 조리 방법 가져오기
			String recipe_cooking = CmmUtil.nvl((String) current.get("recipe_cooking"));
			cooking_list.add(recipe_cooking);
			
			
			// 아이디에 해당하는 조리 이미지 가져오기
			String recipe_img = CmmUtil.nvl((String) current.get("recipe_img"));
			img_list.add(recipe_img);
			
			
			
			
		}
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("cooking_list", cooking_list);
		pMap.put("img_list", img_list);
		pMap.put("rDTO", rDTO);
		
		
		return pMap;
	}

	@Override  		
	public List<String> searchIngredient(String ingredient) {
		log.info(this.getClass().getName()+"searchIngredient시작!!");
		
		DBCollection rCol = mongodb.getCollection("RecipeDetail");
		
		List<String> recipe_id_list = new ArrayList<String>();
		
		String words [] = ingredient.split(",");
			
		
		for(String word : words) {
			BasicDBObject query = new BasicDBObject();
			query.put("$and", Arrays.asList(new BasicDBObject().append("recipe_material", Pattern.compile("^.*"+word+".*$", Pattern.CASE_INSENSITIVE))));
			Cursor cursor = rCol.find(query);
			while(cursor.hasNext()) {
				DBObject current = cursor.next();
				String recipe_id = CmmUtil.nvl((String) current.get("recipe_id"));
				if(!recipe_id.equals("")) {
					if(!recipe_id_list.contains(recipe_id)) {
						recipe_id_list.add(recipe_id);
					}
				}
			}
			query = null;
		}
        
		
		return recipe_id_list;
	}

	
	
}
