package cn.kang.biu.controller;

import java.io.File;
import java.net.FileNameMap;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.kang.biu.service.ConsumeService;
import cn.kang.biu.shiro.service.UserToken;
import platform.common.base.console.controller.BaseController;

@Controller
@RequestMapping("/consume")
public class ConsumeController extends BaseController  {

	private final Logger logger = Logger.getLogger(ConsumeController.class);
	
	@Autowired
	private ConsumeService consumeService;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String roleListPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("consume_title", request.getParameter("consume_title"));
			map.put("consume_desc", request.getParameter("consume_desc"));
			map.put("pic_address1", request.getParameter("pic_address1"));
			map.put("pic_address2", request.getParameter("pic_address2"));
			map.put("price", request.getParameter("price"));
			map.put("consume_address", request.getParameter("consume_address"));
			map.put("handler_type", request.getParameter("handler_type"));
			map.put("group_id", request.getParameter("group_id"));
			map.put("user_ids", request.getParameter("user_ids"));
			map.put("pay_user_id", UserToken.getToken().getId());
			return consumeService.addConsume(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "error ");
			return retJson.toString();
		}
	}
	
	@RequestMapping(value = "/query_groups", method = RequestMethod.POST)
	@ResponseBody
	public String queryAccountGroups(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("user_id", UserToken.getToken().getId());
			return consumeService.queryAccountGroups(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "query_groups error ");
			return retJson.toString();
		}
	}
	
	@RequestMapping(value = "/query_groups_members", method = RequestMethod.POST)
	@ResponseBody
	public String queryGroupMembers(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "group_id", required = true) Integer group_id) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("group_id", group_id);
			return consumeService.queryGroupMembers(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "query_groups_members error ");
			return retJson.toString();
		}
	}
	
	///consume/upload_img

	@RequestMapping(value = "/upload_img", method = RequestMethod.POST)
	@ResponseBody
	public String uploadImage(@RequestParam("pic_address") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			String fileName = UserToken.getToken().getUserName()+System.currentTimeMillis();
			String domain = "http://91kangs.cn";
			String url = domain + "/" + fileName + ".jpg";
			File newFile = new File(url);
			file.transferTo(newFile);
			retJson.put("code", 1000);
			retJson.put("msg", "success");
			retJson.put("res_data", url);
			return retJson.toString();
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "upload_img error");
			return retJson.toString();
		}
	}
}
