package poly.persistance.mongo;

import java.util.List;

import poly.dto.RecipeInfoDTO;

public interface IRecipeDetailMapper {

	void createDetailCollection(String colNm);

	void insertRecipeDetail(List<RecipeInfoDTO> rList, String colNm);

}
