package evil.devil.service;

import evil.devil.entity.User;

public interface UserService {
	User Login(Long username,String password);
	int Register(String username,String password,String idcard,Long tel,String gender);
	int Update(User user);
}
