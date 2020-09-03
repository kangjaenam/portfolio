package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.RecipeInfoDTO;

public interface IRecipeListService {

	/**
	 * 레시피 사이트 크롤링
	 */
	public void collectRecipeList() throws Exception;

	List<RecipeInfoDTO> getRecipeInfo() throws Exception;

	public List<String> getRecipeList(String cookTime);

	public Map<String, Object> getSearchRecipeList(String recipeSearch);

	public List<String> getPersonnelRecipeList(String personnel);

	public Map<String, Object> getRecipeListById(List<String> recipe_id_list);

	public List<String> getStepRecipeList(String step);
}
