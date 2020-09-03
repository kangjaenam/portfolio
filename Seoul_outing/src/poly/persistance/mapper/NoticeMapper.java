package poly.persistance.mapper;

import java.util.HashMap;
import java.util.List;

import config.Mapper;
import poly.dto.NoticeDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {

	List<NoticeDTO> getTourList(NoticeDTO pDTO)throws Exception;

	NoticeDTO tourDetail(String tour_no)throws Exception;

	int insertReview(NoticeDTO nDTO)throws Exception;

	List<NoticeDTO> getLatelyReview(String tour_no)throws Exception;

	NoticeDTO reviewDetail(String review_no)throws Exception;

	//조회수 증가
	int viewcountAdd(String tour_no)throws Exception;

	// 해당관광지 총 리뷰 개수
	String countReview(String tour_no)throws Exception;

	//평균 별점
	String getStarAvg(String tour_no)throws Exception;

	//리뷰 번호로 리뷰 조회수 업데이트
	int viewcountAdd2(String review_no)throws Exception;

	//메인페이지 관광지 검색 기능
	List<NoticeDTO> searchTourname(NoticeDTO pDTO)throws Exception;

	//리뷰 수정을 위해 기존내용 불러오기
	NoticeDTO reviewModify(String review_no)throws Exception;

	//리뷰 수정 내용 업데이트
	int modifyReview(NoticeDTO nDTO)throws Exception;

	//관광지 이름 가져오기
	String getTourName(String tour_no)throws Exception;

	//마커 찍을 관광지 정보 가져오기
	List<HashMap<String, Object>> getMarker()throws Exception;

	//지역별 관광지 지역 선택시
	List<NoticeDTO> searchArea(NoticeDTO pDTO)throws Exception;

	//마이페이지에 보여줄 내가 쓴 리뷰
	List<NoticeDTO> getMyReview(NoticeDTO pDTO)throws Exception;

	//리뷰 삭제
	int reviewDelete(String review_no)throws Exception;

	//관광지 사진이 있는지 검사
	String fileCheck(String tour_no)throws Exception;

	//관광지 상세(사진이 없는 경우)
	NoticeDTO tourDetail2(String tour_no)throws Exception;

	//해당 리스트 총 갯수
	int getAllList(String type)throws Exception;

	//해당 관광지명을 포함하는 관광지 총 갯수
	int getAllList2(String searchtitle)throws Exception;

	//관광지 번호로 조회한 해당 관광지 리뷰
	List<NoticeDTO> getReviewList(NoticeDTO pDTO)throws Exception;

	//관광지 지역으로 조회한 총 관광지 갯수
	int getAllList3(String addr)throws Exception;

	//내가 쓴 리뷰 총 갯수
	int countMyReview(String user_no)throws Exception;

	
	
	
}
