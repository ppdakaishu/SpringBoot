package com.cbw.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/helloworld")
public class HelloWorld {

	@RequestMapping("init")
	public String init() {
		return "init finised";
	}
	
}
