package kr.nclcorp.comm.interceptor;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoggerInterceptor implements HandlerInterceptor  {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass().getPackage().getName());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.debug(">>> uri:"+request.getRequestURI());
		String domain = request.getRequestURL().toString().replace(request.getRequestURI(), "/");
		String requestUri = request.getRequestURL().toString().replace(domain, "");

		
//		if(!requestUri.contains("resources")) {
			
			Enumeration<?> params = request.getParameterNames();
			logger.info("-------------------------------[" + request.getMethod() + "]" + requestUri);
			Map<String, String> paramMap = new HashMap<String, String>();
			String paramStr = "";
			//String returnPath = "";
			
			while (params.hasMoreElements()) {
				String name = (String) params.nextElement();
				logger.debug(name + " : "+ request.getParameter(name));
				paramMap.put(name,  request.getParameter(name));
				paramStr += (ObjectUtils.isEmpty(paramStr) ? ( "?"+name+"="+request.getParameter(name)): (name+"="+request.getParameter(name)) );
				
			}

			logger.info("-------------------------------" + paramStr);
//		}
		
		return true;
		//return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
//		logger.debug("==================== END ====================");
		
	}

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//        System.out.println("afterCompletion");
//        System.out.println(handler);
    }
	
}
