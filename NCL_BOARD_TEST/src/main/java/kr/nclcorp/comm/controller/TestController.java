package kr.nclcorp.comm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass().getPackage().getName());
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("========= this page test");
		return "test";
	}	
}
