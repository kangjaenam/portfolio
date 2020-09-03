package poly.service;

import java.util.HashMap;
import java.util.List;

import poly.dto.NoticeDTO;

public interface INoticeService {

	List<NoticeDTO> getTourList(NoticeDTO pDTO)throws Exception;

	NoticeDTO tourDetail(String tour_no) throws Exception;

	int insertReview(NoticeDTO nDTO)throws Exception;

	List<NoticeDTO> getLatelyReview(String tour_no)throws Exception;

	NoticeDTO reviewDetail(String review_no)throws Exception;

	int viewcountAdd(String tour_no)throws Exception;

	String countReview(String tour_no)throws Exception;

	String getStarAvg(String tour_no)throws Exception;

	int viewcountAdd2(String review_no)throws Exception;

	List<NoticeDTO> searchTourname(NoticeDTO pDTO)throws Exception;

	int modifyReview(NoticeDTO nDTO)throws Exception;

	String getTourName(String tour_no)throws Exception;

	List<HashMap<String, Object>> getMarker()throws Exception;

	List<NoticeDTO> searchArea(NoticeDTO pDTO)throws Exception;

	List<NoticeDTO> getMyReview(NoticeDTO pDTO)throws Exception;

	int reviewDelete(String review_no)throws Exception;

	String fileCheck(String tour_no)throws Exception;

	NoticeDTO tourDetail2(String tour_no)throws Exception;

	int getAllList(String type)throws Exception;

	int getAllList2(String searchtitle)throws Exception;

	List<NoticeDTO> getReviewList(NoticeDTO pDTO)throws Exception;

	int getAllList3(String addr)throws Exception;

	int countMyReview(String user_no)throws Exception;

	


	

}
