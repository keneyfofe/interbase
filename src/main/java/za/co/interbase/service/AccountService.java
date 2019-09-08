package za.co.interbase.service;

import java.util.List;

import za.co.interbase.entity.Accounts;
/**
*
* @author keneyfofe
*/
public interface AccountService {
	Accounts findByAccountNumber(String accountNumber);
	String addAccount(Accounts account, String idNumber);
	String updateAccount(String accountNumber);
	List<Accounts> findByPerson(Integer personCode);
}
