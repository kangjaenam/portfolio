package poly.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import poly.persistance.mapper.DEMapper;
import poly.service.IDEService;

@Service("DEService")
public class DEService  implements IDEService{

	@Resource(name="DEMapper")
	private DEMapper DEMapper;
	


		
}


	
	
	