package evil.devil.dao;

import java.util.List;

import evil.devil.entity.Account;
import evil.devil.entity.User;

public interface AccountMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer id);

    Account selectByUser(Integer id);
    
    Account selectByDoctor(Integer id);
    
    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
    
    List<Account> selectAll();
}