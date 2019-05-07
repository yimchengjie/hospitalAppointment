package evil.devil.dao.impl;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import evil.devil.entity.User;


public class UserMapperImpl implements evil.devil.dao.UserMapper{
static SqlSession session;
	
	static {
	String resource = "conf.xml";
	InputStream is = UserMapperImpl.class.getClassLoader().getResourceAsStream(resource);
	SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);
	session = sessionFactory.openSession(true);
	}
	
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		int i= session.delete("evil.devil.dao.UserMapper.deleteByPrimaryKey",id);
		return i;
		
	}

	@Override
	public int insert(User record) {
		int i= session.insert("evil.devil.dao.UserMapper.insert",record);
		return i;
	}

	@Override
	public int insertSelective(User record) {
		int i= session.insert("evil.devil.dao.UserMapper.insertSelective",record);
		return i;
	}

	@Override
	public User selectByPrimaryKey(Integer id) {
		User user = (User) session.selectOne("evil.devil.dao.UserMapper.selectByPrimaryKey",id);
		return user;
	}
	


	@Override
	public int updateByPrimaryKeySelective(User record) {
		int i= session.update("evil.devil.dao.UserMapper.updateByPrimaryKeySelective",record);
		return i;
		
	}

	@Override
	public int updateByPrimaryKey(User record) {
		int i= session.update("evil.devil.dao.UserMapper.updateByPrimaryKey",record);
		return i;
	}
	@Override
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		List<User> list= session.selectList("evil.devil.dao.UserMapper.selectAll");
		return list;
	}
	
	@Override
	public int getAllCount() {
		List<User> users = session.selectList("evil.devil.dao.UserMapper.selectAll");
		int count =users.size();
		return count;
	}
	
	
	@Override
	public List<User> getPage(int pagesize, int currentPage,int totalPage,List<User> users) {
		int count =users.size();
		//最大pagesize
		if (currentPage==totalPage) {//最后一页
			users=users.subList((currentPage-1)*pagesize, count);//3-4
		}
		else { users=users.subList((currentPage-1)*pagesize, currentPage*pagesize);}
		return users;
	}

	
	@Override
	public List<User> getSelectByName(String selectmsg) {//模糊查询
		String selectmsg1="%"+selectmsg+"%";
		List<User> users = session.selectList("evil.devil.dao.UserMapper.getSelectByName",selectmsg1);
		return users;
	}

	@Override
	public List<User> getSelectByGender(String selectmsg) {
		List<User> users = session.selectList("evil.devil.dao.UserMapper.getSelectByGender",selectmsg);
		return users;
	}
	

	
	


	
	public static void main(String[] args) {
		UserMapperImpl u=new UserMapperImpl();
		List<User> list=u.getSelectByName("毛毛");
		for (User user : list) {
			System.out.println(user);
		}
		
	}
}
