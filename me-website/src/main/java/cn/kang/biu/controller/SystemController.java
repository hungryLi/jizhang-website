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
	public String roleListPage(HttpServletRequest request, HttpServletResponse response,
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
	
	@RequestMapping(value = "/permision_list", method = RequestMethod.POST)
	@ResponseBody
	public String permisionListPage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "page_num", required = true) Integer page_num,
			@RequestParam(value = "page_size",required = true) Integer page_size,
			@RequestParam(value = "p_name",required = false) String p_name) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("page_num", page_num);
			map.put("page_size", page_size);
			map.put("p_name", p_name);
			return systemService.permisionList(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "error ");
			return retJson.toString();
		}
	}
	
	/**
	 * 父菜单list
	 * @throws Exception
	 */
	@RequestMapping(value = "/parent_permision_list", method = RequestMethod.POST)
	@ResponseBody
	public String parentPermisionList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			return systemService.getParentMenus();
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
	
	@RequestMapping(value = "/permision_add", method = RequestMethod.POST)
	@ResponseBody
	public String permisionAdd(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("p_id", request.getParameter("p_id"));
			map.put("p_name", request.getParameter("p_name"));
			map.put("p_code", request.getParameter("p_code"));
			map.put("menu_name", request.getParameter("menu_name"));
			map.put("menu_type", request.getParameter("menu_type"));
			map.put("parent_menu", request.getParameter("parent_menu"));
			map.put("icon_type", request.getParameter("icon_type"));
			map.put("icon_address", request.getParameter("icon_address"));
			map.put("menu_href", request.getParameter("menu_href"));
			map.put("menu_index", request.getParameter("menu_index"));
			map.put("p_desc", request.getParameter("p_desc"));
			return systemService.addPermission(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "add permission error ");
			return retJson.toString();
		}
	}
	
	@RequestMapping(value = "/permission_query_id", method = RequestMethod.POST)
	@ResponseBody
	public String permisionQueryById(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "p_id", required = true) Integer p_id) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("p_id", p_id);
			return systemService.queryPermissionById(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "query permission error ");
			return retJson.toString();
		}
	}
	
	@RequestMapping(value = "/permision_dele", method = RequestMethod.POST)
	@ResponseBody
	public String permisionDele(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("p_id", request.getParameter("p_id"));
			return systemService.deletePermison(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "dele permission error ");
			return retJson.toString();
		}
	}

	@RequestMapping(value = "/role_has_permision_list", method = RequestMethod.POST)
	@ResponseBody
	public String roleHasPermisionList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "page_num", required = true) Integer page_num,
			@RequestParam(value = "page_size",required = true) Integer page_size,
			@RequestParam(value = "p_name",required = false) String p_name,
			@RequestParam(value = "r_id",required = true) Integer r_id) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("page_num", page_num);
			map.put("page_size", page_size);
			map.put("p_name", p_name);
			map.put("r_id", r_id);
			return systemService.roleHasPermisions(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "role_has_permision_list error ");
			return retJson.toString();
		}
	}
}
