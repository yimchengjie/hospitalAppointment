package evil.devil.servcie.impl;

import java.util.List;

import evil.devil.dao.AdminMapper;
import evil.devil.dao.impl.AdminMapperImpl;
import evil.devil.entity.Admin;
import evil.devil.service.AdminService;

public class AdminServiceImpl implements AdminService{

	@Override
	public Admin Login(String username, String password) {
		AdminMapper adminMapper=new AdminMapperImpl();
		List<Admin> admins=adminMapper.selectAll();
		for (Admin admin : admins) {
			if(admin.getName().equals(username)&&admin.getPassword().equals(password))
				return admin;
		}
		return null;
	}

}
