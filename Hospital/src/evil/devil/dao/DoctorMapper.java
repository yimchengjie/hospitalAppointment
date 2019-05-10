package evil.devil.dao;

import java.util.List;

import evil.devil.entity.Doctor;
import evil.devil.entity.User;

public interface DoctorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);
    
    List<Doctor> selectAll();

	 public List<Doctor> getByDeaprt(Integer id);
}