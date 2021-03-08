package com.kh.youngchar.cars.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.board.model.vo.PageInfo2;
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
	@RequestMapping("carSearch")
	public String carSearch() {
		
		return "car/carSearch";
	}
	
	

}
