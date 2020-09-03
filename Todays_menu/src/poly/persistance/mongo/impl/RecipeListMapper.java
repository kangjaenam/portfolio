package poly.persistance.mongo.impl;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

import poly.dto.RecipeInfoDTO;
import poly.persistance.mongo.IRecipeListMapper;
import poly.util.CmmUtil;

@Component("RecipeListMapper")
public class RecipeListMapper implements IRecipeListMapper{

	@Autowired
	private MongoTemplate mongodb;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public boolean createCollection(String colNm) throws Exception{
		log.info("mapper create colNm : " + colNm);
		log.info(this.getClass().getName() + "createCollection Start!");
		
		boolean res = false;
		
		//기존에 등록된 컬렉션 이름이 존재하는지 체크하고, 존재하면 기존 컬렉션 삭제함
		if(mongodb.collectionExists(colNm)) {
			mongodb.dropCollection(colNm);	//기존 컬렉션 삭제
		}
		
		//컬렉션 생성 및 인덱스 생성, MongoDB에서 데이터 가져오는 방식에 맞게 인덱스는 반드시 생성하자
		//데이터 양이 많지 않으면 문제되지 않으나, 최소 10만건이상 데이터 저장시 속도가 약 10배이상 차이
		mongodb.createCollection(colNm).createIndex(new BasicDBObject("collect_time", 1),"rankIdx");
		
		res = true;
		
		log.info(this.getClass().getName()+"createCollection End!");
		
		return res;
	}

	@Override
	public int insertRecipe(List<RecipeInfoDTO> rList, String colNm) throws Exception {
		//log.info("mapper insert colNm : " + colNm);
		for(int a=0;a<rList.size();a++) {
			rList.get(a).getRecipe_name();
			//log.info(rList.get(a).getRecipe_name());
			
		}
		
		
		int res = 0;

		Iterator<RecipeInfoDTO> it = rList.iterator();

		while (it.hasNext()) {
			RecipeInfoDTO rDTO = (RecipeInfoDTO) it.next();
			
			if (rDTO == null) {
				rDTO = new RecipeInfoDTO();
			}
			
			mongodb.insert(rDTO, colNm);
		}

		res = 1;

		return res;
	}
	
	@Override
	public List<String> getRecipeInfo(String colNm) throws Exception{
		
		//데이터를 가져올 컬렉션 선택
		DBCollection rCol = mongodb.getCollection(colNm);
		
		//컬렉션으로부터 데이터 가져오기
		Iterator<DBObject> cursor = rCol.find();
		
		//컬렉션으로부터 전체 데이터 가져온것을 List 형태로 저장하기 위한 변수 선언
		List<String> rList = new ArrayList<String>();
		
		while(cursor.hasNext()) {
			
			final DBObject current = cursor.next();
			
			//아이디 값으로 중복검사를 하기위해 id값을 가져옴
			String recipe_id = CmmUtil.nvl((String) current.get("recipe_id"));
			
			rList.add(recipe_id);
			
		}
		
		return rList;
		
	}
	
}
