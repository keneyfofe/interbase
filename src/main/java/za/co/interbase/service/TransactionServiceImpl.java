package za.co.interbase.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import za.co.interbase.endpoints.TransactionResource;
import za.co.interbase.entity.Accounts;
import za.co.interbase.entity.Transactions;
import za.co.interbase.exceptions.AccountNotFoundException;
import za.co.interbase.repository.AccountRepository;
import za.co.interbase.repository.TransactionRepository;

/**
 *
 * @author keneyfofe
 */
@Service
public class TransactionServiceImpl implements TransactionService {

	private static final Logger LOGGER = Logger.getLogger(TransactionServiceImpl.class.getName());

	@Autowired
	private TransactionRepository transactionRepo;

	@Autowired
	private AccountRepository accountRepo;

	@Override
	public String addTransaction(String accountNumber, BigDecimal amount, String description, String transactionType,
			Date transactionDate) {

		String result = "Transaction not successfully added.";
		try {
			Accounts account = accountRepo.findByAccountNumber(accountNumber);
			if (account == null) {
				throw new AccountNotFoundException();
			}
			if (account != null && account.getStatus()) {
				Transactions transaction = new Transactions(transactionDate, new Date(), amount, description);
				transaction.setAccountCode(account);
				transactionRepo.save(transaction);

				// update account balance
				if (transactionType.equals("debit")) {
					accountRepo.updateAccountBalance(accountNumber, account.getOutstandingBalance().subtract(amount));
				} else {
					accountRepo.updateAccountBalance(accountNumber, account.getOutstandingBalance().add(amount));
				}

				result = "Transaction successfully added.";
			} else {
				result = "Account is closed. No new operations allowed";
			}
		} catch (AccountNotFoundException e) {
			LOGGER.log(Level.SEVERE, "Exception occur", e);
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Exception occur", e);
		}
		return result;
	}

	@Override
	public String updateTransactionAmount(Integer code, BigDecimal amount, String transactionType,
			Date transactionDate) {
		String result = "Transaction not successfully updated.";
		Optional<Transactions> transactions = transactionRepo.findById(code);

		if (transactions.isPresent()) {
			Transactions transaction = transactions.get();
			// check if account is closed or not
			if (transaction.getAccountCode().getStatus()) {
				/*
				 * take the transaction old amount and add to the current account balance to
				 * reverse the previous minus operation then do a new calculation on the
				 * accounts and transactions entities to update with new balances
				 * 
				 */

				// update transaction with new amount
				transactionRepo.updateTransactionAmount(transaction.getCode(), amount, transactionDate);
				BigDecimal originalAmount = null;
				// update account balance with new amount
				if (transactionType.equals("debit")) {
					originalAmount = transaction.getAccountCode().getOutstandingBalance().add(transaction.getAmount());
					accountRepo.updateAccountBalance(transaction.getAccountCode().getAccountNumber(),
							originalAmount.subtract(amount));
				} else if (transactionType.equals("credit")) {
					originalAmount = transaction.getAccountCode().getOutstandingBalance()
							.subtract(transaction.getAmount());
					accountRepo.updateAccountBalance(transaction.getAccountCode().getAccountNumber(),
							originalAmount.add(amount));
				} else {
					result = "Invalid transaction type supplied.";
				}
				result = "Transaction successfully updated.";
			} else {
				result = "Account is closed. No new operations allowed";
			}
		}

		return result;
	}

	@Override
	public List<Transactions> findByAccount(Integer accountCode) {
		Optional<Accounts> accounts = accountRepo.findById(accountCode);
		if (accounts.isPresent()) {
			return transactionRepo.findByAccountCode(accounts.get());
		}
		return new ArrayList<Transactions>();
	}

	@Override
	public Transactions findById(Integer code) {
		Optional<Transactions> transactions = transactionRepo.findById(code);
		if (transactions.isPresent()) {
			return transactions.get();
		}
		return new Transactions();
	}

}
