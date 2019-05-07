package evil.devil.dao;

import java.util.List;

import evil.devil.entity.Account;
import evil.devil.entity.Admin;
import evil.devil.entity.User;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
    
    List<Admin> selectAll();
}