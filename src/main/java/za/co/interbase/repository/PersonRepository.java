package za.co.interbase.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import za.co.interbase.entity.Persons;
/**
*
* @author keneyfofe
*/
@Repository
public interface PersonRepository extends JpaRepository<Persons, Integer> {
	Persons findByIdNumber(@Param("idNumber") String idNumber);

	List<Persons> findAll();

	@Transactional
	@Modifying
	@Query("UPDATE Persons p SET p.name = :name, p.surname = :surname, p.idNumber = :idNumber WHERE p.code = :code")
	Integer updatePerson(@Param("code") Integer code, @Param("name") String name, @Param("surname") String surname,
			@Param("idNumber") String idNumber);

}
