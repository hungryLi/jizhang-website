package cn.kang.biu.controller;

import java.io.File;
import java.net.FileNameMap;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public String addConsume(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("consume_title", request.getParameter("consume_title"));
			map.put("consume_desc", request.getParameter("consume_desc"));
			map.put("pic_address1", request.getParameter("pic_address1"));
			map.put("pic_address2", request.getParameter("pic_address2"));
			map.put("price", request.getParameter("price"));
			map.put("consume_type", request.getParameter("consume_type"));
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
	
	/**
	 * 消费类型查询
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/query_consume_types", method = RequestMethod.POST)
	@ResponseBody
	public String queryConsumeType(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("consume_id", request.getParameter("consume_id"));
			return consumeService.queryConsumeType(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "query_consume_types error ");
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
			String realPath = "";
			String path = "";
			String floder = "";
			String os = System.getProperties().getProperty("os.name").toLowerCase();
			if(os.contains("windows")) {
				floder = "/images/";
				HttpSession session = request.getSession();
				ServletContext context = session.getServletContext();
				realPath = context.getRealPath(floder);
				System.out.println(realPath);
			}else {
				realPath = "/home/web_data/html/images";
				path = "http://91kangs.cn/";
			}
			String fileName = file.getOriginalFilename();
			String newFileName = UserToken.getToken().getUserName()+System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."), fileName.length());
			String url = realPath + "/" + newFileName;
			File newFile = new File(url);
			file.transferTo(newFile);
			String imgPath = path + floder + newFileName;
			retJson.put("code", 1000);
			retJson.put("msg", "success");
			retJson.put("res_data", imgPath);
			return retJson.toString();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "upload_img error");
			return retJson.toString();
		}
	}
}
