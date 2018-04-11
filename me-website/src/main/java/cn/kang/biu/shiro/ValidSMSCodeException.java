package cn.kang.biu.shiro;

import org.apache.shiro.authc.AuthenticationException;

public class ValidSMSCodeException  extends AuthenticationException{
  
  /** 
  * @Fields serialVersionUID : TODO 变量名称 
  */  
  
  private static final long serialVersionUID = 1L;

  /**
   * Creates a new UnknownAccountException.
   */
  public ValidSMSCodeException() {
      super();
  }

  /**
   * Constructs a new ValidSMSCodeException.
   *
   * @param message the reason for the exception
   */
  public ValidSMSCodeException(String message) {
      super(message);
  }

  /**
   * Constructs a new ValidSMSCodeException.
   *
   * @param cause the underlying Throwable that caused this exception to be thrown.
   */
  public ValidSMSCodeException(Throwable cause) {
      super(cause);
  }

  /**
   * Constructs a new ValidSMSCodeException.
   *
   * @param message the reason for the exception
   * @param cause   the underlying Throwable that caused this exception to be thrown.
   */
  public ValidSMSCodeException(String message, Throwable cause) {
      super(message, cause);
  }
}
