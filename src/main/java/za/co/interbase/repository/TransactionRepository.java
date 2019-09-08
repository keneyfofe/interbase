package za.co.interbase.repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import za.co.interbase.entity.Accounts;
import za.co.interbase.entity.Transactions;
/**
*
* @author keneyfofe
*/
@Repository
public interface TransactionRepository extends JpaRepository<Transactions, Integer> {

	List<Transactions> findByAccountCode(@Param("accountCode") Accounts accountCode);

	@Transactional
	@Modifying
	@Query("UPDATE Transactions t SET t.amount = :amount, t.transactionDate = :transactionDate  WHERE t.code = :code")
	Integer updateTransactionAmount(@Param("code") Integer code, @Param("amount") BigDecimal amount,
			@Param("transactionDate") Date transactionDate);
}
