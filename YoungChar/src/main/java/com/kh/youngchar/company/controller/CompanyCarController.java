package com.kh.youngchar.company.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.youngchar.company.model.service.CompanyCarService;
import com.kh.youngchar.company.model.vo.TestCars;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

@Controller
@RequestMapping("/carCompany/*")
public class CompanyCarController {
	
	@Autowired
	private CompanyCarService service;
	
	// 사이드바에서 화면 이동하는 Controller
	@RequestMapping("carView")
	public String carView() {
	      return "company/carManagement";
	}
	
	// 차량 추가 검색 Controller
	@ResponseBody
	@RequestMapping("carSearch")
	public List<TestCars> carSearch(String carName) {
		
		List<TestCars> cars = service.carSearch(carName);
		
		return cars;
	}
	
	//차량 목록 Controller
	@ResponseBody
	public List<TestCars> carList(Member loginMember){
		
		List<TestCars> cList = service.carList(loginMember);
		
		return cList;
	}
	
	//차량 추가 Controller
	@ResponseBody
	@RequestMapping("addCar")
	public int addCar(@RequestParam int carNo,
					  @ModelAttribute("loginMember") Member loginMember) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("carNo", carNo);
		map.put("loginMember", loginMember);
		int result = service.addCar(map);
		
		return result;
	}
	

}
