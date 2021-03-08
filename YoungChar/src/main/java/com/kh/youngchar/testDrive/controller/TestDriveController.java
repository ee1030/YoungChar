package com.kh.youngchar.testDrive.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		//브랜드 리스트 중복제거
		List<String> brandList = new ArrayList<String>();
		for(TestCars c : cList) {brandList.add(c.getBrand());}
		HashSet<String> bList =new HashSet<String>(brandList);

		Gson gson = new Gson();
	
		String cListJSON = gson.toJson(cList);
		
		System.out.println(cList);
		
		//대리점들 주소 불러오기
		//List<CompanyMember> list = service.companyList();
		//System.out.println(list);
		
		//String companyJson = gson.toJson(list);
		
		model.addAttribute("bList",bList); //브랜드리스트
		model.addAttribute("cList",cList); //자동차리스트
		model.addAttribute("cListJSON", cListJSON); //자동차 리스트 JSON
		
		//model.addAttribute("company", companyJson); //대리점 리스트 JSON
		
		
		return "testDrive/testDriveReservation";
	}
	
	//선택한 자동차 대리점 불러오기
	@RequestMapping(value="getAddr", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getAddr (@RequestParam int carNo,
									Model model){
		
		System.out.println(carNo);
		List<CompanyMember> companyList = service.selectCompanyList(carNo);
		
		System.out.println(companyList);
		
		Gson gson = new Gson();
		String companyListJSON = gson.toJson(companyList);
		
		
		model.addAttribute("companyList", companyListJSON);
		
		return companyListJSON;
	}
	
	
	//예약 하기 
	@RequestMapping("makeReservation")
	public String makeReservation(@ModelAttribute("loginMember") Member loginMember,
								Model model, RedirectAttributes ra , TestDrReservation reservation) {
		
		return "";
	}
	
	
	//예약 확인 페이지 전환 Controller
	@RequestMapping("myReservation")
	public String myReservationView(@ModelAttribute("loginMember") Member loginMember,
									Model model) {
		
		int memNo = loginMember.getMemberNo();
		
		//예약 목록 조회하기
		List<TestDrReservation> rList = service.selectReservation(memNo);
		
		if(rList != null) { //예약 있다면 (예약중/시승완료)
			
			//예약목록들의 자동차 사진 가져오기
			//List<TestCars> cList = service.selectRCarList(rList);
			
			//대리점 정보 가져오기
			List<CompanyMember> comList = service.selectRcompanyList(rList);
			
			for(TestDrReservation rs : rList) {
				
				for(CompanyMember com : comList) {
					if(rs.getCarNo() == com.getCarNo()) {
						rs.setCooName(com.getCooName());
						rs.setMemAdress(com.getMemberAddr());
					}
					
				}
			}
			
			
			
			//model.addAttribute("cList", cList);
			model.addAttribute("comList", comList);
		}
		
		model.addAttribute("rList", rList);
	
		
		return "testDrive/confirmReservation";
	}
	
	//예약 수정 페이지 전환
	@RequestMapping("updateReservation/{reservationNo}")
	public String updateReservation(@ModelAttribute("loginMember") Member loginMember,
									Model model,
									@PathVariable("reservationNo") int reservationNo) {
		//모델가져오기
		List<TestCars> cList = service.selectCarList();
		
		//브랜드 리스트 중복제거
		List<String> brandList = new ArrayList<String>();
		for(TestCars c : cList) {brandList.add(c.getBrand());}
		HashSet<String> bList =new HashSet<String>(brandList);

		Gson gson = new Gson();
	
		String cListJSON = gson.toJson(cList);
		
		System.out.println(cList);
		
		
		model.addAttribute("bList",bList); //브랜드리스트
		model.addAttribute("cList",cList); //자동차리스트
		model.addAttribute("cListJSON", cListJSON); //자동차 리스트 JSON
				
		
		return "../updateTestDriveReservation";
	}
	
	//예약 삭제
	@RequestMapping("cancleReservation/{reservationNo}")
	public String cancleReservation(@ModelAttribute("loginMember") Member loginMember,
									Model model,
									RedirectAttributes ra,
									@PathVariable("reservationNo") int reservationNo
									) {
		
		int result = service.cancleReservation(reservationNo);
		String url = "";
		if(result > 0) {
			ra.addFlashAttribute("swalIcon", "success");
			ra.addFlashAttribute("swalTitle", "예약 취소 되었습니다.");
			url = "redirect:../myReservation";
		}else {
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "예약 취소 실패");
			url = "referer";
		}
		
		return url;
	}
	
	
}
