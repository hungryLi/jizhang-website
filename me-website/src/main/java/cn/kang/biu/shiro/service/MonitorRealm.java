package cn.kang.biu.shiro.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import cn.kang.biu.service.UserAuthService;
import cn.kang.biu.shiro.credentials.AuthenticationUserInfo;
import cn.kang.biu.vo.UserInfoVO;
import platform.common.utils.Springfactory;

@Service("monitorRealm")
public class MonitorRealm extends AuthorizingRealm {
	
	private final Logger logger = Logger.getLogger(MonitorRealm.class);

	public MonitorRealm() {
		super();
	}

	// 授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 查询用户授权信息
		return new SimpleAuthorizationInfo();
	}

	/**
	 * 认证回调函数,登录时调用
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {
		/* 这里编写认证代码 */
		AuthenticationUserInfo token = (AuthenticationUserInfo) authcToken;
		UserAuthService userAuthService = Springfactory.getBean("userAuthServie");
		String password = String.valueOf(token.getPassword());
		String userName = token.getUsername();
		
		JSONObject jsonObject = null;
		UserInfoVO user = null;
		logger.info("==> 请求登录认证，用户名:" + userName);
		Map<String, Object> loginMap = new HashMap<String, Object>();
		loginMap.put("login_id", userName);
		loginMap.put("passwd", password);
		loginMap.put("user_agent", token.getUserAgent());
		try {
			String result = userAuthService.userAuth(loginMap);
			jsonObject = new JSONObject(result);
		} catch (Exception e) {
			logger.error(" monitorRealm  doGetAuthenticationInfo error: ", e);
			throw new AuthenticationException("AuthenticationException   ");
		}
		if("0".equals(jsonObject.optString("code")) && jsonObject.has("res_data")){
			user = new UserInfoVO();
			JSONObject json = jsonObject.optJSONObject("res_data");
			user.setId(json.optInt("user_id"));
			user.setUserName(json.optString("user_name"));
			user.setLoginId(json.optString("user_name"));
			user.setPhone(json.optString("phone"));
			user.setEmail(json.optString("email"));
			user.setToken(json.optString("token"));
			
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			session.setAttribute("userinfo", user);
		}else if("3".equals(jsonObject.optString("code"))){
			throw new UnknownAccountException("username is not exist");
		}else if("4".equals(jsonObject.optString("code"))){
			throw new IncorrectCredentialsException("password mistake");
		}else if("5".equals(jsonObject.optString("code"))){
			throw new DisabledAccountException("user name is disabled");
		}else{
			throw new AuthenticationException("AuthenticationException");
		}
		return new SimpleAuthenticationInfo(user, password, getName());
	}

	public void clearCachedAuthorizationInfo(String principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
		clearCachedAuthorizationInfo(principals);
	}
	
	
}
