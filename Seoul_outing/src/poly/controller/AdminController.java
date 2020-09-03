package poly.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.NoticeDTO;
import poly.dto.UserInfoDTO;
import poly.service.IAdminService;
import poly.util.CmmUtil;

@Controller
public class AdminController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "AdminService")
	private IAdminService adminservice;

	/**
	 * 관리자 페이지
	 */
	@RequestMapping(value = "/admin/management")
	public String management(ModelMap model, HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + "./admin/management ok!");

		List<UserInfoDTO> nList = new ArrayList<>();

		// 현재 페이지 받음
		int PgNum = 1;
		if (request.getParameter("PgNum") != null && !request.getParameter("PgNum").equals("")) {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
			log.info("PgNum : " + PgNum);
		}
		
		int total = adminservice.countAllUser(); // 가입유저 총 수
		
		log.info("가입 유저 총 수 : " + total);
		
		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setStartNum((PgNum - 1) * 20 + 1);
		pDTO.setEndNum((PgNum * 20));
		
		nList = adminservice.getUserInfo(pDTO);

		model.addAttribute("nList", nList);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);

		return "/admin/Management";
	}

	/**
	 * 회원 권한 변경
	 */
	@RequestMapping(value = "/ModifyAuthor")
	public String ModifyAuthor(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + "ModifyAuthor ok!");

		String user_no = CmmUtil.nvl(request.getParameter("user_seq"));

		if (user_no.equals("undefined")) {
			model.addAttribute("msg", "회원을 선택해주세요");
			model.addAttribute("url", "/admin/management.do");
			return "/redirect";
		}
		if (user_no.equals(session.getAttribute("SS_USER_NO"))) {

			model.addAttribute("msg", "자신의 권한은 변경이 불가합니다");
			model.addAttribute("url", "/admin/management.do");
			return "/redirect";
		}

		String authority = adminservice.getAuthority(user_no);

		log.info("회원 권한 정보 : " + authority);

		if (authority.equals("1")) {

			int res = adminservice.changeAuthority(user_no);

			if (res > 0) {
				model.addAttribute("msg", "권한 변경 완료");
				model.addAttribute("url", "/admin/management.do");
			} else {
				model.addAttribute("msg", "오류 발생 권한 변경 실패");
				model.addAttribute("url", "/admin/management.do");
			}

		} else if (authority.equals("0")) {

			int res = adminservice.changeAuthority2(user_no);

			if (res > 0) {
				model.addAttribute("msg", "권한 변경 완료");
				model.addAttribute("url", "/admin/management.do");
			} else {
				model.addAttribute("msg", "오류 발생 권한 변경 실패");
				model.addAttribute("url", "/admin/management.do");
			}

		}

		return "/redirect";
	}

	/**
	 * 회원 상태 변경
	 */
	@RequestMapping(value = "/ModifyState")
	public String ModifyState(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + "ModifyState ok!");

		String user_no = CmmUtil.nvl(request.getParameter("user_seq"));

		if (user_no.equals("undefined")) {
			model.addAttribute("msg", "회원을 선택해주세요");
			model.addAttribute("url", "/admin/management.do");
			return "/redirect";
		}
		if (user_no.equals(session.getAttribute("SS_USER_NO"))) {

			model.addAttribute("msg", "자신의 상태는 변경이 불가합니다");
			model.addAttribute("url", "/admin/management.do");
			return "/redirect";
		}

		String state = adminservice.getState(user_no);

		log.info("회원 상태 정보 : " + state);

		if (state.equals("0")) {

			int res = adminservice.chageState(user_no);

			if (res > 0) {
				model.addAttribute("msg", "상태 변경 완료");
				model.addAttribute("url", "/admin/management.do");
			} else {
				model.addAttribute("msg", "오류 발생 상태 변경 실패");
				model.addAttribute("url", "/admin/management.do");
			}
		} else if (state.equals("1")) {

			int res = adminservice.chageState2(user_no);

			if (res > 0) {
				model.addAttribute("msg", "상태 변경 완료");
				model.addAttribute("url", "/admin/management.do");
			} else {
				model.addAttribute("msg", "오류 발생 상태 변경 실패");
				model.addAttribute("url", "/admin/management.do");
			}

		}

		return "/redirect";
	}

	/**
	 * 관광지 추가
	 */
	@RequestMapping(value = "/admin/addTour")
	public String addTour(HttpServletRequest request, ModelMap model,
			@RequestParam(value = "fileUpload") MultipartFile mf) throws Exception {
		log.info(this.getClass().getName() + "/admin/addTour ok!");

		NoticeDTO nDTO = new NoticeDTO();

		String title = CmmUtil.nvl(request.getParameter("tourName"));
		String type = CmmUtil.nvl(request.getParameter("type"));
		String addr = CmmUtil.nvl(request.getParameter("tourAddr"));
		String tel = CmmUtil.nvl(request.getParameter("tourTell"));
		String time = CmmUtil.nvl(request.getParameter("tourTime"));
		String lat = CmmUtil.nvl(request.getParameter("tourLat"));
		String har = CmmUtil.nvl(request.getParameter("tourHar"));
		String explain = CmmUtil.nvl(request.getParameter("tourExplain"));
		// 이미지 파일도 받아와야함
		String orgFileName = mf.getOriginalFilename();

		log.info("orgFileName 받아온 파일 이름 : " + orgFileName);

		// 파일 확장자 가져오기
		String ext = orgFileName.substring(orgFileName.lastIndexOf(".") + 1, orgFileName.length()).toLowerCase();

		// 이미지 파일만 실행되도록함
		if (ext.equals("jpeg") || ext.equals("jpg") || ext.equals("png") || ext.equals("gif")) {
			String defaultPath = request.getServletContext().getRealPath("/");
			String fullFilePath = defaultPath + "/files/" + orgFileName;
			mf.transferTo(new File(fullFilePath));
		}

		String searchtitle = title.replaceAll(" ", "");

		nDTO.setTitle(title);
		nDTO.setType(type);
		nDTO.setAddr(addr);
		nDTO.setTel(tel);
		nDTO.setTime(time);
		nDTO.setLat(lat);
		nDTO.setHar(har);
		nDTO.setExplain(explain);
		nDTO.setSearchtitle(searchtitle);
		// 이미지 파일 저장해야함

		int res = adminservice.insertTour(nDTO);

		if (res > 0) {
			model.addAttribute("msg", "관광지 추가 완료");
			model.addAttribute("url", "/admin/management.do");
			String tour_no = adminservice.getTourNo();
			log.info("tour_no :" + tour_no);
			nDTO.setFileName(orgFileName);
			nDTO.setTour_no(tour_no);
			int result = adminservice.tourImg(nDTO);
		} else {
			model.addAttribute("msg", "오류 발생 잠시뒤에 다시 시도해주세요.");
			model.addAttribute("url", "/admin/management.do");
		}

		return "/redirect";
	}

	/**
	 * 관광지 삭제
	 */
	@RequestMapping(value = "/user/tourDelete")
	public String tourDelete(HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "/user/tourDelete ok!");

		String tour_no = request.getParameter("Tour_no");

		int res = adminservice.tourDelete(tour_no);

		if (res > 0) {
			model.addAttribute("msg", "관광지 삭제 완료");
			model.addAttribute("url", "/admin/management.do");
		} else {
			model.addAttribute("msg", "오류 발생 잠시뒤에 다시 시도해주세요.");
			model.addAttribute("url", "/admin/management.do");
		}

		return "/redirect";
	}

}
