package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserInfoDTO;

@Mapper("SignUpMapper")
public interface SignUpMapper {

	int insert_user(UserInfoDTO uDTO) throws Exception;

	int exists_user(UserInfoDTO uDTO) throws Exception;

	int update_email(UserInfoDTO uDTO) throws Exception;

	int update_password(UserInfoDTO uDTO)throws Exception;

}
