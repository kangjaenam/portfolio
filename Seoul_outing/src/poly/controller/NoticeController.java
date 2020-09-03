package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dto.NoticeDTO;
import poly.service.INoticeService;
import poly.util.CmmUtil;

@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "NoticeService")
	private INoticeService noticeService;

	/**
	 * 유형 선택 시 해당 유형 관광지 리스트
	 */
	@RequestMapping(value = "getTourList")
	public String typeList(ModelMap model, HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + ".getTourList ok!");

		log.info("넘겨 받은 tourName이 있는지 : " + CmmUtil.nvl(request.getParameter("tourName")));

		// 만약 넘겨받은 정보에 tourName이 있다면 메인페이지 관광지명 검색기능 실행
		if (CmmUtil.nvl(request.getParameter("tourName")).length() > 0) {

			List<NoticeDTO> nList = new ArrayList<NoticeDTO>();

			// 현재 페이지 받음
			int PgNum = 1;
			if (request.getParameter("PgNum") != null && !request.getParameter("PgNum").equals("")) {
				PgNum = Integer.parseInt(request.getParameter("PgNum"));
				log.info("PgNum : " + PgNum);
			}

			String searchtitle = CmmUtil.nvl(request.getParameter("tourName"));

			log.info("검색한 관광지명 : " + searchtitle);

			searchtitle = searchtitle.replaceAll(" ", "");

			log.info("공백을 지운 관광지명 : " + searchtitle);

			int total = noticeService.getAllList2(searchtitle); // 해당 관광지명 관광지 총 갯수

			log.info("해당 관광지명을 포함한 관광지 총 갯수 : " + total);

			NoticeDTO pDTO = new NoticeDTO();

			pDTO.setSearchtitle(searchtitle);
			pDTO.setStartNum((PgNum - 1) * 20 + 1);
			pDTO.setEndNum((PgNum * 20));

			nList = noticeService.searchTourname(pDTO);

			model.addAttribute("nList", nList);
			model.addAttribute("total", total);
			model.addAttribute("PgNum", PgNum);
			model.addAttribute("searchtitle", searchtitle);

			return "tour/List";
		}
		
		//만약 넘겨받은 정보에 Area가 있다면 지역별 관광지 검색기능 실행
		if(CmmUtil.nvl(request.getParameter("Area")).length() > 0) {
			
			// 현재 페이지 받음
			int PgNum = 1;
			if (request.getParameter("PgNum") != null && !request.getParameter("PgNum").equals("")) {
				PgNum = Integer.parseInt(request.getParameter("PgNum"));
				log.info("PgNum : " + PgNum);
			}

			String addr = CmmUtil.nvl(request.getParameter("Area"));
			log.info("지역별 관광지에서 선택한 지역 : " + addr);
			
			int total = noticeService.getAllList3(addr); // 해당 관광지명 관광지 총 갯수
			
			List<NoticeDTO> nList = new ArrayList<NoticeDTO>();

			NoticeDTO pDTO = new NoticeDTO();

			pDTO.setAddr(addr);
			pDTO.setStartNum((PgNum - 1) * 20 + 1);
			pDTO.setEndNum((PgNum * 20));
			
			nList = noticeService.searchArea(pDTO);

			model.addAttribute("nList", nList);
			model.addAttribute("PgNum",PgNum);
			model.addAttribute("total",total);
			model.addAttribute("addr",addr);
			
			return "/tour/List";
		
		}
		

		// 현재 페이지 받음
		int PgNum = 1;
		if (request.getParameter("PgNum") != null && !request.getParameter("PgNum").equals("")) {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
			log.info("PgNum : " + PgNum);
		}

		String type = CmmUtil.nvl(request.getParameter("Type"));

		int total = noticeService.getAllList(type); // 해당유형 관광지 총 갯수

		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setType(type);
		pDTO.setStartNum((PgNum - 1) * 20 + 1);
		pDTO.setEndNum((PgNum * 20));

		List<NoticeDTO> nList = new ArrayList<>();

		log.info("해당 유형 총 리스트 갯수 : " + total);

		try {
			nList = noticeService.getTourList(pDTO);

		} catch (Exception e) {

			e.printStackTrace();
		}

		if (nList == null) {
			nList = new ArrayList<NoticeDTO>(); // nList에 null값이 들어 갈 경우 값이 넘어간 /tour/List에서
		} // 오류가 나기때문에 이곳에서 새로운 리스트 선언 (오류 방지)

		model.addAttribute("nList", nList);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		model.addAttribute("type", type);

		log.info(this.getClass().getName() + ".getTourList end!");

		return "tour/List";
	}

	/**
	 * 메인페이지 관광지 검색
	 */

	@RequestMapping(value = "/user/searchTourname")
	public String searchTourname(HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "./user/searchTourname ok!");

		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();

		// 현재 페이지 받음
		int PgNum = 1;
		if (request.getParameter("PgNum") != null && !request.getParameter("PgNum").equals("")) {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
			log.info("PgNum : " + PgNum);
		}

		String searchtitle = CmmUtil.nvl(request.getParameter("tourName"));

		log.info("검색한 관광지명 : " + searchtitle);

		searchtitle = searchtitle.replaceAll(" ", "");

		log.info("공백을 지운 관광지명 : " + searchtitle);

		int total = noticeService.getAllList2(searchtitle); // 해당 관광지명 관광지 총 갯수

		log.info("해당 관광지명을 포함한 관광지 총 갯수 : " + total);

		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setSearchtitle(searchtitle);
		pDTO.setStartNum((PgNum - 1) * 20 + 1);
		pDTO.setEndNum((PgNum * 20));

		nList = noticeService.searchTourname(pDTO);

		model.addAttribute("nList", nList);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		model.addAttribute("searchtitle", searchtitle);

		return "/tour/List";

	}

	/**
	 * 지역별 관광지
	 */
	@RequestMapping(value = "tour/area")
	public String area(HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "./tour/area ok!");

		// 현재 페이지 받음
		int PgNum = 1;
		if (request.getParameter("PgNum") != null && !request.getParameter("PgNum").equals("")) {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
			log.info("PgNum : " + PgNum);
		}

		String addr = CmmUtil.nvl(request.getParameter("Area"));
		log.info("지역별 관광지에서 선택한 지역 : " + addr);
		
		int total = noticeService.getAllList3(addr); // 해당 관광지명 관광지 총 갯수
		
		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();

		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setAddr(addr);
		pDTO.setStartNum((PgNum - 1) * 20 + 1);
		pDTO.setEndNum((PgNum * 20));
		
		nList = noticeService.searchArea(pDTO);

		model.addAttribute("nList", nList);
		model.addAttribute("PgNum",PgNum);
		model.addAttribute("total",total);
		model.addAttribute("addr",addr);
		
		return "/tour/List";
	}

	/**
	 * 관광지 상세보기
	 */
	@RequestMapping(value = "tour/tourDetail")
	public String tourDetail(HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".tour/tourDetail ok!");

		String path = request.getSession().getServletContext().getRealPath("/");

		log.info("경로:" + path);

		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();

		String tour_no = CmmUtil.nvl(request.getParameter("Tour_No"));

		NoticeDTO nDTO = null;
		nDTO = new NoticeDTO();

		String res = noticeService.fileCheck(tour_no); // 관광지 사진이 있는지 검사

		log.info("관광지 사진이 있는지 검사하는 res값 : " + res);

		if (res.equals("0")) {
			nDTO = noticeService.tourDetail2(tour_no); // 관광지 상세정보 (사진이 없는경우)
		} else {
			nDTO = noticeService.tourDetail(tour_no); // 관광지 상세 정보 (사진이 있는 경우)
		}

		String starAvg = CmmUtil.nvl(noticeService.getStarAvg(tour_no)); // 해당 관광지 평균 별점(별점총합/총리뷰수)
		String allCount = noticeService.countReview(tour_no); // 해당 관광지 총 리뷰 수
		nList = noticeService.getLatelyReview(tour_no); // 최근 리뷰
		noticeService.viewcountAdd(tour_no); // 조회수 증가

		if (starAvg.equals("")) {
			starAvg = "0";
		} else {
			if (starAvg.length() == 1) {
				starAvg += ".0";
			}
			starAvg = starAvg.substring(0, 3);
		}

		if (nList == null) {
			nList = new ArrayList<NoticeDTO>();
		} else {
			for (int i = 0; i < nList.size(); i++) {
				NoticeFilter(nList.get(i));
			}
		}

		log.info("이미지 파일 경로 : " + nDTO.getFilePath());
		log.info("이미지 파일 이름 : " + nDTO.getFileName());
		log.info("해당 관광지 총 리뷰 수 : " + allCount);
		log.info("starAvg : " + starAvg);
		log.info("Tour_no : " + nDTO.getTour_no());
		log.info("Title : " + nDTO.getTitle());
		log.info("Type : " + nDTO.getType());
		log.info("Addr : " + nDTO.getAddr());
		log.info("Tel : " + nDTO.getTel());
		log.info("Explan : " + nDTO.getExplain());
		log.info("Viewcont : " + nDTO.getViewcount());
		log.info("Time : " + nDTO.getTime());

		model.addAttribute("starAvg", starAvg);
		model.addAttribute("allCount", allCount);
		model.addAttribute("nDTO", nDTO);
		model.addAttribute("nList", nList);

		return "tour/TourDetail";
	}

	/**
	 * 리뷰 작성하기
	 */
	@RequestMapping(value = "/user/writeReview")
	public String writeReview(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {

		String tour_no = CmmUtil.nvl(request.getParameter("Tour_No"));

		String ss_email = CmmUtil.nvl((String) session.getAttribute("SS_EMAIL"));

		if (ss_email.equals("")) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/tour/tourDetail.do?Tour_No=" + tour_no);

			return "/redirect";
		}

		NoticeDTO nDTO = null;

		nDTO = new NoticeDTO();

		log.info("tour_no 조회할 관광지 번호 : " + tour_no);

		nDTO = noticeService.tourDetail2(tour_no);

		if (nDTO == null) {
			nDTO = new NoticeDTO();
		}

		model.addAttribute("nDTO", nDTO);
		nDTO = null;

		return "/user/WriteReview";
	}

	/**
	 * 리뷰 작성 완료(DB에 저장)
	 */
	@RequestMapping(value = "/user/completedReview")
	public String completedReview(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		String user_no = CmmUtil.nvl(request.getParameter("user_no"));
		String title = CmmUtil.nvl(request.getParameter("title"));
		String content = CmmUtil.nvl(request.getParameter("content"));
		String tour_no = CmmUtil.nvl(request.getParameter("tour_no"));
		String nickname = CmmUtil.nvl((String) session.getAttribute("SS_NICKNAME"));
		String starCount = CmmUtil.nvl(request.getParameter("starCount"));

		log.info("user_no : " + user_no);
		log.info("title : " + title);
		log.info("content : " + content);
		log.info("nickname : " + nickname);
		log.info("tour_no : " + tour_no);
		log.info("starCount : " + starCount);

		NoticeDTO nDTO = null;
		nDTO = new NoticeDTO();

		nDTO.setUser_no(user_no);
		nDTO.setTitle(title);
		nDTO.setContent(content);
		nDTO.setTour_no(tour_no);
		nDTO.setReg_nick(nickname);
		nDTO.setStarCount(starCount);

		int result = noticeService.insertReview(nDTO);

		if (result > 0) {
			model.addAttribute("msg", "리뷰작성 완료.");
			model.addAttribute("url", "/tour/tourDetail.do?Tour_No=" + tour_no);
		} else {
			model.addAttribute("msg", "오류가 발생하였습니다. 잠시뒤에 다시 시도해주세요.");
			model.addAttribute("url", "/user/writeReview.do?Tour_No=" + tour_no);
		}

		return "/redirect";
	}

	/**
	 * 리뷰 상세보기
	 */
	@RequestMapping(value = "/tour/reviewDetail")
	public String reviewDetail(HttpServletRequest request, ModelMap model) throws Exception {

		String review_no = CmmUtil.nvl(request.getParameter("Review_No"));

		NoticeDTO nDTO = null;
		nDTO = new NoticeDTO();

		nDTO = noticeService.reviewDetail(review_no);
		NoticeFilter(nDTO);

		noticeService.viewcountAdd2(review_no);

		log.info("starCount : " + nDTO.getStarCount());
		log.info("user_no : " + nDTO.getUser_no());
		log.info("title : " + nDTO.getTitle());
		log.info("content : " + nDTO.getContent());
		log.info("reg_nick : " + nDTO.getReg_nick());
		log.info("reg_date : " + nDTO.getReg_date());
		log.info("tour_no : " + nDTO.getTour_no());
		log.info("title2 : " + nDTO.getTitle2());
		log.info("review_no : " + review_no);

		model.addAttribute("nDTO", nDTO);
		model.addAttribute("Review_No", review_no);

		return "user/ReviewDetail";
	}

	/**
	 * 리뷰 목록
	 */
	@RequestMapping(value = "/user/reviewList")
	public String reviewList(HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "/user/reviewList ok!");

		// 현재 페이지 받음
		int PgNum = 1;
		if (request.getParameter("PgNum") != null && !request.getParameter("PgNum").equals("")) {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
			log.info("PgNum : " + PgNum);
		}

		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();

		String tour_no = CmmUtil.nvl(request.getParameter("Tour_no"));

		log.info("리뷰 목록 호출을 위한 Tour_no : " + tour_no);

		int total = Integer.parseInt(noticeService.countReview(tour_no)); // 해당관광지 리뷰 총 갯수

		log.info("total 해당관광지 리뷰 충 갯수 : " + total);

		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setStartNum((PgNum - 1) * 20 + 1);
		pDTO.setEndNum((PgNum * 20));
		pDTO.setTour_no(tour_no);

		nList = noticeService.getReviewList(pDTO);
		String tourname = noticeService.getTourName(tour_no);

		log.info("관광지 명 : " + tourname);

		if (nList == null) {
			nList = new ArrayList<NoticeDTO>();
		}

		model.addAttribute("nList", nList);
		model.addAttribute("tour_no", tour_no);
		model.addAttribute("tourname", tourname);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);

		log.info(this.getClass().getName() + "/user/reviewList end!");

		return "/user/ReviewList";
	}

	/**
	 * 리뷰 수정하기
	 */
	@RequestMapping(value = "/user/reviewModify")
	public String reviewModify(HttpServletRequest request, ModelMap model) throws Exception {

		NoticeDTO nDTO = null;

		nDTO = new NoticeDTO();

		String review_no = CmmUtil.nvl((String) request.getParameter("Review_no"));

		log.info("리뷰 상세에서 받아온 리뷰 번호 : " + review_no);

		nDTO = noticeService.reviewDetail(review_no);
		NoticeFilter(nDTO);

		model.addAttribute("Review_no", review_no);
		model.addAttribute("nDTO", nDTO);

		return "/user/ReviewModify";
	}

	/**
	 * 리뷰 수정 완료
	 */
	@RequestMapping(value = "/user/modifyReview")
	public String modifyReview(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

		String review_no = CmmUtil.nvl((String) request.getParameter("review_no"));

		String title = CmmUtil.nvl(request.getParameter("title"));
		String content = CmmUtil.nvl(request.getParameter("content"));
		String tour_no = CmmUtil.nvl(request.getParameter("tour_no"));
		String nickname = CmmUtil.nvl((String) session.getAttribute("SS_NICKNAME"));
		String starCount = CmmUtil.nvl(request.getParameter("starCount"));

		log.info("review_no : " + review_no);
		log.info("title : " + title);
		log.info("content : " + content);
		log.info("nickname : " + nickname);
		log.info("tour_no : " + tour_no);
		log.info("starCount : " + starCount);

		NoticeDTO nDTO = null;

		nDTO = new NoticeDTO();

		nDTO.setReview_no(review_no);
		nDTO.setTitle(title);
		nDTO.setContent(content);
		nDTO.setTour_no(tour_no);
		nDTO.setReg_nick(nickname);
		nDTO.setStarCount(starCount);

		int res = noticeService.modifyReview(nDTO);

		if (res > 0) {
			model.addAttribute("msg", "수정 완료 되었습니다.");
			model.addAttribute("url", "/user/reviewList.do?Tour_no=" + tour_no);
		} else {
			model.addAttribute("msg", "오류가 발생했습니다. 잠시뒤에 다시 시도해주세요.");
			model.addAttribute("url", "/user/reviewModify.do?Review_no=" + review_no);
		}

		return "/redirect";
	}

	/**
	 * 리뷰 삭제
	 */
	@RequestMapping(value = "/user/reviewDelete")
	public String reviewDelete(HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "/user/reviewDelete ok!");

		String review_no = CmmUtil.nvl(request.getParameter("Review_no"));

		log.info("리뷰 삭제를 위한 리뷰 번호 : " + review_no);

		int result = noticeService.reviewDelete(review_no);

		log.info("delete 문이 실행된 결과 result값 : " + result);

		if (result > 0) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("url", "/user/mypage.do");
		} else {
			model.addAttribute("msg", "오류가 발생했습니다. 잠시후에 다시 시도해주세요.");
			model.addAttribute("url", "/tour/reviewDetail.do?Review_No=" + review_no);
		}

		return "/redirect";
	}

	// 특수문자 변환
	public NoticeDTO NoticeFilter(NoticeDTO pDTO) {
		if (pDTO.getTitle() != null) {
			pDTO.setTitle(pDTO.getTitle().replaceAll("scr!pt", "script"));
		}
		if (pDTO.getContent() != null) {
			pDTO.setContent(pDTO.getContent().replaceAll("scr!pt", "script"));
		}
		return pDTO;
	}

}
