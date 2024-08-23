package com.AiaaS.Team4K.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.AiaaS.Team4K.model.PriceDTO;
import com.AiaaS.Team4K.service.TestService;
import com.AiaaS.Team4K.service.WeatherService;
import com.opencsv.exceptions.CsvValidationException;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;
	
	@Autowired
	WeatherService weatherService;
	
	
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
	
	 @PostMapping("/budgetCalculate")
	    public String budgetCalculate(@ModelAttribute PriceDTO prices, Model model) {	        
	        double budgetPredict = (prices.getOilPrice() * 351700000) + (prices.getLNGPrice() * (-194300000)) -14060000000L;;
	        model.addAttribute("result", budgetPredict);	        
//			return "budget";
			return "redirect:/budget";
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
	
	@GetMapping("/weather")
	public String moveWeather(Model model) {
		String filePath = "/resources/csv/weather/world-total-ghg-emissions.csv";
		
		
        try {
            List<Double> emissions = weatherService.readEmissionData(filePath);
            List<Double> normalizedEmissions = weatherService.normalizeData(emissions);
            System.out.println(emissions);
            model.addAttribute("emissions", normalizedEmissions);
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "파일 읽기 오류가 발생했습니다.");
        } catch (CsvValidationException e) {
            e.printStackTrace();
            model.addAttribute("error", "CSV 유효성 검사 오류가 발생했습니다.");
        }
        
		return"weather";
	}
	
	
	
	
	
}



