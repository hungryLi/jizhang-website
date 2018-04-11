package cn.kang.biu.shiro.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONObject;


/**
 * 
 * @author Administrator
 *
 */
public class ShiroFilterUtils {
	final static Class<? extends ShiroFilterUtils> CLAZZ = ShiroFilterUtils.class;
	//登录页面
	static final String LOGIN_URL = "/login";
	//踢出登录提示
	final static String KICKED_OUT = "/out.shtml";
	//没有权限提醒
	final static String UNAUTHORIZED = "/unauthorized.shtml";
	
	
	private final static Logger logger = Logger.getLogger(CLAZZ);
	/**
	 * 是否是Ajax请求
	 * @param request
	 * @return
	 */
	public static boolean isAjax(ServletRequest request){
		return "XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"));
	}
	
	/**
	 * response 输出JSON
	 * @param hresponse
	 * @param resultMap
	 * @throws IOException
	 */
	public static void out(ServletResponse response, Map<String, String> resultMap){
		
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.println(new JSONObject(resultMap).toString());
		} catch (Exception e) {
			logger.error("输出JSON报错。",e);
		}finally{
			if(null != out){
				out.flush();
				out.close();
			}
		}
	}
}
