package poly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.RecipeInfoDTO;
import poly.service.IRecipeDetailService;
import poly.service.IRecipeListService;
import poly.util.CmmUtil;

@Controller
public class RecipeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="RecipeListService")
	private IRecipeListService recipeListService;
	
	@Resource(name="RecipeDetailService")
	private IRecipeDetailService recipeDetailService;
	
	//하루 한번씩 (오전)2시에 주기적 크롤링 
	@Scheduled(cron="0 0 2 * * *")
	public void run()throws Exception {
		log.info("크롤링 주기적 실행 시작");
		
		try {
			
			recipeListService.collectRecipeList();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		log.info("크롤링 주기적 실행 끝");
	}
	
	public class TestJob implements Job {
	    @Override
	    public void execute(JobExecutionContext arg0) throws JobExecutionException {
	        System.out.println("Job Executed [" + new Date(System.currentTimeMillis()) + "]"); 
	    }
	}
	
	//주기적 크롤링이 있어서 필요없지만 수동적으로 할때를 위해 남겨둠..
	@RequestMapping(value = "/recipe/collectRecipeList")
	@ResponseBody
	public String collectRecipeList()throws Exception{
		
		log.info(this.getClass().getName()+".collectRecipeList Start!");
			
		recipeListService.collectRecipeList();
		
		log.info(this.getClass().getName()+".collectRecipeList End!");
		
		return "success";
	}
		
	@RequestMapping(value="/recipe/getRecipeInfo")
	@ResponseBody
	public List<RecipeInfoDTO> getRecipeInfo()throws Exception{
		
		List<RecipeInfoDTO> rList = recipeListService.getRecipeInfo();
		
		if(rList==null) {
			rList = new ArrayList<RecipeInfoDTO>();
		}
		
		return rList;
	}
	
	//조리시간별 레시피 시간 선택시
	@RequestMapping(value="/recipe/cookTime_select")
	public String cookTime_select(HttpServletRequest request, Model model) {
		log.info(this.getClass().getName()+"조리시간 선택시 시작!");
		
		String cookTime = CmmUtil.nvl(request.getParameter("time"));	//사용자가 고른 시간 받아오기
		
		List<String> recipe_id_list = new ArrayList<>();
		List<String> recipe_main_img_list = new ArrayList<String>();
		List<String> recipe_name_list = new ArrayList<String>();
		
		Map<String, Object> pMap = new HashMap<>();
		List<String> pList = new ArrayList<>();
		
		//사용자가 고른시간에 해당하는 레시피 아이디들 가져오기        
		recipe_id_list = recipeListService.getRecipeList(cookTime);
		
		if(recipe_id_list==null) {
			recipe_id_list = new ArrayList<>();
		}else {
			if(recipe_id_list.size()>12) {
				for(int i=0; i< 12; i++) {
					pList.add(recipe_id_list.get(i));	
				}
			}else {
				for(int i=0; i< recipe_id_list.size(); i++) {
					pList.add(recipe_id_list.get(i));	
				}
			}
			 
			pMap = recipeListService.getRecipeListById(pList);
			
			recipe_main_img_list = (List<String>) pMap.get("recipe_main_img_list");
			recipe_name_list = (List<String>) pMap.get("recipe_name_list");
			
			model.addAttribute("recipe_id_list",recipe_id_list);
			model.addAttribute("recipe_main_img_list",recipe_main_img_list);
			model.addAttribute("recipe_name_list",recipe_name_list);
		 
			pMap = null;
			recipe_id_list = null;
			recipe_main_img_list= null;
			recipe_name_list= null;
			
		 log.info(this.getClass().getName()+"조리시간 선택 시 끝!");
		}
		 
		
		
		return "/recipeList";	
	}
	
	//레시피 디테일
	@RequestMapping(value="/recipe/recipeDetail")
	public String RecipeDetail(HttpServletRequest request, Model model) {
		log.info(this.getClass().getName()+"레시피 디테일 시작");
		
		//레시피 아이디의 값으로 상세페이지를 불러 오기 위한 아이디값 받기
		String recipe_id = CmmUtil.nvl(request.getParameter("Recipe_id"));
		String recipe_main_img = CmmUtil.nvl(request.getParameter("recipe_main_img"));
		String recipe_name = CmmUtil.nvl(request.getParameter("recipe_name"));
		
		log.info("받아온 레시피 아이디 값 확인 : " + recipe_id);
		log.info("받아온 레시피 제목 값 확인 : " + recipe_name);
		
		try {
			
			Map<String, Object> recipe_Map = recipeDetailService.getRecipeDetail(recipe_id);
			if(recipe_Map==null) {
				recipe_Map = new HashMap<>();
			}else {
				List<String> cooking_list = (List<String>)recipe_Map.get("cooking_list");
				List<String> img_list = (List<String>)recipe_Map.get("img_list");
				RecipeInfoDTO rDTO = (RecipeInfoDTO)recipe_Map.get("rDTO");
				rDTO.setRecipe_main_img(recipe_main_img);
				rDTO.setRecipe_name(recipe_name);
				for(int i = 0; i<cooking_list.size();i++) {
					log.info("cooking_list : "+cooking_list.get(i) );
					log.info("img_list : "+img_list.get(i) );
				}
				log.info("디테일로 넘어가는 레시피 제목 값 : " + rDTO.getRecipe_name()); //이거 안나옴..
				model.addAttribute("cooking_list",cooking_list);
				model.addAttribute("img_list",img_list);
				model.addAttribute("rDTO",rDTO);
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		return "/recipeDetail";
	}
	
	//레시피 검색창
	@RequestMapping(value="/recipe/recipeSearch")
	public String recipeSearch(HttpServletRequest request, Model model) {
		log.info(this.getClass().getName()+"레시피 검색창 시작");
		
		//사용자가 검색한 내용
		String recipeSearch = request.getParameter("recipeSearch");
			
		log.info("사용자가 검색한 레시피명 : " + recipeSearch);
		
		Map<String, Object> pMap = new HashMap<>();
		
		pMap = recipeListService.getSearchRecipeList(recipeSearch);
		
		if(pMap==null) {
			pMap = new HashMap<>();
		}else {
			
			List<String> recipe_main_img_list = (List<String>)pMap.get("recipe_main_img_list");
			List<String> recipe_name_list = (List<String>)pMap.get("recipe_name_list");
			List<String> recipe_id_list = (List<String>)pMap.get("recipe_id_list");
			
			model.addAttribute("recipe_main_img_list",recipe_main_img_list);
			model.addAttribute("recipe_name_list",recipe_name_list);
			model.addAttribute("recipe_id_list",recipe_id_list);
			
			}
				
		pMap = null;

		return "/recipeList";
		}
	
	//인원수별 레시피
	@RequestMapping(value="/recipe/personnel_select")
	public String personnel_select(HttpServletRequest request, Model model) {
		log.info(this.getClass().getName()+"인분별 선택 시작!");
		
		String personnel = CmmUtil.nvl(request.getParameter("personnel"));
		if(personnel.equals("")) {
			return "/index";
		}
		if(Integer.parseInt(personnel)>5||Integer.parseInt(personnel)<0) {
			return "/index"; //예외처리
		}
		
		log.info("사용자가 선택한 인분 : " + personnel);
		
		List<String> recipe_id_list = new ArrayList<>();
		List<String> recipe_main_img_list = new ArrayList<String>();
		List<String> recipe_name_list = new ArrayList<String>();
		Map<String,Object> pMap = new HashMap<>();
		
		List<String> pList = new ArrayList<>();
		
		recipe_id_list = recipeListService.getPersonnelRecipeList(personnel); //이거부터 문제였음
		
		
		if(recipe_id_list==null) {
			recipe_id_list = new ArrayList<>();
		}else {
			if(recipe_id_list.size()>12) {
				for(int i=0; i< 12; i++) {
					pList.add(recipe_id_list.get(i));	
				}
			}else {
				for(int i=0; i< recipe_id_list.size(); i++) {
					pList.add(recipe_id_list.get(i));	
				}
			}
			pMap = recipeListService.getRecipeListById(pList);
			
			recipe_main_img_list = (List<String>) pMap.get("recipe_main_img_list");
			recipe_name_list = (List<String>) pMap.get("recipe_name_list");
			
			model.addAttribute("recipe_id_list",recipe_id_list);
			model.addAttribute("recipe_main_img_list",recipe_main_img_list);
			model.addAttribute("recipe_name_list",recipe_name_list);			
		}
		
		pMap = null;
		recipe_id_list = null;
		recipe_main_img_list= null;
		recipe_name_list= null;
		
		return "/recipeList";
		
	}
	
	//난이도별 레시피 선택 시
	@RequestMapping(value="/recipe/select_step")
	public String select_setp(HttpServletRequest request, Model model) {
		log.info(this.getClass().getName()+"난이도별 레시피 선택 시작!");
		
		String step = request.getParameter("step"); //사용자가 선택한 난이도
		
		List<String> recipe_id_list = new ArrayList<>();
		List<String> recipe_main_img_list = new ArrayList<String>();
		List<String> recipe_name_list = new ArrayList<String>();
		Map<String,Object> pMap = new HashMap<>();		
		List<String> pList = new ArrayList<>();
		
		recipe_id_list = recipeListService.getStepRecipeList(step);

		if(recipe_id_list==null) {
			recipe_id_list = new ArrayList<>();
		}else {
			if(recipe_id_list.size()>12) {
				for(int i=0; i< 12; i++) {
					pList.add(recipe_id_list.get(i));	
				}
			}else {
				for(int i=0; i< recipe_id_list.size(); i++) {
					pList.add(recipe_id_list.get(i));	
				}
			}
			pMap = recipeListService.getRecipeListById(pList);
			
			recipe_main_img_list = (List<String>) pMap.get("recipe_main_img_list");
			recipe_name_list = (List<String>) pMap.get("recipe_name_list");
			
			model.addAttribute("recipe_id_list",recipe_id_list);
			model.addAttribute("recipe_main_img_list",recipe_main_img_list);
			model.addAttribute("recipe_name_list",recipe_name_list);			
		}
		
		
		pMap = null;
		recipe_id_list = null;
		recipe_main_img_list= null;
		recipe_name_list= null;
			
		return "/recipeList";
		
	}
	
	
	//재료별 선택 재료 검색 
	@RequestMapping(value="/recipe/ingredient_select")
	public String ingredient_select(HttpServletRequest request, Model model) {
		log.info(this.getClass().getName()+"재료별 선택 재료검색 시작!");
		
		String ingredient = request.getParameter("ingredient");
		
		log.info("사용자가 검색한 재료명들 : "+ingredient);
		
		String words [] = ingredient.split(",");
		
		for(String word : words) {
			log.info("사용자가 검색한 재료 : "+word);
		}
		
		log.info("배열크기 : "+words.length);
		
		
		List<String> recipe_id_list = new ArrayList<>();
		List<String> recipe_main_img_list = new ArrayList<String>();
		List<String> recipe_name_list = new ArrayList<String>();
		List<String> pList = new ArrayList<>();
		Map<String,Object> pMap = new HashMap<>();		
		
		recipe_id_list = recipeDetailService.searchIngredient(ingredient);
		
		if(recipe_id_list==null) {
			recipe_id_list = new ArrayList<>();
		}else {
			if(recipe_id_list.size()>12) {
				for(int i=0; i< 12; i++) {
					pList.add(recipe_id_list.get(i));	
				}
			}else {
				for(int i=0; i< recipe_id_list.size(); i++) {
					pList.add(recipe_id_list.get(i));	
				}
			}
			
			pMap = recipeListService.getRecipeListById(pList);
		
			recipe_main_img_list = (List<String>) pMap.get("recipe_main_img_list");
			recipe_name_list = (List<String>) pMap.get("recipe_name_list");
			
			model.addAttribute("recipe_id_list",recipe_id_list);
			model.addAttribute("recipe_main_img_list",recipe_main_img_list);
			model.addAttribute("recipe_name_list",recipe_name_list);		
			
		
		}
		return "/recipeList";
	}
}