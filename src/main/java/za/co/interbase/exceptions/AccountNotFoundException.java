package za.co.interbase.exceptions;
/**
*
* @author keneyfofe
*/
public class AccountNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	public AccountNotFoundException() {
		super("New transaction can only be added after the is created");
	}
	
	public AccountNotFoundException(String message) {
		super(message);
	}

}
