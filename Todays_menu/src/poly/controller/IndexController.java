package poly.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mongodb.DBCollection;
import com.mongodb.DBObject;

import poly.dto.UserInfoDTO;
import poly.service.IDEService;
import poly.service.ILoginService;
import poly.service.ISignUpService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Controller
public class IndexController {
	private Logger log = Logger.getLogger(this.getClass().getName());


	@Autowired
	private MongoTemplate mongodb;

	@Resource(name = "DEService")
	private IDEService DEService;
	
	@Resource(name="SignUpService")
	private ISignUpService SignUpService;
	
	@Resource(name="LoginService")
	private ILoginService LoginService;
	
	//메인 페이지
	@RequestMapping(value = "/index")
	public String index() {
		log.info(this.getClass().getName() + "인덱스 시작");

		System.out.println("0 ~ 100 사이의 난수 1개 발생 : " + (int)(Math.random()*100));
		
		return "/index";
	}
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login")
	public String login() {
		log.info(this.getClass().getName() + "로그인 시작");

		return "/login";
	}
	
	//로그인 처리
	@RequestMapping(value="/login/ckeck")
	public String login_ckeck(HttpServletRequest request, ModelMap model, HttpSession session)
		throws Exception {
		log.info(this.getClass().getName()+"로그인 처리 시작");
		
		UserInfoDTO uDTO = null;
		
		uDTO = new UserInfoDTO();
		
		String user_email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("email")));
		String user_password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password")));
		log.info(user_email);
		log.info(user_password);
		
		uDTO.setUser_email(user_email);
		uDTO.setUser_password(user_password);
		log.info(uDTO.getUser_email());
		
		String res = "";
		
		try {
			
			 res = CmmUtil.nvl(LoginService.login_check(uDTO));
			
		}catch(Exception e){
			e.printStackTrace();
			log.info(e.toString());
		}
		
		log.info("로그인을 위한 확인 결과값 : "+res);
		
		if(res=="") {			//DB와 비교하여 이메일과 비밀번호가 일치하지 않는경우
			
			model.addAttribute("url","/index.do");
			model.addAttribute("msg","이메일 또는 비밀번호가 일치하지 않습니다!");
			
			return "/redirect";
			
		}else {					//DB에 회원정보가 있는 경우
			session.setAttribute("SS_EMAIL", CmmUtil.nvl(user_email));	//세션에 email 정보를 올려놓는다
			log.info("세션에 올라간 유저 email :"+(String) session.getAttribute("SS_EMAIL"));
			
			model.addAttribute("url","/index.do");
			model.addAttribute("msg","로그인 되었습니다!");
			
			return "/redirect";
		}
			
	}
	
	//로그아웃 처리
	@RequestMapping(value="/logout")
	public String logout(ModelMap model, HttpSession session) {
		
		session.invalidate();
		
		model.addAttribute("msg","로그아웃 되었습니다");
		model.addAttribute("url","/index.do");
		
		return "/redirect";
	}
	
	//마이페이지 이동
	@RequestMapping(value="/my_page")
	public String my_page(HttpSession session, Model model) {
		log.info(this.getClass().getName() + "마이 페이지 시작");
		
		
		try {
			if(EncryptUtil.decAES128CBC((String) session.getAttribute("SS_EMAIL")).equals("nymjae@naver.com")) {
				List<UserInfoDTO> uList = new ArrayList<>();
				
				uList = LoginService.getUserInfo();
				
				if(uList==null) {
					uList = new ArrayList<>();
				}
				
				model.addAttribute("uList",uList);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/my_page";
	}
	
	//나의 냉장고
	@RequestMapping(value="/my_mune")
	public String my_mune(HttpSession session,Model model) {
		
		String user_email = (String) session.getAttribute("SS_EMAIL");
		
		String my_ig = CmmUtil.nvl(LoginService.getMy_ig(user_email));
		
		model.addAttribute("my_ig",my_ig);
		
		return "/my_mune";
	}
	
	//나의 냉장고 재료 저장
	@RequestMapping(value="/my_ig_save")
	public String my_ig_save(HttpServletRequest request) {
		
		String my_ig = request.getParameter("my_ig");
		
		LoginService.my_ig_save(my_ig);
		
		return "/my_mune";
	}
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/sign_up")
	public String sign_up() {
		log.info(this.getClass().getName() + "회원가입 페이지 시작");

		return "/sign_up";
	}
	
	//회원가입 처리
	@RequestMapping(value = "/sign_up/insert_user")
	public String insert_user(HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "회원가입 시작");
		
		UserInfoDTO uDTO = null;
		
		uDTO = new UserInfoDTO();
		
		String user_email = CmmUtil.nvl(request.getParameter("email"));
		String user_password = CmmUtil.nvl(request.getParameter("password1"));
		
		log.info("user_email : " + user_email);
		log.info("user_password : " + user_password);
		
		uDTO.setUser_email(EncryptUtil.encAES128CBC(user_email));
		uDTO.setUser_password(EncryptUtil.encHashSHA256(user_password));
		log.info("email : " + uDTO.getUser_email());
		log.info("pw : " + uDTO.getUser_password());
		int res = 0;
		
		
		try {
			
			 res = SignUpService.insert_user(uDTO);
			
			
		}catch(Exception e) {
			
		}
		
		
		
		if(res<0) {
			model.addAttribute("url","/index.do");
			model.addAttribute("msg","이미 가입된 이메일 입니다.");
			
			return "/redirect";
		}else {
			
			model.addAttribute("url","/index.do");
			model.addAttribute("msg","가입되었습니다.");
			
			return "/redirect";
		}
		
	}
	
	//회원탈퇴(유저삭제)
	@RequestMapping(value="/userDelete")
	public String userDelete(HttpServletRequest request, Model model)throws Exception {
		String user_seq_no = request.getParameter("user_no");
		
		int res = 0;
		
		res = LoginService.userDelete(user_seq_no);
		
		if(res==1) {
			model.addAttribute("url","/my_page.do");
			model.addAttribute("msg","탈퇴되었습니다.");
		}else {
			model.addAttribute("url","/my_page.do");
			model.addAttribute("msg","오류가 발생했습니다. 잠시후에 다시 시도해주세요");
		}
		
		return "/redirect";
	}
	
	//이메일 수정 처리
	@RequestMapping(value="/emailModify")
	public String emailModify(HttpServletRequest request, ModelMap model, HttpSession session)throws Exception {
		log.info(this.getClass().getName()+"이메일 수정 처리 시작");
		
		UserInfoDTO uDTO = null;
		
		uDTO = new UserInfoDTO();
		
		String user_email = CmmUtil.nvl(request.getParameter("email"));
		log.info("변경할 email : "+user_email);
		
		user_email = EncryptUtil.encAES128CBC(user_email);
		
		String ss_email = (String)session.getAttribute("SS_EMAIL");
		log.info("기존 email : "+ss_email);
		uDTO.setUser_email(user_email);
		uDTO.setSs_email(ss_email);
		
		int res = 0;
		
		try {
			
			res = SignUpService.exists_user(uDTO);
			
		}catch(Exception e){
			
		}
		
		log.info("이메일 수정 처리를 위한 결과값 res : " + res);
		
		if(res<0) {
			model.addAttribute("url","/index.do");
			model.addAttribute("msg","이미 가입된 이메일 입니다.");
			
			return "/redirect";
		}else {
			
			model.addAttribute("url","/index.do");
			model.addAttribute("msg","수정되었습니다.");
			
			log.info("########세션 삭제 전");
			
			session.removeAttribute("SS_EMAIL");
			
			log.info("########세션 삭제 후");
			
			session.setAttribute("SS_EMAIL", CmmUtil.nvl(user_email));	//세션에 email 정보를 올려놓는다
			log.info("세션에 올라간 유저 email :"+(String) session.getAttribute("SS_EMAIL"));
			
			log.info("########세션 삭제 후 세션 올리기");
			
			return "/redirect";
		}
		
	}
	
	//비밀번호 수정
	@RequestMapping(value="/passwordModify.do")
	public String passwordModify(HttpServletRequest request, ModelMap model, HttpSession session)throws Exception {
		
		String user_password = EncryptUtil.encHashSHA256(request.getParameter("password1"));
		String ss_email = (String)session.getAttribute("SS_EMAIL");
		
		UserInfoDTO uDTO = null;
		
		uDTO = new UserInfoDTO();
		
		uDTO.setUser_password(user_password);
		uDTO.setSs_email(ss_email);
		
		int res = SignUpService.update_password(uDTO);
		
		log.info("비밀번호 변경을 위한 결과값 res : "+ res);
		
		if(res==1) {
			model.addAttribute("url","/my_page.do");
			model.addAttribute("msg","비밀번호 변경 완료");
		}else {
			model.addAttribute("url","/my_page.do");
			model.addAttribute("msg","변경 실패! 잠시뒤에 다시 시도해주세요");
		}
		
		return "/redirect";
	}
	

	//조리시간별 레시피
	@RequestMapping(value="/cooktime_details")
	public String cooktime_details() {
		log.info(this.getClass().getName()+"조리시간별레시피 디테일 시작");
		
		return "/cooktime_details";
	}
	
	//재료별  레시피
	@RequestMapping(value="/ingredient_details")
	public String ingredient_details() {
		log.info(this.getClass().getName()+"재료별레시피 디테일 시작");
		
		return "/ingredient_details";
	}
	
	//인기 레시피
	@RequestMapping(value="/popular_details")
	public String popular_details(ModelMap model) {
		log.info(this.getClass().getName()+"인기레시피 디테일 시작");
		
		//데이터를 가져올 컬렉션 선택
		DBCollection rCol = mongodb.getCollection("RecipeList");	
		
		//컬렉션으로부터 데이터 가져오기
		Iterator<DBObject> cursor = rCol.find();
		
		List<String> rList = new ArrayList<String>();	//메인 이미지를 담을 리스트
		List<String> r2List = new ArrayList<String>();	//레시피 제목을 담을 리스트
		List<String> r3List = new ArrayList<String>();	//레시피 아이디를 담을 리스트
		
		int i = 0;
		
		while(cursor.hasNext()) {
			
			final DBObject current = cursor.next();
			
			//메인 이미지 가져오기
			String recipe_main_img = CmmUtil.nvl((String) current.get("recipe_main_img"));
			
			//레시피 제목 가져오기
			String recipe_name = CmmUtil.nvl((String) current.get("recipe_name"));
			
			//레시피 아이디
			String recipe_id = CmmUtil.nvl((String) current.get("recipe_id"));
			
			rList.add(recipe_main_img);
			r2List.add(recipe_name);
			r3List.add(recipe_id);
			
			i++;
		}
		
		log.info("리스트 총 갯수 : " + i);
		
		//리스트 마지막 번호가 나올시 나올 번호가 더 이상 없어 오류가 생길수 있기때문에 보여지는 리스트갯수인 12개를 빼준다
		i = i - 12; 
		
		int random = 0;
		
		random = (int)(Math.random()*i);
		
		System.out.println("0 ~ 리스트 총 갯수 사이의 난수 1개 발생 : " + random);
		
		model.addAttribute("rList", rList);
		model.addAttribute("r2List", r2List);
		model.addAttribute("r3List", r3List);
		model.addAttribute("random",random);
		
		rList =null;
		r2List=null;
		r3List=null;
		
		return "/popular_details";
	}
	
	//인원수별 레시피
	@RequestMapping(value="/personnel_details")
	public String personnel_details() {
		log.info(this.getClass().getName()+"인원수별레시피 디테일 시작");
		
		return "/personnel_details";
	}
	
	//난이도별 레시피
	@RequestMapping(value="/step_details")
	public String step_details() {
		log.info(this.getClass().getName()+"난이도별레시피 디테일 시작");
		
		return "/step_details";
	}

}
