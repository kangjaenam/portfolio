package poly.persistance.mongo;

import java.util.List;

import poly.dto.RecipeInfoDTO;

public interface IRecipeListMapper {

	/**
	 * MongoDB 컬렉션 생성하기
	 * 
	 * @param colNm 생성하는 컬렉션 이름
	 */
	public boolean createCollection(String colNm) throws Exception;
	
	/**
	 * MongoDB 데이터 저장하기
	 * 
	 * @param rDTO 저장할 정보
	 */
	public int insertRecipe(List<RecipeInfoDTO>rList, String colNm) throws Exception;

	public List<String> getRecipeInfo(String colNm) throws Exception;


	
}
