package com.kh.youngchar.charger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chargerLocation/*")
public class ChargerController {
	
	@RequestMapping("location")
	public String location() {
		return "chargerLocation/location";
	}

}
