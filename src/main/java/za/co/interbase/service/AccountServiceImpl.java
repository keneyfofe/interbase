package za.co.interbase.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import za.co.interbase.entity.Accounts;
import za.co.interbase.entity.Persons;
import za.co.interbase.repository.AccountRepository;
import za.co.interbase.repository.PersonRepository;
/**
*
* @author keneyfofe
*/
@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountRepository accountRepo;

	@Autowired
	private PersonRepository personRepo;

	@Override
	public String addAccount(Accounts account, String idNumber) {

		String result = "Account already exists.";
		Accounts accounts = accountRepo.findByAccountNumber(account.getAccountNumber());
		if (accounts != null) {
			return result;
		} else {
			Persons person = personRepo.findByIdNumber(idNumber);
			if (person != null) {
				account.setPersonCode(person);
				accountRepo.save(account);
				result = "Account successfully added";
			}
		}
		return result;
	}

	@Override
	public Accounts findByAccountNumber(String accountNumber) {
		return accountRepo.findByAccountNumber(accountNumber);
	}

	@Override
	public String updateAccount(String accountNumber) {
		String result = "Account not updated.";
		Accounts accounts = accountRepo.findByAccountNumber(accountNumber);
		if (accounts == null) {
			return result;
		} else {
			if (accounts.getOutstandingBalance().doubleValue() <= 0F) {
				accountRepo.toggleAccount(accountNumber, false);
				result = "Account successfully udpated";
			} else {
				result = "Account unclossable. Account has possitive outstanding balance";
			}

			return result;
		}
	}

	@Override
	public List<Accounts> findByPerson(Integer personCode) {
		Optional<Persons> persons = personRepo.findById(personCode);
		if (persons.isPresent()) {
			return accountRepo.findByPersonCode(persons.get());
		}

		return new ArrayList<>();
	}

}
