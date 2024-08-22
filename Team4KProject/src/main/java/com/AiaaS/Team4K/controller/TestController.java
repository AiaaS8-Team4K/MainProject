package com.AiaaS.Team4K.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.AiaaS.Team4K.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;
	
	@GetMapping("/count")
	public String empCount(@RequestParam(value="deptid",required=false,defaultValue="0")int deptid, Model model) {
		if(deptid==0) {
			model.addAttribute("count",testService.getEmpCount());
		}else {
			model.addAttribute("count",testService.getEmpCount(deptid));
		}
		return "count";
	}
	
	@GetMapping("/budget")
	public String moveBudget() {
		return "budget";
	}

	@GetMapping("/frame")
	public String moveFrame() {
		return "frame";
	}
	
	@GetMapping("/")
	public String moveIndex() {
		return "index";
	}

	
	@GetMapping("/greenHouse")
	public String moveGreenHouse() {
		return"greenHouse";
	}
}



