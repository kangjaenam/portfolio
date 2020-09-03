package poly.service;

import java.util.List;

import poly.dto.NoticeDTO;
import poly.dto.UserInfoDTO;

public interface IAdminService {

	//유저 정보 불러오기
	List<UserInfoDTO> getUserInfo(NoticeDTO pDTO)throws Exception;

	//유저 권한 정보 가져오기
	String getAuthority(String user_no)throws Exception;

	//사용자 -> 관리자
	int changeAuthority(String user_no)throws Exception;

	//관리자 -> 사용자
	int changeAuthority2(String user_no)throws Exception;

	//유저 상태 정보 가져오기
	String getState(String user_no)throws Exception;

	//정상 -> 정지
	int chageState(String user_no)throws Exception;

	//정지 -> 정상
	int chageState2(String user_no)throws Exception;

	//관광지 추가
	int insertTour(NoticeDTO nDTO)throws Exception;

	//관광지 삭제
	int tourDelete(String tour_no)throws Exception;

	//최근 관광지 번호 가져오기
	String getTourNo()throws Exception;

	//관광지 사진 정보 넣기
	int tourImg(NoticeDTO nDTO)throws Exception;

	//유저 총 수 세기
	int countAllUser()throws Exception;
	
	

}
