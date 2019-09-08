package za.co.interbase.endpoints;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import za.co.interbase.entity.Transactions;
import za.co.interbase.exceptions.InvalidTransactionAmount;
import za.co.interbase.service.TransactionService;

/**
*
* @author keneyfofe
*/

@RestController
@RequestMapping("/api")
public class TransactionResource {

	private static final Logger LOGGER = Logger.getLogger(TransactionResource.class.getName());

	@Autowired
	private TransactionService transactionService;

	@CrossOrigin(origins = "*")
	@PostMapping("/addTransaction")
	public String addTransaction(@RequestParam String accountNumber, @RequestParam String transactionType,
			@RequestBody Transactions transaction) {

		try {
			if (transaction.getAmount().doubleValue() <= 0) {
				throw new InvalidTransactionAmount();
			} else {
				return transactionService.addTransaction(accountNumber, transaction.getAmount(),
						transaction.getDescription(), transactionType, transaction.getTransactionDate());
			}
		} catch (InvalidTransactionAmount e) {
			LOGGER.log(Level.SEVERE, "Exception occur", e);
			return e.getMessage();

		} catch (Exception ex) {
			LOGGER.log(Level.SEVERE, "Exception occur", ex);
			return "Error occured while saving...";
		}

	}

	@CrossOrigin(origins = "*")
	@PutMapping("/updateTransaction")
	public String updateTransactionAmount(@RequestBody Transactions transaction, @RequestParam String transactionType) {
		try {
			if (transaction.getAmount().doubleValue() <= 0) {
				throw new InvalidTransactionAmount();
			} else {
				return transactionService.updateTransactionAmount(transaction.getCode(), transaction.getAmount(),
						transactionType, transaction.getTransactionDate());
			}
		} catch (InvalidTransactionAmount e) {
			LOGGER.log(Level.SEVERE, "Exception occur", e);
		}
		return "Invalid transaction amount. Only positive values allowd.";

	}

	@CrossOrigin(origins = "*")
	@GetMapping("/getAccountTransactions")
	public List<Transactions> findByAccount(@RequestParam Integer accountCode) {
		return transactionService.findByAccount(accountCode);
	}

	@CrossOrigin(origins = "*")
	@GetMapping("/getTransactionById")
	public Transactions findTransactionById(@RequestParam Integer code) {
		return transactionService.findById(code);
	}
}
