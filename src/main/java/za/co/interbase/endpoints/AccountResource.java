package za.co.interbase.endpoints;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import za.co.interbase.entity.Accounts;
import za.co.interbase.service.AccountService;
/**
*
* @author keneyfofe
*/

@RestController
@RequestMapping("/api")
public class AccountResource {

	@Autowired
	private AccountService accountService;

	@CrossOrigin(origins = "*")
	@PostMapping("/addAccount")
	public String addAccount(@RequestParam String idNumber, @RequestParam String accountNumber,
			@RequestParam BigDecimal outstandingBalance, @RequestParam boolean status) {

		Accounts account = new Accounts(accountNumber, outstandingBalance, status);
		return accountService.addAccount(account, idNumber);
	}

	@CrossOrigin(origins = "*")
	@PutMapping("/closeAccount")
	public String closeAccount(String accountNumber) {
		return accountService.updateAccount(accountNumber);
	}

	@CrossOrigin(origins = "*")
	@GetMapping("/getAccount")
	public Accounts findByAccountNumber(@RequestParam String accountNumber) {
		return accountService.findByAccountNumber(accountNumber);
	}
	
	@CrossOrigin(origins = "*")
	@GetMapping("/getPersonAccounts")
	public List<Accounts> findByPerson(@RequestParam Integer personCode){
		return accountService.findByPerson(personCode);
	}
}
