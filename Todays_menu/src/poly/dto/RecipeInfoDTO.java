package poly.dto;

public class RecipeInfoDTO {

	private String recipe_id; // 레시피 아이디
	private String recipe_name; // 음식이름
	private String recipe_time; // 조리시간
	private String recipe_step; // 난이도
	private String recipe_material; // 재료
	private String recipe_personnel; // 인분
	private String recipe_cooking; // 조리법
	private String recipe_img; // 조리 사진
	private String recipe_main_img; // 메인 사진
	private String recipe_view_count;; //조회수
	private String recipe_recommended; //추천수
	

	public String getRecipe_view_count() {
		return recipe_view_count;
	}

	public void setRecipe_view_count(String recipe_view_count) {
		this.recipe_view_count = recipe_view_count;
	}

	public String getRecipe_recommended() {
		return recipe_recommended;
	}

	public void setRecipe_recommended(String recipe_recommended) {
		this.recipe_recommended = recipe_recommended;
	}

	public String getRecipe_main_img() {
		return recipe_main_img;
	}

	public void setRecipe_main_img(String recipe_main_img) {
		this.recipe_main_img = recipe_main_img;
	}

	public String getRecipe_img() {
		return recipe_img;
	}

	public void setRecipe_img(String recipe_img) {
		this.recipe_img = recipe_img;
	}

	public String getRecipe_id() {
		return recipe_id;
	}

	public void setRecipe_id(String recipe_id) {
		this.recipe_id = recipe_id;
	}

	public String getRecipe_name() {
		return recipe_name;
	}

	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}

	public String getRecipe_time() {
		return recipe_time;
	}

	public void setRecipe_time(String recipe_time) {
		this.recipe_time = recipe_time;
	}

	public String getRecipe_step() {
		return recipe_step;
	}

	public void setRecipe_step(String recipe_step) {
		this.recipe_step = recipe_step;
	}

	public String getRecipe_material() {
		return recipe_material;
	}

	public void setRecipe_material(String recipe_material) {
		this.recipe_material = recipe_material;
	}

	public String getRecipe_personnel() {
		return recipe_personnel;
	}

	public void setRecipe_personnel(String recipe_personnel) {
		this.recipe_personnel = recipe_personnel;
	}

	public String getRecipe_cooking() {
		return recipe_cooking;
	}

	public void setRecipe_cooking(String recipe_cooking) {
		this.recipe_cooking = recipe_cooking;
	}

}
