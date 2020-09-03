package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.NoticeDTO;
import poly.dto.UserInfoDTO;
import poly.persistance.mapper.AdminMapper;
import poly.service.IAdminService;

@Service("AdminService")
public class AdminService implements IAdminService {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminMapper")
	private AdminMapper adminMapper;
	
	@Override
	public List<UserInfoDTO> getUserInfo(NoticeDTO pDTO) throws Exception {
		
		return adminMapper.getUserInfo(pDTO);
	}

	@Override
	public String getAuthority(String user_no) throws Exception {
		
		return adminMapper.getAuthority(user_no);
	}

	@Override
	public int changeAuthority(String user_no) throws Exception {
		
		return adminMapper.changeAuthority(user_no);
	}

	@Override
	public int changeAuthority2(String user_no) throws Exception {
		
		return adminMapper.changeAuthority2(user_no);
	}

	@Override
	public String getState(String user_no) throws Exception {
		
		return adminMapper.getState(user_no);
	}

	@Override
	public int chageState(String user_no) throws Exception {
		
		return adminMapper.chageState(user_no);
	}

	@Override
	public int chageState2(String user_no) throws Exception {
		
		return adminMapper.chageState2(user_no);
	}

	@Override
	public int insertTour(NoticeDTO nDTO) throws Exception {
		
		return adminMapper.insertTour(nDTO);
	}

	@Override
	public int tourDelete(String tour_no) throws Exception {
		
		return adminMapper.tourDelete(tour_no);
	}

	@Override
	public String getTourNo() throws Exception {
		
		return adminMapper.getTourNo();
	}

	@Override
	public int tourImg(NoticeDTO nDTO) throws Exception {
		
		return adminMapper.tourImg(nDTO);
	}

	@Override
	public int countAllUser() throws Exception {
		
		return adminMapper.countAllUser();
	}

}
