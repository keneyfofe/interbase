package za.co.interbase.endpoints;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import za.co.interbase.entity.Persons;
import za.co.interbase.service.PersonService;
/**
*
* @author keneyfofe
*/
@RestController
@RequestMapping("/api")
public class PersonResource {

	@Autowired
	private PersonService personService;

	@CrossOrigin(origins = "*")
	@PostMapping("/createPerson")
	public String createPerson(@RequestBody @Valid Persons person) {
		return personService.createPerson(person.getName().toUpperCase(), person.getSurname().toUpperCase(),
				person.getIdNumber().toUpperCase());
	}

	@CrossOrigin(origins = "*")
	@PostMapping("/updatePerson")
	public String updatePerson(@RequestBody @Valid Persons person) {
		return personService.updatePerson(person.getCode(), person.getName().toUpperCase(),
				person.getSurname().toUpperCase(), person.getIdNumber().toUpperCase());
	}

	@CrossOrigin(origins = "*")
	@GetMapping("/findAllPerson")
	public List<Persons> findAllPerson() {
		return personService.findAll();
	}

	@CrossOrigin(origins = "*")
	@GetMapping("/findPerson")
	public Persons findPerson(@RequestParam String idNumber) {
		return personService.findByIdNumber(idNumber.trim());
	}
	
	@CrossOrigin(origins = "*")
	@GetMapping("/findPersonCode")
	public Persons findPersonCode(@RequestParam Integer code) {
		return personService.findByIdCode(code);
	}

	@CrossOrigin(origins = "*")
	@DeleteMapping("/deletePerson")
	public boolean deletePerson(@RequestParam String idNumber) {
		return personService.deletePerson(idNumber.trim());
	}

}
