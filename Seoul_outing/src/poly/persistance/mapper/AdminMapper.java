package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.NoticeDTO;
import poly.dto.UserInfoDTO;

@Mapper("AdminMapper")
public interface AdminMapper {

	//유저 정보 불러오기
	List<UserInfoDTO> getUserInfo(NoticeDTO pDTO)throws Exception;

	//유저 권한 가져오기
	String getAuthority(String user_no)throws Exception;

	//사용자 -> 관리자
	int changeAuthority(String user_no)throws Exception;

	//관리자 -> 사용자
	int changeAuthority2(String user_no)throws Exception;

	//유저 상태 가져오기
	String getState(String user_no)throws Exception;

	//정상 -> 정지
	int chageState(String user_no)throws Exception;

	//정지 -> 정상
	int chageState2(String user_no)throws Exception;

	//관광지 추가
	int insertTour(NoticeDTO nDTO)throws Exception;

	//관광지 삭제
	int tourDelete(String tour_no)throws Exception;

	//추가 관광지 번호 불러오기
	String getTourNo()throws Exception;

	//관광지 이미지 경로 저장
	int tourImg(NoticeDTO nDTO)throws Exception;

	//모든 유저 수 세기
	int countAllUser()throws Exception;

}
