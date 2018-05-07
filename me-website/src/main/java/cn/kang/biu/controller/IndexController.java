package cn.kang.biu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import cn.kang.biu.service.UserAuthService;
import cn.kang.biu.shiro.credentials.AuthenticationUserInfo;
import platform.common.base.console.controller.BaseController;

@Controller
public class IndexController extends BaseController {

	private final Logger logger = Logger.getLogger(IndexController.class);
	
	@Autowired
	private UserAuthService userAuthService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView accessIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(!SecurityUtils.getSubject().isAuthenticated()) {
			ModelAndView view = new ModelAndView("login");
			return view;
		}
		return index(request, response);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String header = request.getHeader("X-Requested-With");
		if("XMLHttpRequest".equalsIgnoreCase(header)){
			logger.error("--> 当前请求为Ajax请求,尴尬了.");
		}
		
		return index(request, response);
	}
	
	/**
	 * 跳转到首页
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Subject subject = SecurityUtils.getSubject();
		if(!SecurityUtils.getSubject().isAuthenticated()) {
			ModelAndView view = new ModelAndView("login");
			return modelData(request,response);
		}
		return new ModelAndView("index");
	}


	/**
	 * 请求登录
	 * @param request
	 * @param response
	 * @param username
	 * @param password
	 * @param code
	 * @param operator_id
	 * @param agent_id
	 * @param from
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/doLogin",method=RequestMethod.POST)
	public String doLogin(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password){
		JSONObject jsonObject = new JSONObject();
		String userAgent = request.getHeader("User-Agent");
		try {
			
			AuthenticationUserInfo token = new AuthenticationUserInfo();
			token.setUsername(username);
			token.setPassword(password.toCharArray());
			token.setRememberMe(true);
			
			Subject currentUser = SecurityUtils.getSubject();
			try {
				currentUser.login(token);
				if(currentUser.isAuthenticated()){
					jsonObject.put("code", 10000);
					jsonObject.put("msg", "success");
					return jsonObject.toJSONString();
				}
			} catch (UnknownAccountException e) {
				jsonObject.put("code", 3);
				jsonObject.put("msg", "用户名不存在");
				return jsonObject.toJSONString();
			} catch (IncorrectCredentialsException e) {
				jsonObject.put("code", 4);
				jsonObject.put("msg", "密码错误");
				return jsonObject.toJSONString();
			}catch (DisabledAccountException e) {
				jsonObject.put("code", 5);
				jsonObject.put("msg", "用户被禁用");
				return jsonObject.toJSONString();
			}catch (AuthenticationException e) {
				jsonObject.put("code", 6);
				jsonObject.put("msg", "登录异常");
				return jsonObject.toJSONString();
			}
			return jsonObject.toJSONString();
		} catch (Exception e) {
			jsonObject.put("code", 1);
			jsonObject.put("msg", "查询异常");
			return jsonObject.toJSONString();
		}
	}
	
	/**
	 * 注销
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public Object logout() {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			//userAuthService.logout(UserToken.getUserId());
			
			subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
		}
		return new ModelAndView("redirect:" + "/");
	}
	
	
	
	
	/**
	 * 校验验证码，返回凭证
	 * @param request
	 * @param response
	 * @param operator_id
	 * @param agent_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/vali_code",method=RequestMethod.POST)
	public String valiCode(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "area_code", required = false) String area_code,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "vali_code", required = true) String vali_code){
		JSONObject jsonObject = new JSONObject();
		try {
			
			return userAuthService.valiCode(vali_code, request.getHeader("User-Agent"), area_code, phone);
		} catch (Exception e) {
			logger.error("校验验证码异常", e);
			jsonObject.put("code", 1);
			jsonObject.put("msg", "查询异常");
			return jsonObject.toJSONString();
		}
	}
	
	private ModelAndView modelData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		List<Map<String,Object>> nvs = userAuthService.getMenuLists();
		view.addObject("nav_list", nvs);
		
		return view;
	}
	
	
	/**
	 * 发送短信验证码
	 * @param request
	 * @param response
	 * @param operator_id
	 * @param agent_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/send_message",method=RequestMethod.POST)
	public String sendMessage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "area_code", required = false) String area_code,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "msg_token", required = true) String msg_token){
		JSONObject jsonObject = new JSONObject();
		try {
			
			return userAuthService.sendMessage(area_code, phone, msg_token);
			
		} catch (Exception e) {
			logger.error("发送短信验证码异常", e);
			jsonObject.put("code", 1);
			jsonObject.put("msg", "查询异常");
			return jsonObject.toJSONString();
		}
	}
	
	
}
