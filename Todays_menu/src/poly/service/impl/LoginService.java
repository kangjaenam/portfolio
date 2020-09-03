package poly.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserInfoDTO;
import poly.persistance.mapper.LoginMapper;
import poly.service.ILoginService;
import poly.util.CmmUtil;

@Service("LoginService")
public class LoginService implements ILoginService{
	
	@Resource(name="LoginMapper")
	private LoginMapper loginMapper;

	@Override
	public String login_check(UserInfoDTO uDTO) throws Exception {
		System.out.println("aaaaaaaaa");
		return loginMapper.login_check(uDTO);
	}

	@Override
	public List<UserInfoDTO> getUserInfo()throws Exception {
		
		List<UserInfoDTO> uList = new ArrayList<>();
		
		uList = loginMapper.getUserInfo();
		
		return uList;
	}

	@Override
	public int userDelete(String user_seq_no) throws Exception {
		
		return loginMapper.userDelete(user_seq_no);
	}

	@Override
	public void my_ig_save(String my_ig) {
		
		loginMapper.my_ig_save(my_ig);
	}

	@Override
	public String getMy_ig(String user_email) {
		
		return CmmUtil.nvl(loginMapper.getMy_ig(user_email));
	}



}
