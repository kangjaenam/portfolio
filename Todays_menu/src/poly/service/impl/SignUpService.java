package poly.service.impl;

import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserInfoDTO;
import poly.persistance.mapper.SignUpMapper;
import poly.service.ISignUpService;

@Service("SignUpService")
public class SignUpService implements ISignUpService{
	private Logger log = Logger.getLogger(this.getClass().getName());

	@Resource(name="SignUpMapper")
	private SignUpMapper signUpMapper;
	
	@Override
	public int insert_user(UserInfoDTO uDTO) throws Exception {
		log.info("insert_user start!!");
		int res = signUpMapper.exists_user(uDTO);  //이메일로 회원가입 중복확인
		log.info("res : " + res );
		
		if(res > 0) {   	//중복 이메일이 있는 경우
			
			return -1;   
		}

		log.info("mapper start!!");
		res = signUpMapper.insert_user(uDTO);
		log.info("res : " + res );
		

		log.info("insert_user end!!");
		
		return res;
	}
	
	@Override
	public int exists_user(UserInfoDTO uDTO)throws Exception {
		log.info("exists_user 시작");
		
		int res = signUpMapper.exists_user(uDTO);  //이메일로 회원가입 중복확인
		log.info("중복확인 res : " +res);
		if(res > 0) {   	//중복 이메일이 있는 경우
			
			return -1;   
		}
		
		res = signUpMapper.update_email(uDTO);
		
		
		return res;
		
	}

	@Override
	public int update_password(UserInfoDTO uDTO) throws Exception {
		
		int res = 0;
		
		res = signUpMapper.update_password(uDTO);
		
		return res;
	}
	
}
