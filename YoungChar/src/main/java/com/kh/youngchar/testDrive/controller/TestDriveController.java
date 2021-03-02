package com.kh.youngchar.testDrive.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.testDrive.model.service.TestDriveService;
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
		
		//모델선택
		List<TestDrReservation> cList = service.selectCarList();
		
		model.addAllAttributes(cList);
		
		return "testDrive/testDriveReservation";
	}
	
	//예약 확인 페이지 전환 Controller
	@RequestMapping("myReservation")
	public String myReservationView() {
		return "testDrive/confirmReservation";
	}
	
}
