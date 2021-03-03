package com.kh.youngchar.testDrive.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.youngchar.company.model.vo.TestCars;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.testDrive.model.service.TestDriveService;
import com.kh.youngchar.testDrive.model.vo.CompanyMember;
import com.kh.youngchar.testDrive.model.vo.TestDrReservation;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/testDrive/*")
public class TestDriveController {

	@Autowired
	private TestDriveService service ;
	
	// 헤더에서 testDrive Main으로 화면 전환 하는 Controller
	@RequestMapping("main")
	public String Main() {
		
		return "testDrive/testDriveMain";
	}
	
	//시승예약페이지 전환 Controller
	@RequestMapping("reservation")
	public String reservationView(Model model) {
		
		//모델가져오기
		List<TestCars> cList = service.selectCarList();
		
			Gson gson = new Gson();
			String cListJSON = gson.toJson(cList);
			
			System.out.println(cList);
			
			model.addAttribute("cList",cList);
			model.addAttribute("cListJSON", cListJSON);
		
		//대리점들 주소 불러오기
		List<CompanyMember> list = service.companyList();
		System.out.println(list);
		
		String company = gson.toJson(list);
		model.addAttribute("company", company);
		return "testDrive/testDriveReservation";
	}
	
	//대리점 불러오기
	@RequestMapping("getAddr")
	@ResponseBody
	public List<CompanyMember> getAddr (@RequestParam int carNo,
									Model model){
		
		System.out.println(carNo);
		List<CompanyMember> companyList = service.selectCompanyList(carNo);
		
		System.out.println(companyList);
		
		Gson gson = new Gson();
		String companyListJSON = gson.toJson(companyList);
		
		
		model.addAttribute("companyList", companyListJSON);
		
		return companyList;
	}
	
	//예약 확인 페이지 전환 Controller
	@RequestMapping("myReservation")
	public String myReservationView() {
		return "testDrive/confirmReservation";
	}
	
}
