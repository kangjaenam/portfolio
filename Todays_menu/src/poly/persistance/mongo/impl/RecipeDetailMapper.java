package poly.persistance.mongo.impl;

import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import com.mongodb.BasicDBObject;

import poly.dto.RecipeInfoDTO;
import poly.persistance.mongo.IRecipeDetailMapper;

@Component("RecipeDetailMapper")
public class RecipeDetailMapper implements IRecipeDetailMapper{
	
	@Autowired
	private MongoTemplate mongodb;
	
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public void createDetailCollection(String colNm) {
		log.info("mapper create colNm : " + colNm);
		log.info(this.getClass().getName() + "createDetailCollection Start!");
		
		
		//기존에 등록된 컬렉션 이름이 존재하는지 체크하고, 존재하면 기존 컬렉션 삭제함
		if(mongodb.collectionExists(colNm)) {
			mongodb.dropCollection(colNm);	//기존 컬렉션 삭제
		}
		
		//컬렉션 생성 및 인덱스 생성, MongoDB에서 데이터 가져오는 방식에 맞게 인덱스는 반드시 생성하자
		//데이터 양이 많지 않으면 문제되지 않으나, 최소 10만건이상 데이터 저장시 속도가 약 10배이상 차이
		mongodb.createCollection(colNm).createIndex(new BasicDBObject("collect_time", 1),"rankIdx");
						
		log.info(this.getClass().getName()+"createDetailCollection End!");
		
	}

	@Override
	public void insertRecipeDetail(List<RecipeInfoDTO> rList, String colNm) {
		log.info("mapper insert colNm : " + colNm);
		for(int a=0;a<rList.size();a++) {
			rList.get(a).getRecipe_time();
			rList.get(a).getRecipe_cooking();
			//log.info(rList.get(a).getRecipe_time());
			//log.info(rList.get(a).getRecipe_cooking());	
		}	
		
		Iterator<RecipeInfoDTO> it = rList.iterator();
		
		while (it.hasNext()) {
			RecipeInfoDTO rDTO = (RecipeInfoDTO) it.next();
			
			mongodb.insert(rDTO, colNm);
		}
	}

}
