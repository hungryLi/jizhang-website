package cn.kang.biu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.kang.biu.service.SystemService;
import platform.common.base.console.controller.BaseController;

@Controller
@RequestMapping("/admin")
public class SystemController extends BaseController {
	
	private final Logger logger = Logger.getLogger(SystemController.class);
	
	@Autowired
	private SystemService systemService;
	
	@RequestMapping(value = "/role_mgr", method = RequestMethod.GET)
	public ModelAndView toRolePage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView view = new ModelAndView("/system/role");
		return view;
	}
	
	@RequestMapping(value = "/permision_mgr", method = RequestMethod.GET)
	public ModelAndView toPermisionPage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView view = new ModelAndView("/system/permision");
		return view;
	}
	
	@RequestMapping(value = "/role_list", method = RequestMethod.POST)
	@ResponseBody
	public String toRolePage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "page_num", required = true) Integer page_num,
			@RequestParam(value = "page_size",required = true) Integer page_size) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("page_num", page_num);
			map.put("page_size", page_size);
			return systemService.roleList(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "error ");
			return retJson.toString();
		}
	}
	
	@RequestMapping(value = "/role_update", method = RequestMethod.POST)
	@ResponseBody
	public String roleUpdate(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "role_name", required = true) String role_name,
			@RequestParam(value = "role_code",required = true) String role_code,
			@RequestParam(value = "role_desc",required = false) String role_desc,
			@RequestParam(value = "role_id",required = false) String role_id) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("role_name", role_name);
			map.put("role_code", role_code);
			map.put("role_desc", role_desc);
			map.put("role_id", role_id);
			return systemService.updateRole(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "update role error ");
			return retJson.toString();
		}
	}
	
	
}
