package evil.devil.servcie.impl;

import java.util.List;

import evil.devil.dao.UserMapper;
import evil.devil.dao.impl.UserMapperImpl;
import evil.devil.entity.User;
import evil.devil.service.UserService;

public class UserServiceImpl implements UserService {

	@Override
	public User Login(Long username, String password) {
		UserMapper userMapper=new UserMapperImpl();
		List<User> users=userMapper.selectAll();
		for (User user : users) {
			if(user.getTel().equals(username)&&user.getPassword().equals(password))
				return user;
		}
		return null;
	}

	@Override
	public int Register(String username, String password, String idcard, Long tel, String gender) {
		UserMapper userMapper=new UserMapperImpl();
		int flag=ifUser(idcard,tel,0);
		if(flag!=0)
			return flag;
		User user=new User();
		user.setGender(gender);
		user.setName(username);
		user.setIdcard(idcard);
		user.setTel(tel);
		user.setPassword(password);
		user.setType(0);
		return userMapper.insert(user);
	}
	@Override
	public int Update(User user) {
		// TODO Auto-generated method stub
		UserMapper userMapper=new UserMapperImpl();
		int flag=ifUser(user.getIdcard(),user.getTel(),user.getId());
		if(flag!=0)
			return flag;
		
		return userMapper.updateByPrimaryKey(user);
	}
	int ifUser(String idcard ,Long tel,Integer id) {
		UserMapper userMapper=new UserMapperImpl();
		List<User> users=userMapper.selectAll();
		for (User user : users) {
			if(user.getId()!=id) {
			if(user.getIdcard().equals(idcard))
				return -1;
			if(user.getTel().equals(tel))
				return -2;
			}
		}
		return 0;
	}
}
