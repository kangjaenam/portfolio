package poly.service;

import poly.dto.UserInfoDTO;

public interface IUserInfoService {

	//회원 가입하기(회원정보 등록하기)
	int insertUserInfo(UserInfoDTO pDTO) throws Exception;
	
	//로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기
	UserInfoDTO getUserLoginCheck(UserInfoDTO pDTO) throws Exception;

	//이메일과 닉네임이 존재할 경우 패스워드 갱신
	int randompass(UserInfoDTO pDTO) throws Exception;
	
	// 이메일과 닉네임 정보가 있는지 확인
	int checkUserInfo(UserInfoDTO pDTO) throws Exception;

	// 새로운 패스워드 갱신
	int updateNewPw(UserInfoDTO pDTO) throws Exception;

	// 이메일 닉네임 수정
	int modifyEmail(UserInfoDTO pDTO) throws Exception;

	// 패스워드 수정
	int modifyPassword(UserInfoDTO pDTO) throws Exception;

	// 회원 탈퇴
	int userDelete(UserInfoDTO pDTO) throws Exception;
	
	
	

}
