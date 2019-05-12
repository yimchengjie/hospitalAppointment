package evil.devil.servcie.impl;

import java.util.Date;
import java.util.List;

import evil.devil.dao.AccountMapper;
import evil.devil.dao.impl.AccountMapperImpl;
import evil.devil.entity.Account;
import evil.devil.service.AccountService;

public class AccountServiceImpl implements AccountService{

	@Override
	public int Reserve(Account account) {
		// TODO Auto-generated method stub
		AccountMapper accountMapper=new AccountMapperImpl();
		List<Account> accounts=accountMapper.selectByDoctor(account.getDoctorId());
		for (Account account2 : accounts) {
			if(account2.getDateTime().equals(account.getDateTime()))
				return -1;
		}
		account.setAccountTime(new Date());
		return accountMapper.insert(account);
	}

}
