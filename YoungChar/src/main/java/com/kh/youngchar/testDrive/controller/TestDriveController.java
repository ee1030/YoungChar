package com.kh.youngchar.testDrive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/testDrive/*")
public class TestDriveController {

	//private TestDriveService service ;
	
	// 헤더에서 testDrive Main으로 화면 전환 하는 Controller
	@RequestMapping("main")
	public String Main() {
		
		return "testDrive/testDriveMain";
	}
	
	//시승예약페이지 전환 Controller
	@RequestMapping("reservation")
	public String reservationView() {
		return "testDrive/testDriveReservation";
	}
	
	//예약 확인 페이지 전환 Controller
	@RequestMapping("myReservation")
	public String myReservationView() {
		return "testDrive/confirmReservation";
	}
}
