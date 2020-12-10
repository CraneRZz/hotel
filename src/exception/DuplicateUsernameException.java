package exception;

public class DuplicateUsernameException extends Exception {

	public DuplicateUsernameException() {
	}

	public DuplicateUsernameException(String message) {
		super(message);
	}

	public DuplicateUsernameException(Throwable cause) {
		super(cause);
	}

	public DuplicateUsernameException(String message, Throwable cause) {
		super(message, cause);
	}

}
