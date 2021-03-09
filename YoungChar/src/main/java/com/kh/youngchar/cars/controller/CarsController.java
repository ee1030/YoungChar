package com.kh.youngchar.cars.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.board.model.vo.PageInfo2;
import com.kh.youngchar.board.model.vo.Search;
import com.kh.youngchar.cars.model.service.CarsService;
import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/car/*")
public class CarsController {
	
	@Autowired
	private CarsService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	
	
//	차량 리스트 조회
	@RequestMapping("list")
	public String carList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, 
			Model model) {
		
		PageInfo2 pInfo = service.carListPageInfo(cp);
		List<Cars> carList = service.selectCarList(pInfo);
		
		
		if(carList != null) {
			List<CAttachment> thumbnailList = service.selectThumbnailList(carList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList" , thumbnailList);
			}
		}
		
		model.addAttribute("pInfo" , pInfo);
		model.addAttribute("carList" , carList);
		
		System.out.println("pInfo :" +  pInfo);
		System.out.println("carList :" +  carList);
		
		return "car/carList";
	}
	
//	차량 상세조회
	@RequestMapping("carView/{carNo}")
	public String carView(@PathVariable int carNo ,Model model, 
			@RequestHeader(value = "referer",required = false ) String referer, RedirectAttributes ra) {
		
		Cars carInfo = service.selectCar(carNo);
		
		List<CAttachment> attachmentList = service.selectAttachmentList(carNo);
		
		if(attachmentList != null && !attachmentList.isEmpty()) {
			
			model.addAttribute("attachmentList" , attachmentList);
		}
		
		
		
		model.addAttribute("carInfo" , carInfo);
		
		
		return "car/carView";
	}
	
//	비교 검색
	@RequestMapping("carSearch/{carNo1}/{carNo2}")
	public String carSearch(@PathVariable int carNo1 , @PathVariable int carNo2 , Model model) {
		
		
		
		Cars carInfo = service.selectSearchCar1(carNo1);
		Cars carInfo2 = service.selectSearchCar2(carNo2);
		
		List<CAttachment> attachmentList1 = service.selectAtList1(carNo1);
		
		List<CAttachment> attachmentList2 = service.selectAtList2(carNo2);
		
		if(attachmentList1 != null && !attachmentList1.isEmpty()) {
			
			model.addAttribute("attachmentList1" , attachmentList1);
		}
		if(attachmentList2 != null && !attachmentList1.isEmpty()) {
			
			model.addAttribute("attachmentList2" , attachmentList2);
		}
		
		System.out.println(attachmentList1);
		System.out.println(attachmentList2);
		
		model.addAttribute("carInfo1" , carInfo);
		model.addAttribute("carInfo2" , carInfo2);
		
		
		return "car/carSearch";
	}
	
	@RequestMapping("search")
	public String categorySearch(@RequestParam(value = "cp" , required= false, defaultValue = "1") int cp,
			@ModelAttribute Search search /*ct,sv,sk 커맨드 객체 형태로 반환 */ ,Model model , RedirectAttributes ra
			/*@RequestParam(value = "ct") List<Search> ct*/ ) {
		
		
		System.out.println("search : " + search);
		
//		String[] ctList = search.getCt();
		PageInfo2 pInfo = service.getSearchPageInfo(search , cp);
		
		List<Cars> carList = service.selectCarList2(search ,pInfo);
		
		System.out.println("carList : " +  carList);
		System.out.println("pinfo" + pInfo);
		
		
//		3) 썸네일 목록 조회
		if(!carList.isEmpty()) { // 검색된 목록이 있다면
			
			List<CAttachment> thList = service.selectThumbnailList(carList);
			
			model.addAttribute("thList",thList);
			
		}
		
		/*
		 * ra.addFlashAttribute("carList" , carList); ra.addFlashAttribute("pInfo" ,
		 * pInfo); ra.addFlashAttribute("search" , search);
		 */
		
		model.addAttribute("carList" , carList);
		model.addAttribute("pInfo" , pInfo);
		model.addAttribute("search" , search);
		
		return "car/carList";
	}
	
	
	

}
