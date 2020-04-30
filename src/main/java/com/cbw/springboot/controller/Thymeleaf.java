package com.cbw.springboot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("thymeleaf")
public class Thymeleaf {
	
	@RequestMapping("init")
	public String helloThymeleaf(Map<String, Object> maps) {
		maps.put("username", "<h1>Cbw</h1>");
		return "thymeleafTest";
	}

}
