package cn.kang.biu.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
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

import cn.kang.biu.common.CookieUtils;
import cn.kang.biu.service.SpringPropertiesUtil;
import cn.kang.biu.service.UserAuthService;
import cn.kang.biu.shiro.credentials.AuthenticationUserInfo;
import cn.kang.biu.shiro.service.UserToken;
import platform.common.base.console.controller.BaseController;

@Controller
public class IndexController extends BaseController {

	private final Logger logger = Logger.getLogger(IndexController.class);
	
	@Autowired
	private UserAuthService userAuthService;
	
	private static String version = SpringPropertiesUtil.getProperty("platform-current-release");
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView accessIndex(HttpServletRequest request, HttpServletResponse response) {
		return index(request, response);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
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
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();

        Enumeration headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = (String) headerNames.nextElement();
            String value = request.getHeader(key);
            map.put(key, value);
            logger.info("get header :"+key+":"+value);
        }
		
        String host = request.getHeader("Host");
        logger.info("=====host："+host);
		
		String domain = request.getServerName();
//		Map<String, String> domainIndex = domainIndexservice.getDomainBaseByName(domain);
//		if(domainIndex == null || domainIndex.isEmpty()){
//			logger.info("==> 没有找到该站点【"+domain+"】对应的运营商或代理商信息.");
//			mv.setViewName("error/undefined");
//			return mv;
//		}
//		String templateName = domainIndex.get("temp_code");
//		if(StringUtils.isBlank(templateName)){
//			templateName = "general";
//		}else if(String.valueOf(WebsiteRedisKeyConstant.FOUR).equals(domainIndex.get("status"))){
////			mv.addObject("footer_list", domainIndexservice.getFooterList(domainIndex.get("operator_id"),domainIndex.get("agent_id")));
//			mv.setViewName(templateName+"/503");
//			return mv;
//		}
		try {
//			String liveChat =liveChatService.getLiveChatInfo(domain);
//			mv.addObject("liveChat",liveChat );
		} catch (Exception exception) {
			logger.error("--> 获取liveChatInfo异常.", exception);
		}
//		CookieUtils.addCookie(response, "templateName", templateName);
//		CookieUtils.addCookie(response, "operator_id", domainIndex.get("operator_id"));
//		CookieUtils.addCookie(response, "agent_id", domainIndex.get("agent_id"));
//		CookieUtils.addCookie(response, "is_down_line", domainIndex.get("is_down_line"));
//		mv.setViewName(templateName+"/html/index");
//		mv.addObject("templateName", templateName);
//		mv.addObject("operator_id", domainIndex.get("operator_id"));
//		mv.addObject("agent_id", domainIndex.get("agent_id"));
//		mv.addObject("is_down_line", domainIndex.get("is_down_line"));
//		mv.addObject("logo_url", CookieUtils.getCookieValueByName(request, "logoUrl"));
		String language = CookieUtils.getCookieValueByName(request, "org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE");
		try {
//			Map<String, Object> baseMap = baseInfoService.getBaseInfo(null);
//			mv.addObject("national_list", baseMap.get("national_list"));
//			mv.addObject("currency_list", baseMap.get("currency_list"));
		} catch (Exception e) {
			logger.error("--> 获取手机区号前缀异常.", e);
		}
//		mv.addObject("vali_path", SpringPropertiesUtil.getProperty("platform-api-user-api")+"/validateCodeServlet.htm");
//		mv.addObject("nav_list", domainIndexservice.getNavList(domainIndex.get("operator_id"), domainIndex.get("agent_id"), language));
//		mv.addObject("footer_list", domainIndexservice.getFooterList(domainIndex.get("operator_id"),domainIndex.get("agent_id")));
		mv.addObject("curr_nav", "index");
		mv.addObject("version", version);
		return mv;
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
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "code", required = false) String code,
			@RequestParam(value = "operator_id", required = true) String operator_id,
			@RequestParam(value = "agent_id", required = false) String agent_id,
			@RequestParam(value = "from", required = false) String from){
		JSONObject jsonObject = new JSONObject();
		String userAgent = request.getHeader("User-Agent");
		try {
			if(!StringUtils.isBlank(code)){
				String result = userAuthService.valiCode(code, request.getHeader("User-Agent"), null, null);
				if(!StringUtils.isBlank(result)){
					org.json.JSONObject json = new org.json.JSONObject(result);
					if(json.optInt("code") != 0){
						jsonObject.put("code", 2);
						jsonObject.put("msg", "验证码错误");
						return jsonObject.toJSONString();
					}
				}
			}
			
			AuthenticationUserInfo token = new AuthenticationUserInfo();
			token.setUsername(username);
			token.setPassword(password.toCharArray());
			token.setAgentId(agent_id);
			token.setOperatorId(operator_id);
			token.setUserAgent(userAgent);
			token.setRememberMe(true);
			String isDownLine = CookieUtils.getCookieValueByName(request, "is_down_line");
			if(StringUtils.isBlank(isDownLine)){
				String domain = request.getServerName();
//				Map<String, String> domainIndex = domainIndexservice.getDomainBaseByName(domain);
//				token.setIsDownLine(domainIndex.get("is_down_line"));
			}else{
				token.setIsDownLine(CookieUtils.getCookieValueByName(request, "is_down_line"));
			}
			
			Subject currentUser = SecurityUtils.getSubject();
			try {
				currentUser.login(token);
				if(currentUser.isAuthenticated()){
					jsonObject.put("code", 0);
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
			userAuthService.logout(UserToken.getUserId());
			
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
