package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserInfoDTO;

@Mapper("UserInfoMapper")
public interface UserInfoMapper {

	//회원 가입하기(회원정보 등록하기)
	int insertUserInfo(UserInfoDTO pDTO) throws Exception;
	
	//회원 가입 전 중복 체크하기(DB조회하기)
	UserInfoDTO getUserExists(UserInfoDTO pDTO) throws Exception;
	
	//로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기
	UserInfoDTO getUserLoginCheck(UserInfoDTO pDTO) throws Exception;

	//닉네임 중복검사
	UserInfoDTO getUserNick(UserInfoDTO pDTO) throws Exception;

	//이메일 닉네임 존재여부 확인 및 패스워드 갱신
	int FndPass(UserInfoDTO pDTO) throws Exception;

	String getNewPw(UserInfoDTO pDTO) throws Exception;

	// 유저 정보가 있는지 없는지 확인
	int checkUserInfo(UserInfoDTO pDTO) throws Exception;

	// 새로운 패스워드 갱신
	int updateNewPw(UserInfoDTO pDTO) throws Exception;

	// 이메일 닉네임 수정
	int modifyEmail(UserInfoDTO pDTO) throws Exception;

	// 패스워드 수정
	int modifyPassword(UserInfoDTO pDTO) throws Exception;

	// 회원탈퇴 
	int userDelete(UserInfoDTO pDTO) throws Exception;
	
	//닉네임만 수정
	void changeNick(UserInfoDTO pDTO)throws Exception;

	//이메일만 수정
	void changeEmail(UserInfoDTO pDTO)throws Exception;
	
	
}
