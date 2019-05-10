package evil.devil.dao.impl;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import evil.devil.dao.DepartmentMapper;
import evil.devil.entity.Department;


public class DepartmentMapperImpl implements DepartmentMapper {
static SqlSession session;
	
	static {
	String resource = "conf.xml";
	InputStream is = DepartmentMapperImpl.class.getClassLoader().getResourceAsStream(resource);
	SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);
	session = sessionFactory.openSession(true);
	}
	
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		int i= session.delete("evil.devil.dao.DepartmentMapper.deleteByPrimaryKey",id);
		return i;
	}

	@Override
	public int insert(Department record) {
		int i= session.insert("evil.devil.dao.DepartmentMapper.insert",record);
		return i;
	}

	@Override
	public int insertSelective(Department record) {
		int i= session.insert("evil.devil.dao.DepartmentMapper.insertSelective",record);
		return i;
	}

	@Override
	public Department selectByPrimaryKey(Integer id) {
		Department department = (Department) session.selectOne("evil.devil.dao.DepartmentMapper.selectByPrimaryKey",id);
		return department;
	}
	


	@Override
	public int updateByPrimaryKeySelective(Department record) {
		int i= session.update("evil.devil.dao.DepartmentMapper.updateByPrimaryKeySelective",record);
		return i;
	}

	@Override
	public int updateByPrimaryKey(Department record) {
		int i= session.update("evil.devil.dao.DepartmentMapper.updateByPrimaryKeySelective",record);
		return i;
	}

	@Override
	public List<Department> selectAll() {
		// TODO Auto-generated method stub
		List<Department> list= session.selectList("evil.devil.dao.DepartmentMapper.selectAll");
		return list;
	}
	public static void main(String[] args) {
		DepartmentMapperImpl d=new DepartmentMapperImpl();
		List<Department> a=d.selectAll();
		for (Department department : a) {
			System.out.println(department.getName());
		}
	}


}
