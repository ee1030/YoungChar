package com.kh.youngchar.chargerCompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.youngchar.chargerCompany.model.service.ChargerCompanyService;
import com.kh.youngchar.chargerCompany.model.vo.ChargerCompany;
import com.kh.youngchar.chargerCompany.model.vo.CompanyImage;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;

@Controller
@SessionAttributes({ "loginMember" })
@RequestMapping("/chargerCompany/*")
public class ChargerCompanyController {
	@Autowired
	private ChargerCompanyService service;

	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("introduction")
	public String chargerCompanyList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model) {

		PageInfo pInfo = service.getPageInfo(cp);

		List<ChargerCompany> cList = service.selectList(pInfo);

		if (cList != null && !cList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<CompanyImage> thumbnailList = service.selectThumbnailList(cList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}

		}

		model.addAttribute("cList", cList);
		model.addAttribute("pInfo", pInfo);

		return "chargerCompany/introduction";
	}

	@RequestMapping("{companyNo}")
	public String chargerCompanyView(@PathVariable("companyNo") int companyNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		ChargerCompany chargerCompany = service.selectCompany(companyNo);

		String url = null;

		if (chargerCompany != null) { // 상세 조회 성공 시

//			상세조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출 
			List<CompanyImage> chargerCompanyList = service.selectChargerCompanyList(companyNo);

//			조회된 이미지 목록이 있을 경우 
			if (chargerCompanyList != null && !chargerCompanyList.isEmpty()) {

				model.addAttribute("chargerCompanyList", chargerCompanyList);
			}

			model.addAttribute("chargerCompany", chargerCompany);

			url = "chargerCompany/chargerCompanyView";

		} else { // 상세 조회 실패 시

			if (referer == null) { // 이전 요청 주소가 없는 경우 (직접 주소를 적는 경우)

				url = "redirect:..";

			} else { // 이전 요청 주소가 있는 경우

				url = "redirect:" + referer;
			}

			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않습니다.");

		}

		return url;
	}

	@RequestMapping("insertChargerCompany")
	public String insertCompany() {
		return "chargerCompany/insertChargerCompany";
	}

	@RequestMapping("insertAction")
	public String insertAction(@ModelAttribute ChargerCompany chargerCompany,
			@ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value = "image", required = false) List<MultipartFile> images, HttpServletRequest request,
			RedirectAttributes ra) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("companyName", chargerCompany.getCompanyName());
		map.put("phone", chargerCompany.getPhone());
		map.put("fax", chargerCompany.getFax());
		map.put("email", chargerCompany.getEmail());
		map.put("link", chargerCompany.getLink());
		map.put("companyContent", chargerCompany.getCompanyContent());

//		파일 업로드 확인 
		for (int i = 0; i < images.size(); i++) {
			System.out.println("images[" + i + "] :" + images.get(i).getOriginalFilename());
		}

//		파일 저장 경로 설정
//		HttpServletRequest 객체가 있어야지만 파일 저장 경로를 얻어올 수 있다.
//		-> HttpServletRequest 객체는 Controller에서만 사용 가능하다.
		String savePath = null;

		savePath = request.getSession().getServletContext().getRealPath("resources/chargerCompanyImages");

		int result = service.insertCompany(map, images, savePath);

		String url = null;

//		삽입 결과에 따른 View 연결 처리
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "등록 성공";

//			상세 조회 페이지로 이동 
			url = "redirect:" + result;

//			새로 작성한 게시글 상세 조회 시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "..");

		} else {
			swalIcon = "error";
			swalTitle = "등록 실패";

			url = "redirect:insert";

		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}

	@RequestMapping("{companyNo}/chargerCompanyUpdate")
	public String update(@PathVariable("companyNo") int companyNo, Model model) {

		// 1) 게시글 상세 조회
		ChargerCompany chargerCompany = service.selectCompany(companyNo);

		// 2) 해당 게시글에 포함된 이미지 목록 조회
		if (chargerCompany != null) {
			List<CompanyImage> chargerCompanyList = service.selectChargerCompanyList(companyNo);

			model.addAttribute("chargerCompanyList", chargerCompanyList);
		}

		model.addAttribute("chargerCompany", chargerCompany);

		return "chargerCompany/chargerCompanyUpdate";

	}
	
	
	
	@RequestMapping("{companyNo}/updateAction")
	public String updateAction(@PathVariable("companyNo") int companyNo, @ModelAttribute ChargerCompany updateCompany, Model model,
			RedirectAttributes ra, HttpServletRequest request, @RequestParam("deleteImages") boolean[] deleteImages,
			@RequestParam(value = "images", required = false) List<MultipartFile> images) {
		
		updateCompany.setCompanyNo(companyNo);

		String savePath = request.getSession().getServletContext().getRealPath("resources/chargerCompanyImages");

		int result = service.updateCompany(updateCompany, images, savePath, deleteImages);

		String url = null;

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 수정 성공";
			url = "redirect:../" + companyNo;
		} else {
			swalIcon = "error";
			swalTitle = "게시글 수정 실패";
			url = "redirect:" + request.getHeader("referer");
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}
	
	
	
	@RequestMapping("{companyNo}/deleteCompany")
	public String deleteCompany(@PathVariable("companyNo") int companyNo, @ModelAttribute ChargerCompany chargerCompany, RedirectAttributes ra) {
		
		chargerCompany.setCompanyNo(companyNo);
		
		int result = service.deleteCompany(chargerCompany);
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "삭제 완료";
			url = "redirect:../introduction";
		}
		
		else {
			swalIcon = "error";
			swalTitle = "삭제 실패";
			url = "redirect:../"+companyNo;
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		
		return url;
	}
	
	
	
	
	
	
	
	
	
	
	

}
