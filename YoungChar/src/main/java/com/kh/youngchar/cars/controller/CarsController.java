package com.kh.youngchar.cars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/car/*")
public class CarsController {
	
	@RequestMapping("list")
	public String carList() {
		return "car/carList";
	}
	
	@RequestMapping("carView")
	public String carView() {
		return "car/carView";
	}
	

}
