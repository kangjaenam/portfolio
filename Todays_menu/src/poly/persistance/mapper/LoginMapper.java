package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.UserInfoDTO;


@Mapper("LoginMapper")
public interface LoginMapper {

	String login_check(UserInfoDTO uDTO)throws Exception;

	List<UserInfoDTO> getUserInfo()throws Exception;

	int userDelete(String user_seq_no)throws Exception;

	void my_ig_save(String my_ig);

	String getMy_ig(String user_email);



	
}
