package com.kh.youngchar.admin.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.youngchar.admin.model.service.AdminService;
import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.cars.model.vo.Cars;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;

@Controller
@RequestMapping("/admin/*")
public class AdminController { 
	
	@Autowired
	private AdminService service;
	
	// 관리자 대시보드로 이동
	@RequestMapping("dashboard")
	public String adminDashboard(Model model) {
		
		// 서비스 아이템 부분
		int newMember = service.getNewMember();
		int newCompany = service.getNewCompany();
		int allBoardCount = service.getAllBoardCount();
		int testDrive = service.getTestDrive();
		
		List<Member> mList = service.getNewMemList();
		List<Map<String, Integer>> cList = service.getChartData();
		
		model.addAttribute("newMember", newMember);
		model.addAttribute("newCompany", newCompany);
		model.addAttribute("allBoardCount", allBoardCount);
		model.addAttribute("testDrive", testDrive);
		
		model.addAttribute("mList", mList);
		model.addAttribute("cList", cList);
		
		return "admin/adminDashboard";
	}
	
	// 회원관리 페이지로 이동
	@RequestMapping("memberManagement")
	public String memberManagement(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
									Model model) {
		
		PageInfo pInfo = service.getPageInfo(cp);
		
		List<Member> mList = service.selectMemberList(pInfo);
		
		model.addAttribute("mList", mList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/memberManagement";
	}
	
	// 선택회원 탈퇴
	@ResponseBody
	@RequestMapping("memberManagement/secession")
	public int memberSecession(@RequestParam(value="chkList[]") List<String> chkList) {
		
		int result = service.memberSecession(chkList);
		
		return result;
	}
	
	// 선택회원 복구
	@ResponseBody
	@RequestMapping("memberManagement/restore")
	public int memberRestore(@RequestParam(value="chkList[]") List<String> chkList) {
		
		int result = service.memberRestore(chkList);
		
		return result;
	}
	
	// 회원 검색 기능
	@RequestMapping("memberManagement/searchId")
	public String searchMember(@RequestParam("sv") String sv,
								@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
								Model model) {
		
		PageInfo pInfo = service.getSearchMemPageInfo(cp, sv);
		
		List<Member> mList = service.selectSearchMember(pInfo, sv);
		
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("mList", mList);
		
		return "admin/memberManagement";
	}
	
	// 신규 업체 승인 요청 페이지
	@RequestMapping("newCompanyManagement")
	public String newCompanyManagement(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
										Model model) {
		
		PageInfo pInfo = service.getNewComPageInfo(cp);
		
		List<Member> cList = service.selectNewCompanyList(pInfo);
		
		model.addAttribute("cList", cList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/newCompanyManagement";
	}
	
	// 선택된 업체 가입 승인
	@ResponseBody
	@RequestMapping("newCompanyManagement/approval")
	public int newCompanyApproval(@RequestParam(value="chkList[]") List<String> chkList) {
		int result = service.newCompanyApproval(chkList);
		
		return result;
	}
	
	// 신규 업체 승인 검색
	@RequestMapping("newCompanyManagement/searchName")
	public String searchNewCompany(@RequestParam("sv") String sv,
									@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
									Model model) {
		
		PageInfo pInfo = service.getSearchNewComPageInfo(cp, sv);
		
		List<Member> cList = service.selectSearchNewCom(pInfo, sv);
		
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("cList", cList);
		
		return "admin/newCompanyManagement";
	}
	
	// 모든 업체 관리 페이지
	@RequestMapping("allCompanyManagement")
	public String allCompanyManagement(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
										Model model) {
		
		PageInfo pInfo = service.getAllComPageInfo(cp);
		
		List<Member> cList = service.selectAllCompanyList(pInfo);
		
		model.addAttribute("cList", cList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/allCompanyManagement";
	}
	
	// 선택된 업체 가입 승인
	@ResponseBody
	@RequestMapping("allCompanyManagement/approval")
	public int allCompanyApproval(@RequestParam(value="chkList[]") List<String> chkList) {
		int result = service.allCompanyApproval(chkList);
		
		return result;
	}
	
	// 선택된 업체 가입 승인 취소
	@ResponseBody
	@RequestMapping("allCompanyManagement/cancellation")
	public int allCompanyCancellation(@RequestParam(value="chkList[]") List<String> chkList) {
		int result = service.allCompanyCancellation(chkList);
		
		return result;
	}
	
	// 신규 업체 승인 검색
	@RequestMapping("allCompanyManagement/searchName")
	public String searchAllCompany(@RequestParam("sv") String sv,
									@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
									Model model) {
		
		PageInfo pInfo = service.getSearchAllComPageInfo(cp, sv);
		
		List<Member> cList = service.selectSearchAllCom(pInfo, sv);
		
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("cList", cList);
		
		return "admin/allCompanyManagement";
	}
	
	// 모든 게시글 조회 페이지
	@RequestMapping("allBoardManagement")
	public String allBoardManagement(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
									 Model model) {
		
		PageInfo pInfo = service.getAllBoardPageInfo(cp);
		
		List<Board> bList = service.selectAllBoardList(pInfo);
		
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/allBoardManagement";
	}
	
	// 선택된 게시글 삭제
	@ResponseBody
	@RequestMapping("allBoardManagement/delete")
	public int allBoardDelete(@RequestParam(value="chkList[]") List<String> chkList) {
		int result = service.allBoardDelete(chkList);
		
		return result;
	}
	
	// 선택된 게시글 복구
	@ResponseBody
	@RequestMapping("allBoardManagement/restore")
	public int allBoardRestore(@RequestParam(value="chkList[]") List<String> chkList) {
		int result = service.allBoardRestore(chkList);
		
		return result;
	}
	
	// 리뷰 게시글 조회 페이지
	@RequestMapping("reviewBoardManagement")
	public String reviewBoardManagement() {
		return "admin/reviewBoardManagement";
	}
	
	// 정보 게시글 조회 페이지
	@RequestMapping("infoBoardManagement")
	public String infoBoardManagement() {
		return "admin/infoBoardManagement";
	}
	
	// 잡담 게시글 조회 페이지
	@RequestMapping("freeBoardManagement")
	public String freeBoardManagement() {
		return "admin/freeBoardManagement";
	}
	
	// 댓글 관리 페이지
	@RequestMapping("replyManagement")
	public String replyManagement() {
		return "admin/replyManagement";
	}
	
	// 신고 게시글 조회 페이지
	@RequestMapping("reportBoardManagement")
	public String reportBoardManagement() {
		return "admin/reportBoardManagement";
	}
	
	// 신고 댓글 관리 페이지
	@RequestMapping("reportReplyManagement")
	public String reportReplyManagement() {
		return "admin/reportReplyManagement";
	}
	
	// 차량 DB 관리 페이지
	@RequestMapping("carDBManagement")
	public String carDBManagement(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, 
									Model model) {
		
		PageInfo pInfo = service.getCarsPageInfo(cp);
		List<Cars> carList = service.selectCarsList(pInfo);
		
		List<Map<Integer, String>> brandList = service.selectBrandList();
		
		model.addAttribute("carList", carList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("brandList", brandList);
		
		return "admin/carDBManagement";
	}
	
	@RequestMapping("carDBManagement/insertCar")
	public String insertCar(@ModelAttribute Cars cars,
							@RequestParam("carImg[]") List<MultipartFile> carImgs,
							HttpServletRequest request,
							RedirectAttributes ra) {
		
		int result = service.insertCar(cars);
		
		if(result > 0) {
			String savePath = null;
			
			savePath = request.getSession().getServletContext().getRealPath("resources/carImages");
			
			//result = service.insertImages(result, carImgs, savePath);
			
			
			if(result > 0) {
				ra.addFlashAttribute("swalIcon", "success");
				ra.addFlashAttribute("swalTitle", "차량 등록 성공");
			}
		}
		return "redirect:../carDBManagement";
	}

}
