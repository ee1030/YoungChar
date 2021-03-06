package com.kh.youngchar.company.controller;

import java.util.ArrayList;
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
@SessionAttributes({"loginMember"})
@RequestMapping("/carCompany/*")
public class CompanyCarController {
	
	@Autowired
	private CompanyCarService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	// 사이드바에서 화면 이동하는 Controller
	@RequestMapping("carView")
	public String carView() {
	      return "company/carManagement";
	}
	
	//차량 목록 조회 Controller
	@ResponseBody
	@RequestMapping("carList")
	public List<TestCars> carList(@ModelAttribute("loginMember") Member loginMember){
		
		int memNo = loginMember.getMemberNo();
		List<TestCars> cList = service.carList(memNo);
		
		//System.out.println("이미지 추가 전" +cList);
		
		if(cList != null && !cList.isEmpty()) {
			List<TestCars> imgs = carImages(cList);
			
			for(TestCars c : cList) {
				for(TestCars img : imgs) {
					if(c.getCarNo() == img.getCarNo()) {
						c.setFileNo(img.getFileNo());
						c.setFilePath(img.getFilePath());
						c.setFileName(img.getFileName());
					}
				}
			}
			
		}
		
		//System.out.println("이미지 추가 후" +cList);
		
		return cList;
	}
	
	//차량 이미지 조회 Controller
	public List<TestCars> carImages(List<TestCars> cList){
		
		List<TestCars> images = service.carImages(cList);
		
		return images;
	}
	
	//시승 가능 차량 추가 검색 Controller
	@ResponseBody
	@RequestMapping("carSearch")
	public List<TestCars> carSearch(@RequestParam String carName1) {
		
		//시승 가능 차량 LIST
		List<TestCars> cars = service.carSearch(carName1);
		
		
		
		if(cars != null && !cars.isEmpty()) {
			List<TestCars> imgs = carImages(cars);
					
			for(TestCars c : cars) {
				for(TestCars img : imgs) {
					if(c.getCarNo() == img.getCarNo()) {
						c.setFileNo(img.getFileNo());
						c.setFilePath(img.getFilePath());
						c.setFileName(img.getFileName());
					}
				}
			}
		}
		
		//이미지 없는 차량 제외하기
		List<TestCars> newCar = new ArrayList<TestCars>();
		
		for(TestCars c : cars) {
			
			if(c.getFileNo() != 0) {
			newCar.add(new TestCars(c.getTestDrivecCarNo(), c.getCarNo(), c.getCarName(), c.getCarModel(), 
									c.getFileNo(), c.getFilePath(), c.getFileName(), c.getMemNo2(), c.getBrand()));
			
			}
		}
		
		//System.out.println(cars);
		//System.out.println(newCar);
		
		return newCar;
	}
	
	
	//차량 추가 Controller
	@ResponseBody
	@RequestMapping("addCar")
	public int addCar(@ModelAttribute("loginMember") Member loginMember,
					  @RequestParam int carNo,
					  Model model) {
		
		int memNo = loginMember.getMemberNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		//System.out.println("carNo : " + carNo);
		map.put("carNo", carNo);
		map.put("memNo", memNo);
		
		int result = 0;
		
		//추가된적 있나 없나 검사
		int ex = service.ex(map);
		//System.out.println(ex);
		
		if(ex >0) { //추가 됐던 적 있음 (상태값 변경)
			
			String exist = service.carListEx(map);
			//System.out.println(exist);
			
			if(exist.equals("N")) { //상태 N일때
				result = service.updateStatus(map);
				//System.out.println(result);
			}else { //상태 Y일때 이미 있음 알림
				result = 0;
			}
			
		}else {
			result = service.addCar(map);
		}
		
		
		
		return result;
	}
	
	
	//차량 삭제 Controller
	@ResponseBody
	@RequestMapping("deleteCar")
	public int deleteCar(@ModelAttribute("loginMember") Member loginMember,
					  @RequestParam int carNo,
					  Model model) {
		
		int memNo = loginMember.getMemberNo();
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("carNo", carNo);
		map.put("memNo", memNo);
		
		int result = service.deleteCar(map);
		
		return result;
	}
}
