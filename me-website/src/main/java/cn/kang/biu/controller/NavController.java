package cn.kang.biu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.kang.biu.service.UserAuthService;
import cn.kang.biu.vo.PermisionVo;
import platform.common.base.console.controller.BaseController;

@Controller
public class NavController extends BaseController {

	@Autowired
	private UserAuthService userAuthService;
	

	/**
	 * 添加消费
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/consume/add", method = RequestMethod.GET)
	public ModelAndView toConsumeAdd(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return modelData(request,response,"/consume/add_consume");
	}
	
	private ModelAndView modelData(HttpServletRequest request, HttpServletResponse response,String pageUrl) throws Exception {
		ModelAndView view = new ModelAndView(pageUrl);
		List<PermisionVo> nvs = userAuthService.getMenuLists();
		view.addObject("nav_list", nvs);
		return view;
	}
	
}
