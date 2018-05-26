package cn.kang.biu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import cn.kang.biu.service.TimeService;
import cn.kang.biu.service.UserAuthService;
import cn.kang.biu.shiro.service.UserToken;
import cn.kang.biu.vo.PermisionVo;
import platform.common.base.console.controller.BaseController;

@Controller
public class TimeController extends BaseController {

	@Autowired
	private TimeService timeService;
	

	/**
	 * 添加消费
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/nav/time", method = RequestMethod.GET)
	public ModelAndView toConsumeAdd(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView view = new ModelAndView("/time/time");
		return view;
	}
	
	
	//list_time
	@RequestMapping(value = "/time/list_time", method = RequestMethod.POST)
	@ResponseBody
	public String cancelLike(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "page_num", required = true) Integer page_num,
			@RequestParam(value = "page_size",required = true) Integer page_size) throws Exception{
		JSONObject retJson = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("page_num", page_num);
			map.put("page_size", page_size);
			map.put("user_id", SecurityUtils.getSubject().isAuthenticated() ? UserToken.getToken().getId() : 1);
			return timeService.listTimes(map);
		} catch (Exception e) {
			logger.error(e);
			retJson.put("code", 1001);
			retJson.put("msg", "cancel_like error ");
			return retJson.toString();
		}
	}
	
//	private ModelAndView modelData(HttpServletRequest request, HttpServletResponse response,String pageUrl) throws Exception {
//		ModelAndView view = new ModelAndView(pageUrl);
//		List<PermisionVo> nvs = userAuthService.getMenuLists();
//		view.addObject("nav_list", nvs);
//		return view;
//	}
	
}
