package za.co.interbase.service;

import java.util.List;

import za.co.interbase.entity.Persons;
/**
*
* @author keneyfofe
*/
public interface PersonService {
	String createPerson(String name, String surname, String idNumber);
	String updatePerson(Integer code, String name, String surname, String idNumber);
	Persons findByIdNumber(String idNumber);
	Persons findByIdCode(Integer code);
	List<Persons> findAll();
	boolean deletePerson(String idNumber);
}
