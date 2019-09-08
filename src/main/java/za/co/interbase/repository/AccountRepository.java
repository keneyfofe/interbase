package za.co.interbase.repository;

import java.math.BigDecimal;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import za.co.interbase.entity.Accounts;
import za.co.interbase.entity.Persons;
/**
*
* @author keneyfofe
*/
@Repository
public interface AccountRepository extends JpaRepository<Accounts, Integer> {

	Accounts findByAccountNumber(@Param("accountNumber") String accountNumber);

	List<Accounts> findByPersonCode(@Param("personCode") Persons personCode);

	@Transactional
	@Modifying
	@Query("UPDATE Accounts a SET a.status = :status  WHERE a.accountNumber = :accountNumber")
	Integer toggleAccount(@Param("accountNumber") String accountNumber, @Param("status") boolean status);

	@Transactional
	@Modifying
	@Query("UPDATE Accounts a SET a.outstandingBalance = :outstandingBalance  WHERE a.accountNumber = :accountNumber")
	Integer updateAccountBalance(@Param("accountNumber") String accountNumber,
			@Param("outstandingBalance") BigDecimal outstandingBalance);
}
