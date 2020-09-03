package poly.service;

import java.util.List;
import java.util.Map;

public interface IRecipeDetailService {

	void collectRecipeDetail(String recipe_id) throws Exception;

	Map<String, Object> getRecipeDetail(String recipe_id)throws Exception;

	List<String> searchIngredient(String ingredient);

}
