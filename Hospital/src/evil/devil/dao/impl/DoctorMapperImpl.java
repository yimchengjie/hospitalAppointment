package evil.devil.dao.impl;

import java.io.InputStream;
import java.util.List;

import javax.print.Doc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import evil.devil.dao.DoctorMapper;
import evil.devil.entity.Doctor;
import evil.devil.entity.User;


public class DoctorMapperImpl implements DoctorMapper {
static SqlSession session;
	
	static {
	String resource = "conf.xml";
	InputStream is = DoctorMapperImpl.class.getClassLoader().getResourceAsStream(resource);
	SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);
	session = sessionFactory.openSession(true);
	}
	
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		int i= session.delete("evil.devil.dao.DoctorMapper.deleteByPrimaryKey",id);
		return i;
	}

	@Override
	public int insert(Doctor record) {
		int i= session.insert("evil.devil.dao.DoctorMapper.insert",record);
		return i;
	}

	@Override
	public int insertSelective(Doctor record) {
		int i= session.insert("evil.devil.dao.DoctorMapper.insertSelective",record);
		return i;
	}

	@Override
	public Doctor selectByPrimaryKey(Integer id) {
		Doctor doctor = (Doctor) session.selectOne("evil.devil.dao.DoctorMapper.selectByPrimaryKey",id);
		return doctor;
	}
	


	@Override
	public int updateByPrimaryKeySelective(Doctor record) {
		int i= session.update("evil.devil.dao.DoctorMapper.updateByPrimaryKeySelective",record);
		return i;
	}

	@Override
	public int updateByPrimaryKey(Doctor record) {
		int i= session.update("evil.devil.dao.DoctorMapper.updateByPrimaryKeySelective",record);
		return i;
	}

	@Override
	public List<Doctor> selectAll() {
		List<Doctor> list= session.selectList("evil.devil.dao.DoctorMapper.selectAll");
		return list;
	}
	public static void main(String[] args) {
		DoctorMapperImpl d=new DoctorMapperImpl();
		List<Doctor> l=d.selectAll();
		for (Doctor doctor : l) {
			System.out.println(doctor.getName());
		}
	}

}
