package evil.devil.dao.impl;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import evil.devil.dao.AdminMapper;
import evil.devil.entity.Admin;


public class AdminMapperImpl implements AdminMapper{

	static SqlSession session;
	
	static {
	String resource = "conf.xml";
	InputStream is = AdminMapperImpl.class.getClassLoader().getResourceAsStream(resource);
	SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);
	session = sessionFactory.openSession(true);
	}
	
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		int i= session.delete("evil.devil.dao.AdminMapper.deleteByPrimaryKey",id);
		return i;
	}

	@Override
	public int insert(Admin record) {
		int i= session.insert("evil.devil.dao.AdminMapper.insert",record);
		return i;
	}

	@Override
	public int insertSelective(Admin record) {
		int i= session.insert("evil.devil.dao.AdminMapper.insertSelective",record);
		return i;
	}

	@Override
	public Admin selectByPrimaryKey(Integer id) {
		Admin admin = (Admin) session.selectOne("evil.devil.dao.AdminMapper.selectByPrimaryKey",id);
		return admin;
	}
	


	@Override
	public int updateByPrimaryKeySelective(Admin record) {
		int i= session.update("evil.devil.dao.AdminMapper.updateByPrimaryKeySelective",record);
		return i;
	}

	@Override
	public int updateByPrimaryKey(Admin record) {
		int i= session.update("evil.devil.dao.AdminMapper.updateByPrimaryKeySelective",record);
		return i;
	}

	@Override
	public List<Admin> selectAll() {
		List<Admin> admins = session.selectList("evil.devil.dao.AdminMapper.selectAll");
		return admins;
	}
	public static void main(String[] args) {
		AdminMapperImpl a=new AdminMapperImpl();
		List<Admin> list=a.selectAll();
		for (Admin admin : list) {
			System.out.println(admin.getName());
		}
	}
}
