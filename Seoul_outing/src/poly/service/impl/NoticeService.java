package poly.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.NoticeDTO;
import poly.persistance.mapper.NoticeMapper;
import poly.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;

	//관광지 리스트 가져오기
	@Override
	public List<NoticeDTO> getTourList(NoticeDTO pDTO) throws Exception {
		
		return noticeMapper.getTourList(pDTO);
	}

	//관광지 정보 가져오기
	@Override
	public NoticeDTO tourDetail(String tour_no) throws Exception {
		
		return noticeMapper.tourDetail(tour_no);
	}

	//리뷰 작성 완료
	@Override
	public int insertReview(NoticeDTO nDTO) throws Exception {
		
		
		return noticeMapper.insertReview(nDTO);
	}

	//최근리뷰 6개 가져오기
	@Override
	public List<NoticeDTO> getLatelyReview(String tour_no) throws Exception {
		
		return noticeMapper.getLatelyReview(tour_no);
	}

	//리뷰 상세보기
	@Override
	public NoticeDTO reviewDetail(String review_no) throws Exception {
		
		return noticeMapper.reviewDetail(review_no);
	}

	//조회수 증가
	@Override
	public int viewcountAdd(String tour_no) throws Exception {
		
		return noticeMapper.viewcountAdd(tour_no);
	}

	@Override
	public String countReview(String tour_no) throws Exception {
		
		return noticeMapper.countReview(tour_no);
	}

	@Override
	public String getStarAvg(String tour_no) throws Exception {
		
		return noticeMapper.getStarAvg(tour_no);
	}

	@Override
	public int viewcountAdd2(String review_no) throws Exception {
		
		return noticeMapper.viewcountAdd2(review_no);
	}

	@Override
	public List<NoticeDTO> searchTourname(NoticeDTO pDTO) throws Exception {
		
		return noticeMapper.searchTourname(pDTO);
	}

	@Override
	public int modifyReview(NoticeDTO nDTO) throws Exception {
		
		return noticeMapper.modifyReview(nDTO);
	}

	@Override
	public String getTourName(String tour_no) throws Exception {
		
		return noticeMapper.getTourName(tour_no);
	}

	@Override
	public List<HashMap<String, Object>> getMarker() throws Exception {
		
		return noticeMapper.getMarker();
	}

	@Override
	public List<NoticeDTO> searchArea(NoticeDTO pDTO) throws Exception {
		
		return noticeMapper.searchArea(pDTO);
	}

	@Override
	public List<NoticeDTO> getMyReview(NoticeDTO pDTO) throws Exception {
		
		return noticeMapper.getMyReview(pDTO);
	}

	@Override
	public int reviewDelete(String review_no) throws Exception {
		
		return noticeMapper.reviewDelete(review_no);
	}

	@Override
	public String fileCheck(String tour_no) throws Exception {
		
		return noticeMapper.fileCheck(tour_no);
	}

	@Override
	public NoticeDTO tourDetail2(String tour_no) throws Exception {
		
		return noticeMapper.tourDetail2(tour_no);
	}

	@Override
	public int getAllList(String type) throws Exception {
		
		return noticeMapper.getAllList(type);
	}

	@Override
	public int getAllList2(String searchtitle) throws Exception {
		
		return noticeMapper.getAllList2(searchtitle);
	}

	@Override
	public List<NoticeDTO> getReviewList(NoticeDTO pDTO) throws Exception {
		
		return noticeMapper.getReviewList(pDTO);
	}

	@Override
	public int getAllList3(String addr) throws Exception {
		
		return noticeMapper.getAllList3(addr);
	}

	@Override
	public int countMyReview(String user_no) throws Exception {
		
		return noticeMapper.countMyReview(user_no);
	}

	

	
	
	
	


	
}
