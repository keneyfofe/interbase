package za.co.interbase.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import za.co.interbase.entity.Transactions;
/**
*
* @author keneyfofe
*/

public interface TransactionService {
	
	Transactions findById(Integer code);

	String addTransaction(String accountNumber, BigDecimal amount, String description, String transactionType, Date transactionDate);
	
	String updateTransactionAmount(Integer code, BigDecimal amount, String transactionType, Date transactionDate);
	
	List<Transactions> findByAccount(Integer accountCode);

}
