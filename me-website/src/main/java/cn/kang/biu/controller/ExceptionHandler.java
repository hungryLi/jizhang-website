package cn.kang.biu.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;


public class ExceptionHandler implements HandlerExceptionResolver {

	private final Logger log = Logger.getLogger(this.getClass());

  public ModelAndView resolveException( HttpServletRequest request, HttpServletResponse response, Object handler,
      Exception ex ) {
    String requestURI = request.getRequestURI();
    if(requestURI.contains("ansy")) {
      try {
        response.getWriter().write("{\"result\":\"100000\"}"); // 系统异常返回码
        response.getWriter().flush();
      }
      catch(IOException e1) {
        log.error("ansy request error :", e1);
      }
      return new ModelAndView();

    }
    else {
      Map<String, Object> model = new HashMap<String, Object>();
     // model.put("errorInfo", ex.getMessage());
      return new ModelAndView("error/500", model);
    }
    // // 根据不同错误转向不同页面
    // if(ex instanceof BusinessException) {
    // return new ModelAndView("error-business", model);
    // }else if(ex instanceof ParameterException) {
    // return new ModelAndView("error-parameter", model);
    // } else {
    // return new ModelAndView("error", model);
    // }
  }
}
