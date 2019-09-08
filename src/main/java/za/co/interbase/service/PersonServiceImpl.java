package za.co.interbase.service;

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
public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonRepository personRepo;

	@Autowired
	private AccountRepository accountRepo;

	@Override
	public String createPerson(String name, String surname, String idNumber) {

		String result = "Person already created.";

		if (personRepo.findByIdNumber(idNumber) == null) {
			Persons personObject = personRepo.save(new Persons(name, surname, idNumber));
			if (personObject != null) {
				result = "Person successfully created.";
			}
		}
		return result;
	}

	@Override
	public String updatePerson(Integer code, String name, String surname, String idNumber) {

		String result = "Person does not exist.";

		if (personRepo.findById(code).isPresent()) {
			Integer personObject = personRepo.updatePerson(code, name, surname, idNumber);
			if (personObject != null) {
				result = "Person successfully updated.";
			}
		}
		return result;
	}

	@Override
	public Persons findByIdNumber(String idNumber) {
		return personRepo.findByIdNumber(idNumber);
	}

	@Override
	public Persons findByIdCode(Integer code) {
		Optional<Persons> persons = personRepo.findById(code);
		if (persons.isPresent()) {
			return personRepo.findById(code).get();
		}

		return new Persons();
	}

	@Override
	public List<Persons> findAll() {
		return personRepo.findAll();
	}

	@Override
	public boolean deletePerson(String idNumber) {

		Persons person = findByIdNumber(idNumber);

		if (person != null) {
			// Delete when the person has no account
			List<Accounts> accountList = accountRepo.findByPersonCode(person);
			if (accountList.isEmpty()) {
				personRepo.deleteById(person.getCode());
				return true;
			}

			for (Accounts accountObject : accountList) {
				// At least one active account is enough to prevent delete
				if (accountObject.getStatus() == true) {
					return false;
				}
			}
			personRepo.deleteById(person.getCode());
			return true;
		}
		return false;
	}

}
