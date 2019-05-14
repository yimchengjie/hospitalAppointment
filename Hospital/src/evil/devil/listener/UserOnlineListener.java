package evil.devil.listener;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import evil.devil.dao.UserMapper;
import evil.devil.dao.impl.UserMapperImpl;
import evil.devil.entity.User;
import evil.devil.servcie.impl.UserServiceImpl;
import evil.devil.service.UserService;

public class UserOnlineListener implements HttpSessionBindingListener {
	int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	@Override
	public void valueBound(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		UserService userService=new UserServiceImpl();
		UserMapper userMapper=new UserMapperImpl();
		User user=userMapper.selectByPrimaryKey(id);
		user.setType(1);
		userService.Update(user);
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		UserService userService=new UserServiceImpl();
		UserMapper userMapper=new UserMapperImpl();
		User user=userMapper.selectByPrimaryKey(id);
		user.setType(0);
		userService.Update(user);
	}
	
}
