package poly.service;

import poly.dto.UserInfoDTO;

public interface ISignUpService {


	//회원가입
	int insert_user(UserInfoDTO uDTO) throws Exception;

	//이메일 중복확인
	int exists_user(UserInfoDTO uDTO) throws Exception;

	//비밀번호 업데이트
	int update_password(UserInfoDTO uDTO) throws Exception;



}
