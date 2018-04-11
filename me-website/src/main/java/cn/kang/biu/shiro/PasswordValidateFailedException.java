package cn.kang.biu.shiro;

import org.apache.shiro.authc.AuthenticationException;

public class PasswordValidateFailedException extends AuthenticationException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6891507481847634129L;
	 /**
	   * Creates a new UnknownAccountException.
	   */
	  public PasswordValidateFailedException() {
	      super();
	  }

	  /**
	   * Constructs a new ValidSMSCodeException.
	   *
	   * @param message the reason for the exception
	   */
	  public PasswordValidateFailedException(String message) {
	      super(message);
	  }

	  /**
	   * Constructs a new ValidSMSCodeException.
	   *
	   * @param cause the underlying Throwable that caused this exception to be thrown.
	   */
	  public PasswordValidateFailedException(Throwable cause) {
	      super(cause);
	  }

	  /**
	   * Constructs a new ValidSMSCodeException.
	   *
	   * @param message the reason for the exception
	   * @param cause   the underlying Throwable that caused this exception to be thrown.
	   */
	  public PasswordValidateFailedException(String message, Throwable cause) {
	      super(message, cause);
	  }
}
