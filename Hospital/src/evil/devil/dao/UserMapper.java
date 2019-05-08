package evil.devil.dao;

import java.util.List;

import evil.devil.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectAll();
    
    public int getAllCount();

    public List<User> getPage(int pagesize, int currentPage, int totalPage, List<User> users);

    public List<User> getSelectByName(String selectmsg);

    public List<User> getSelectByGender(String selectmsg);

<<<<<<< HEAD
    public List<User> getSelectByIdcard(String selectmsg);

    public List<User> getSelectByPhone(String selectmsg);
=======
	List<User> getSelectByPhone(String selectmsg);

	List<User> getSelectByIdcard(String selectmsg);
>>>>>>> branch 'master' of https://gitee.com/evildevil/hospital.git
}