package za.co.interbase.exceptions;
/**
*
* @author keneyfofe
*/
public class InvalidTransactionAmount extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public InvalidTransactionAmount() {
		super("Invalid transaction amount. Only positive values allowd.");
	}

	public InvalidTransactionAmount(String message) {
		super(message);
	}

}
