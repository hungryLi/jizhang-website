package cn.kang.biu.shiro.service;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

import cn.kang.biu.vo.UserInfoVO;


/**
 * @author Administrator
 * @
 */
public class UserToken {
	
	/**
	 * 获取当前登录的用户
	 * 目前当前登录用户的信息如下：
	 *  user.setId(json.optInt("user_id"));
    	user.setUserName(json.optString("login_id"));
    	user.setLoginId(json.optString("login_id"));
    	user.setPhoneNumber(json.optString("phone_number"));
    	user.setEmail(json.optString("email"));
    	user.setSupplierId(json.optInt("supplier_id"));
    	user.setOperId(json.optInt("oper_id"));
    	user.setAgentId(json.optInt("agent_id"));
	 * @return
	 */
	public static UserInfoVO getToken(){
		UserInfoVO token = (UserInfoVO)SecurityUtils.getSubject().getPrincipal();
		return token ;
	}
	
	
	
	/**
	 * 获取当前用户的Session
	 * @return
	 */
	public static Session getSession(){
		return SecurityUtils.getSubject().getSession();
	}
	/**
	 * 获取当前用户NAME
	 * @return
	 */
	public static String getUserName(){
		return getToken().getUserName();
	}
	/**
	 * 获取当前用户ID
	 * @return
	 */
	public static Integer getUserId(){
		return getToken()==null?null:getToken().getId();
	}
	
	/**
	 * 获取登录返回的token
	 * @return
	 */
	public static String getLoginToken(){
		return getToken() == null ? null : getToken().getToken();
	}
	
	/**
	 * 把值放入到当前登录用户的Session里
	 * @param key
	 * @param value
	 */
	public static void setVal2Session(Object key ,Object value){
		getSession().setAttribute(key, value);
	}
	/**
	 * 从当前登录用户的Session里取值
	 * @param key
	 * @return
	 */
	public static Object getVal2Session(Object key){
		return getSession().getAttribute(key);
	}

	/**
	 * 判断是否登录
	 * @return
	 */
	public static boolean isLogin() {
		return null != SecurityUtils.getSubject().getPrincipal();
	}
}
