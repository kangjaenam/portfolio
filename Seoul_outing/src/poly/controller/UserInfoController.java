package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.MailDTO;
import poly.dto.NoticeDTO;
import poly.dto.UserInfoDTO;
import poly.service.IMailService;
import poly.service.INoticeService;
import poly.service.IUserInfoService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 */
@Controller
public class UserInfoController {
	private Logger log = Logger.getLogger(this.getClass());

	/*
	 * 비지니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 */
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	@Resource(name = "UserInfoService")
	private IUserInfoService userInfoService;

	/*
	 * 메일발송 로직
	 */
	@Resource(name = "MailService")
	private IMailService mailService;

	/**
	 * 로그인을 위한 입력 화면으로 이동
	 */
	@RequestMapping(value = "user/loginForm")
	public String loginForm() {
		log.info(this.getClass().getName() + ".user/loginForm ok!");

		return "/user/LoginForm";
	}

	/**
	 * 메인 화면 이동
	 */
	@RequestMapping(value = "user/main")
	public String loginMain() {
		log.info(this.getClass().getName() + ".user/Main ok!");

		return "/user/Main";
	}

	/**
	 * 내 주변 관광지
	 */
	@RequestMapping(value = "user/near")
	public String near(ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".user/Near ok!");

		List<HashMap<String, Object>> nList = new ArrayList<>();

		nList = noticeService.getMarker();
		JSONArray jsonArray = new JSONArray(nList);
		model.addAttribute("nList", jsonArray);
		return "/user/Near";
	}

	/**
	 * 지역별 관광지
	 */
	@RequestMapping(value = "user/area")
	public String area() {
		log.info(this.getClass().getName() + ".user/area ok!");

		return "/user/Area";
	}

	/**
	 * 유형별 관굉지
	 */
	@RequestMapping(value = "user/type")
	public String type() {
		log.info(this.getClass().getName() + ".user/type ok!");

		return "/user/Type";
	}

	/**
	 * 비밀번호 찾기
	 */
	@RequestMapping(value = "user/fndpass")
	public String fndPass() {
		log.info(this.getClass().getName() + ".user/fndpass ok!");

		return "/user/FndPass";
	}

	/**
	 * 로그아웃
	 */
	@RequestMapping(value = "logout")
	public String logout(HttpSession session, ModelMap model) throws Exception {

		session.invalidate();
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/user/main.do");
		return "/redirect";
	}

	/**
	 * 마이페이지
	 */
	@RequestMapping(value = "user/mypage")
	public String mypage(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + ".user/mypage ok!");

		// 현재 페이지 받음
		int PgNum = 1;
		if (request.getParameter("PgNum") != null && !request.getParameter("PgNum").equals("")) {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
			log.info("PgNum : " + PgNum);
		}

		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();

		String user_no = (String) session.getAttribute("SS_USER_NO");
		
		int total = noticeService.countMyReview(user_no); // 내가 쓴 리뷰 총 갯수
		
		log.info("내가 쓴 리뷰 총 갯수 total : "+total);
		
		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setStartNum((PgNum - 1) * 20 + 1);
		pDTO.setEndNum((PgNum * 20));
		pDTO.setUser_no(user_no);

		nList = noticeService.getMyReview(pDTO);
		if (nList == null) {
			nList = new ArrayList<NoticeDTO>();
		}
		model.addAttribute("nList", nList);
		model.addAttribute("total",total);
		model.addAttribute("PgNum",PgNum);
		
		
		return "/user/MyPage";
	}

	/**
	 * 마이페이지 이메일, 닉네임 수정
	 */
	@RequestMapping(value = "user/modifyEmail")
	public String modifyEmail(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".user/modifyEmail ok!");

		String orgEmail = CmmUtil.nvl((String) session.getAttribute("SS_EMAIL"));
		String email = CmmUtil.nvl(request.getParameter("email"));
		String nickname = CmmUtil.nvl(request.getParameter("nickname"));

		String orgNickname = CmmUtil.nvl((String) session.getAttribute("SS_NICKNAME"));
		String user_no = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));

		log.info("email : " + email);
		log.info("nickname : " + nickname);

		UserInfoDTO pDTO = null;

		pDTO = new UserInfoDTO();

		pDTO.setOrgEmail(EncryptUtil.encAES128CBC(orgEmail));
		pDTO.setEmail(EncryptUtil.encAES128CBC(email));
		pDTO.setOrgNickname(orgNickname);
		pDTO.setNickname(nickname);
		pDTO.setUser_no(user_no);

		int res = userInfoService.modifyEmail(pDTO);

		if (res == 0) {
			model.addAttribute("msg", "회원정보 갱신에 실패하였습니다. 잠시 뒤에 다시 시도해주세요");
			model.addAttribute("url", "/user/mypage.do");
		} else if (res == 2) {
			model.addAttribute("msg", "이미 사용중인 이메일 입니다.");
			model.addAttribute("url", "/user/mypage.do");
		} else if (res == 3) {
			model.addAttribute("msg", "이미 사용중인 닉네임 입니다.");
			model.addAttribute("url", "/user/mypage.do");
		} else if (res == 4) {
			model.addAttribute("msg", "기존 이메일과 닉네임 입니다.");
			model.addAttribute("url", "/user/mypage.do");
		} else {
			session.setAttribute("SS_EMAIL", email);
			session.setAttribute("SS_NICKNAME", nickname);
			model.addAttribute("msg", "회원정보가 변경되었습니다.");
			model.addAttribute("url", "/user/mypage.do");
		}

		pDTO = null;

		return "/redirect";
	}

	/**
	 * 마이페이지 비밀번호 수정
	 */
	@RequestMapping(value = "user/modifyPassword")
	public String modifyPassword(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".modifyPassword start!");

		String password = CmmUtil.nvl(request.getParameter("password"));
		String password2 = CmmUtil.nvl(request.getParameter("password2"));
		String user_no = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));

		UserInfoDTO pDTO = null;

		pDTO = new UserInfoDTO();

		pDTO.setUser_no(user_no);
		pDTO.setPassword(EncryptUtil.encHashSHA256(password));

		if (password.equals(password2)) {

			int res = userInfoService.modifyPassword(pDTO);

			if (res == 1) {
				model.addAttribute("msg", "비밀번호가 수정되었습니다.");
				model.addAttribute("url", "/user/mypage.do");
			} else {
				model.addAttribute("msg", "오류가 발생하였습니다 잠시뒤에 시도해주세요.");
				model.addAttribute("url", "/user/mypage.do");
			}

		} else {
			model.addAttribute("msg", "비밀번호를 다시 확인해주세요.");
			model.addAttribute("url", "/user/mypage.do");
		}

		return "/redirect";
	}

	/**
	 * 회원탈퇴
	 */
	@RequestMapping(value = "user/userdelete")
	public String userDelete(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + "userDelete start!");

		String user_no = CmmUtil.nvl(request.getParameter("no")); // 마이페이지에서 넘겨받은 탈퇴를 하려는 유저 시퀀스 값
		if (user_no.equals("undefined")) {
			model.addAttribute("msg", "회원을 선택해주세요");
			model.addAttribute("url", "/admin/management.do");
			return "/redirect";
		}
		if (user_no.equals(session.getAttribute("SS_USER_NO"))) {

			model.addAttribute("msg", "자신의 관리자 계정은 탈퇴 불가능 합니다.");
			model.addAttribute("url", "/admin/management.do");
			return "/redirect";
		}
		log.info("user_no : " + user_no);
		UserInfoDTO pDTO = null;

		pDTO = new UserInfoDTO();

		pDTO.setUser_no(user_no);

		int res = userInfoService.userDelete(pDTO);

		if (res == 0) {
			model.addAttribute("msg", "오류가 발생 했습니다 잠시뒤에 다시 시도해 주세요.");
			model.addAttribute("url", "/user/mypage.do");
		} else {

			if (session.getAttribute("SS_AUTHORITY").equals("0")) {
				model.addAttribute("msg", "회원 탈퇴 되었습니다.");
				model.addAttribute("url", "/admin/management.do");
			} else {
				model.addAttribute("msg", "회원 탈퇴 되었습니다.");
				model.addAttribute("url", "/user/main.do");
				session.invalidate();
			}

		}

		return "/redirect";
	}

	/**
	 * 로그인 처리 및 결과 알려주는 화면으로 이동
	 */
	@RequestMapping(value = "user/getUserLoginCheck")
	public String getUserLoginCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".getUserLoginCheck start!");

		// 웹(회원정보 입력화면)에서 받는 정보를 저장할 변수
		UserInfoDTO pDTO = null;
		/*
		 * ############################################################ 웹(회원정보 입력화면)에서
		 * 받는 정보를 String 변수에 저장 시작!!
		 * 
		 * 무조건 웹으로 받은 정보는 DTO에 저장하기 위해 임시로 String 변수에 저장함
		 * ############################################################
		 */
		String email = CmmUtil.nvl(request.getParameter("email")); // 이메일
		String password = CmmUtil.nvl(request.getParameter("password")); // 비밀번호

		/*
		 * ############################################################ 웹(회원정보 입력화면)에서
		 * 받는 정보를 String 변수에 저장 끝!!
		 * 
		 * 무조건 웹으로 받은 정보는 DTO에 저장하기 위해 임시로 String 변수에 저장함
		 * ############################################################
		 */

		/*
		 * ###############################################################
		 * 
		 * 반드시 값을 받았으면 로그를 찍어 값이 제대로 들어오는지 파악!!
		 * 
		 * ###############################################################
		 */
		log.info("email : " + email);
		log.info("password : " + password);

		/*
		 * ############################################################### 웹(회원정보
		 * 입력화면)에서 받는 정보를 DTO에 저장하기 시작!!
		 * 
		 * 무조건 웹으로 받은 정보는 DTO에 저장해야 한다고 이해하길 권함
		 * ###############################################################
		 */

		// 웹(회원정보 입력화면)에서 받는 정보를 저장할 변수를 메모리에 올리기
		pDTO = new UserInfoDTO();

		pDTO.setEmail(EncryptUtil.encAES128CBC(email));
		pDTO.setPassword(EncryptUtil.encHashSHA256(password));

		/*
		 * ############################################################### 웹(회원정보
		 * 입력화면)에서 받는 정보를 DTO에 저장하기 끝!!
		 * 
		 * 무조건 웹으로 받은 정보는 DTO에 저장해야 한다고 이해하길 권함
		 * ###############################################################
		 */

		// 로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위한 userInfoService 호출하기
		pDTO = userInfoService.getUserLoginCheck(pDTO);

		String state = "-1";

		try {
			state = CmmUtil.nvl(pDTO.getState());

			log.info("회원 상태 확인 : " + state);

		} catch (Exception e) {

			e.printStackTrace();

		}

		/*
		 * 로그인을 성공했다면, 회원아이디 정보를 session에 저장함
		 * 
		 * 세션은 톰캣(was)의 메모리에 존재하며, 웹사이트에 접속한 사람(연결된 객체)마다 메모리에 값을 올린다.
		 * 
		 * 예) 톰켓에 100명의 사용자가 로그인했다면, 사용자 각각 회원아이디를 메모리에 저장하며. 메모리에 저장된 객체의 수는 100개이다.
		 * 따라서 과도한 세션은 톰켓의 메모리 부하를 발생시켜 서버거가 다운되는 현상이 있을수 있기 때문에, 최소한으로 사용하는 것을 권장한다.
		 * 
		 * 스프링에서 세션을 사용하기 위해서는 함수명의 파라미터에 HttpSession session 존재해야 한다. 세션은 톰켓의 메모리에 저장되기
		 * 때문에 url마다 전달하는게 필요하지 않고, 그냥 메모리에서 부르면 되기 때문에 jsp, controller에서 쉽게 불러서 쓸 수 있다.
		 */
		if (state.equals("0")) {

			/*
			 * 세션에 회원아이디 저장하기, 추후 로그인 여부를 체크하기 위해 세션에 값이 존재하는지 체크한다. 일반적으로 세션에 저장되는 키는 대문자로
			 * 입력하며, 앞에 SS를 붙인다.
			 * 
			 * Session 단어에서 SS를 가져온 것이다.
			 */
			String authority = pDTO.getAuthority();
			String nickname = pDTO.getNickname();
			String user_no = pDTO.getUser_no();

			if (authority.equals("0")) {
				model.addAttribute("msg", "관리자 로그인 성공");
			} else {
				model.addAttribute("msg", "로그인 성공");
			}

			model.addAttribute("url", "/user/main.do");

			session.setAttribute("SS_AUTHORITY", authority);
			session.setAttribute("SS_EMAIL", email);
			session.setAttribute("SS_NICKNAME", nickname);
			session.setAttribute("SS_USER_NO", user_no);

			log.info("세션에 받아오는 값 SS_AUTHORITY : " + session.getAttribute("SS_AUTHORITY"));
			log.info("세션에 받아오는 값 SS_EMAIL : " + session.getAttribute("SS_EMAIL"));
			log.info("세션에 받아오는 값 SS_NICKNAME : " + session.getAttribute("SS_NICKNAME"));
			log.info("세션에 받아오는 값 SS_USER_NO : " + session.getAttribute("SS_USER_NO"));

		} else if (state.equals("1")) {
			model.addAttribute("msg", "정지회원입니다.");
			model.addAttribute("url", "/user/loginForm.do");
		} else {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "/user/loginForm.do");
		}

		return "redirect";
	}

	/**
	 * 가입된 이메일일 경우 이메일주소로 랜덤 패스워드 발송
	 */
	@RequestMapping(value = "randompass")
	public String FndPass(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + "FndPass start!!");

		String email = CmmUtil.nvl(request.getParameter("email")); // 이메일
		String nickname = CmmUtil.nvl(request.getParameter("nickname")); // 닉네임
		String ranpwd = ""; // 임시 비밀번호가 저장될 변수

		log.info("email : " + email);
		log.info("nickname : " + nickname);

		UserInfoDTO pDTO = null;

		pDTO = new UserInfoDTO();
		pDTO.setEmail(EncryptUtil.encAES128CBC(email));
		pDTO.setNickname(nickname);
		int res = userInfoService.checkUserInfo(pDTO);

		if (res == 0) {
			model.addAttribute("msg", "이메일 또는 닉네임이 존재하지 않습니다!");
			model.addAttribute("url", "user/fndpass.do");
		} else {
			// 랜덤 패스워드 8자리 생성
			for (int i = 0; i < 5; i++) {
				ranpwd = UUID.randomUUID().toString().replace("-", ""); // - 를 제거
				ranpwd = ranpwd.substring(0, 8); // 기존값이 36자리이기때문에 ranpwd를 앞에서 부터 8자리 잘라줌
			}

			log.info("ranpwd : " + ranpwd); // 랜덤 생성된 패스워드

			pDTO.setRanpwd(EncryptUtil.encHashSHA256(ranpwd));

			int result = userInfoService.updateNewPw(pDTO);
			if (result == 0) {
				model.addAttribute("msg", "비밀번호 변경에 실패하였습니다.");
				model.addAttribute("url", "user/fndpass.do");
			} else {
				// email보내기는 여기에서
				MailDTO mDTO = null;
				mDTO = new MailDTO();
				mDTO.setContents("발급된 임시 비밀번호는 : " + ranpwd + "입니다."); // 메일 내용
				mDTO.setTitle("서울나들이에서" + nickname + "님의 임시 비밀번호 발송"); // 메일 제목
				mDTO.settoMail(email); // 메일 받는 사람

				int result2 = 0;

				result2 = mailService.doSendMail(mDTO);

				if (result2 > 0) {
					model.addAttribute("msg", "입력하신 이메일로 임시 비밀번호 발송");
					model.addAttribute("url", "user/loginForm.do");
				} else {
					model.addAttribute("msg", "매일 발송 실패 잠시뒤 다시 시도해주세요");
					model.addAttribute("url", "user/fndpass.do");
				}

			}

		}

		return "/redirect";
	}

	/**
	 * 회원가입 화면으로 이동
	 */
	@RequestMapping(value = "user/signup")
	public String userRegForm() {
		log.info(this.getClass().getName() + ".user/userRegForm ok!");

		return "/user/Signup";
	}

	/**
	 * 회원가입 로직 처리
	 */
	@RequestMapping(value = "user/insertUserInfo")
	public String insertUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + ".insertUserInfo start!");

		// 회원가입 결과에 대한 메세지를 전달할 변수
		String msg = "";

		// 웹(회원정보 입력화면)에서 받는 정보를 저장할 변수
		UserInfoDTO pDTO = null;

		try {

			/*
			 * ############################################################### 웹(회원정보
			 * 입력화면)에서 받는 정보를 String 변수에 저장 시작!
			 * 
			 * 무조건 웹으로 받은 정보는 DTO에 저장하기 위해 임시로 String 변수에 저장함
			 * ###############################################################
			 */
			String email = CmmUtil.nvl(request.getParameter("email")); // 이메일
			String password = CmmUtil.nvl(request.getParameter("password")); // 비밀번호
			String nickname = CmmUtil.nvl(request.getParameter("nickname")); // 닉네임
			String password2 = CmmUtil.nvl(request.getParameter("password2")); // 비밀번호 확인

			/*
			 * ############################################################### 웹(회원정보
			 * 입력화면)에서 받는 정보를 String 변수에 저장 끝!
			 * 
			 * 무조건 웹으로 받은 정보는 DTO에 저장하기 위해 임시로 String 변수에 저장함
			 * ###############################################################
			 */

			/*
			 * ###############################################################
			 * 
			 * 반드시 값을 받았으면 로그를 찍어 값이 제대로 들어오는지 파악!!
			 * 
			 * ###############################################################
			 */

			log.info("email : " + email);
			log.info("password : " + password);
			log.info("nickname : " + nickname);

			/*
			 * ############################################################### 웹(회원정보
			 * 입력화면)에서 받는 정보를 DTO에 저장하기 시작!!
			 * 
			 * 무조건 웹으로 받은 정보는 DTO에 저장해야 한다고 이해하길 권함
			 * ###############################################################
			 */

			// 웹(회원정보 입력화면)에서 받는 정보를 저장할 변수를 메모리에 올리기
			pDTO = new UserInfoDTO();

			pDTO.setEmail(EncryptUtil.encAES128CBC(email));
			pDTO.setNickname(nickname);
			pDTO.setPassword(EncryptUtil.encHashSHA256(password));
			pDTO.setPassword2(EncryptUtil.encHashSHA256(password2));

			/*
			 * ############################################################### 웹(회원정보
			 * 입력화면)에서 받는 정보를 DTO에 저장하기 끝!!
			 * 
			 * 무조건 웹으로 받은 정보는 DTO에 저장해야 한다고 이해하길 권함
			 * ###############################################################
			 */

			/*
			 * 회원가입
			 */
			int res = userInfoService.insertUserInfo(pDTO);

			if (res == 1) {
				msg = "회원가입되었습니다.";
				model.addAttribute("url", "/user/loginForm.do");
				// 추후 회원가입 입력화면에서 ajax를 활용해서 아이디 중복, 이메일 중복을 체크하길 바람
			} else if (res == 2) {
				msg = "이미 가입된 이메일 주소 입니다.";
				model.addAttribute("url", "/user/signup.do");
			} else if (res == 3) {
				msg = "이미 사용하고 있는 닉네임 입니다.";
				model.addAttribute("url", "/user/signup.do");
			} else if (res == 4) {
				msg = "비밀번호가 일치하지 않습니다.";
				model.addAttribute("url", "/user/signup.do");

			} else {
				msg = "오류로 인해 회원가입이 실패하였습니다 잠시뒤에 시도해주세요";
				model.addAttribute("url", "/user/signup.do");
			}
		} catch (Exception e) {
			// 저장이 실패되면 사용자에게 보여줄 메세지
			msg = "실패하였습니다. : " + e.toString();
			log.info(e.toString());
			e.printStackTrace();

		} finally {
			log.info(this.getClass().getName() + ".insertUserInfo end!");

			// 회원가입 여부 결과 메세지 전달하기
			model.addAttribute("msg", msg);

			// 회원가입 여부 결과 메세지 전달하기
			model.addAttribute("pDTO", pDTO);

			// 변수 초기화(메모리 효율화 시키기 위해 사용함)
			pDTO = null;
		}

		return "/redirect";
	}

}
