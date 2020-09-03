package poly.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.UserInfoDTO;
import poly.persistance.mapper.UserInfoMapper;
import poly.service.IUserInfoService;
import poly.util.CmmUtil;

@Service("UserInfoService")
public class UserInfoService implements IUserInfoService {

	private Logger log = Logger.getLogger(getClass());

	@Resource(name = "UserInfoMapper")
	private UserInfoMapper userInfoMapper;

	@Override
	public int insertUserInfo(UserInfoDTO pDTO) throws Exception {

		// 회원가입 성공 : 1, 이메일 중복으로 인한 가입 취소 : 2, 닉네임 중복으로 가입취소 : 3, 기타 에러 발생 : 0
		int res = 0;

		// controller에서 값이 정상적으로 못 넘어오는 경우를 대비하기 위해 사용함
		if (pDTO == null) {
			pDTO = new UserInfoDTO();
		}

		// 회원 가입 중복 방지를 위해 DB에서 데이터 조회
		UserInfoDTO rDTO = userInfoMapper.getUserExists(pDTO);
		UserInfoDTO r1DTO = userInfoMapper.getUserNick(pDTO);

		log.info("hi333333333333333333333333333333333333333333333333333333333333333333333333333333333333333");

		// mapper에서 값이 정상적으로 못 넘어오는 경우를 대비하기 위해 사용함
		if (rDTO == null) {
			rDTO = new UserInfoDTO();
		} else if (!pDTO.getPassword().equals(pDTO.getPassword2())) {
			res = 4;
			log.info("#####################################################################res4");
		}

		// 중복된 회원정보(이메일)가 있는 경우, 결과값을 2로 변경하고, 더 이상 작업을 진행하지않음
		else if (CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
			res = 2;
			log.info("#####################################################################res2");
		}

		// 중복된 회원정보(닉네임)가 있는 경우, 결과값을 3로 변경하고, 더 이상 작업을 진행하지않음
		else if (CmmUtil.nvl(r1DTO.getNick_yn()).equals("Y")) {
			res = 3;
			log.info("#####################################################################res3");
			// 회원가입이 중복이 아니므로, 회원가입 진행함
		} else {

			// 회원가입
			int success = userInfoMapper.insertUserInfo(pDTO);
			log.info("#####################################################################res5");
			// DB에 데이터가 등록되었다면,
			if (success > 0) {
				res = 1;
			} else {
				res = 0;
			}
		}

		return res;
	}

	/**
	 * 이메일과 닉네임이 존재하는지 확인하고 패스워드 갱신!
	 */
	@Override
	public int randompass(UserInfoDTO pDTO) throws Exception {

		// 이메일 닉네임 존재할경우 : 1, 존재하지 않을 경우 : 0
		// 존재 여부 확인을 위해 mapper 호출

		int res = userInfoMapper.FndPass(pDTO);

		return res;
	}

	/**
	 * 로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기
	 * 
	 * @param UserInfoDTO 로그인을 위한 회원아이디, 비밀번호
	 * @return UserInfoDTO 로그인된 회원아이디 정보
	 */
	@Override
	public UserInfoDTO getUserLoginCheck(UserInfoDTO pDTO) throws Exception {

		// 로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위한 mapper 호출하기

		return userInfoMapper.getUserLoginCheck(pDTO);
	}

	/**
	 * 마이페이지에서 받아온 이메일과 닉네임으로 수정
	 */
	@Override
	public int modifyEmail(UserInfoDTO pDTO) throws Exception {

		// 정보수정 성공 : 1, 이메일 중복으로 인한 수정 취소 : 2, 닉네임 중복으로 수정 취소 : 3, 기타 에러 발생 : 0
		int res = 0;

		// controller에서 값이 정상적으로 못 넘어오는 경우를 대비하기 위해 사용함
		if (pDTO == null) {
			pDTO = new UserInfoDTO();
		}

		
		// 회원 정보 중복 방지를 위해 DB에서 데이터 조회
		UserInfoDTO rDTO = userInfoMapper.getUserExists(pDTO);
		UserInfoDTO r1DTO = userInfoMapper.getUserNick(pDTO);

		// 중복된 회원정보(이메일)가 있는 경우, 결과값을 2로 변경하고, 더 이상 작업을 진행하지않음
		if (CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
			//이메일하고 닉네임이 둘다 같은 경우
			if(pDTO.getEmail().equals(pDTO.getOrgEmail())&&pDTO.getNickname().equals(pDTO.getOrgNickname())){
				res = 4;
			}
			
			//중복 이메일이 원래 이메일일 경우 닉네임만 중복검사 후 변경
			else if(pDTO.getEmail().equals(pDTO.getOrgEmail())) {
				if(CmmUtil.nvl(r1DTO.getNick_yn()).equals("Y")) {
					res = 3;
				}else {
					//닉네임만 수정
					userInfoMapper.changeNick(pDTO);
					res = 1;
				}
				
			}else {
				res = 2;
			}
			
			log.info("#####################################################################res2");
		}

		// 중복된 회원정보(닉네임)가 있는 경우, 결과값을 3로 변경하고, 더 이상 작업을 진행하지않음
		else if (CmmUtil.nvl(r1DTO.getNick_yn()).equals("Y")) {
			//중복 닉네임이 원래 닉네임일 경우 이메일만 변경
			if(pDTO.getNickname().equals(pDTO.getOrgNickname())) {
				//이메일만 수정
				userInfoMapper.changeEmail(pDTO);
				res = 1;
			}else {
				res = 3;
			}
				
			log.info("#####################################################################res3");
			// 회원정보 중복이 아니므로, 정보수정 진행함
		} else {

			// 정보수정
			int success = userInfoMapper.modifyEmail(pDTO);
			log.info("#####################################################################res5");
			// DB에 데이터가 수정되었다면,
			if (success > 0) {
				res = 1;
			} else {
				res = 0;
			}
		}

		return res;
	}

	/**
	 * 마이페이지에서 받아온 비밀번호 업데이트
	 */
	@Override
	public int modifyPassword(UserInfoDTO pDTO) throws Exception {

		// 비밀번호 수정 업데이트 문이 실행되었는지 결과를 res에 저장 성공 : 1, 실패 : 0
		int res = userInfoMapper.modifyPassword(pDTO);

		return res;
	}

	/**
	 * 회원탈퇴
	 */
	@Override
	public int userDelete(UserInfoDTO pDTO) throws Exception {

		int res = userInfoMapper.userDelete(pDTO);

		return res;
	}

	// 유저 정보가 있는지 없는지 확인
	@Override
	public int checkUserInfo(UserInfoDTO pDTO) throws Exception {

		return userInfoMapper.checkUserInfo(pDTO);
	}

	// 새로운 패스워드 갱신
	@Override
	public int updateNewPw(UserInfoDTO pDTO) throws Exception {

		return userInfoMapper.updateNewPw(pDTO);
	}

}
