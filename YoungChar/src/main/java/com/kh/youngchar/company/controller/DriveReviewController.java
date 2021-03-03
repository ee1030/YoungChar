package com.kh.youngchar.company.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.company.model.service.DriveReviewService;
import com.kh.youngchar.company.model.vo.DriveReview;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.company.model.vo.Reply;
import com.kh.youngchar.company.model.vo.Report;

/** 시승후기 관련 Controller
 * @author jeonga
 *
 */
@Controller
@RequestMapping("/driveReview/*")
public class DriveReviewController {
	
	@Autowired
	private DriveReviewService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	private Logger logger = LoggerFactory.getLogger(DriveReviewController.class);
	
	@RequestMapping("insertreview/{rsrvtNo}")
	public String insertReview(@PathVariable("rsrvtNo") int rsrvtNo,
							   Model model) {
		
		DriveReview board = service.selectReservation(rsrvtNo);
		board.setRsrvtNo(rsrvtNo);
		model.addAttribute("board", board);
		
		return "company/insertReview";
	}
	
	@RequestMapping("insertreview/insertAction")
	public String insertAction(@ModelAttribute DriveReview board,
			 					HttpServletRequest request,
			 					RedirectAttributes ra) {

		String savePath = request.getSession().getServletContext().getRealPath("resources/reviewImages");

		int result = service.insertBoard(board, savePath);
		
		String url = null;
		if(result > 0) {
			
            url = "redirect:../review/" + result;
			
			// 새로 작성한 게시글 상세 조회 시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "../reviewlist/");
		}else {
			swalIcon = "error";
			swalTitle = "게시글 삽입 실패";
			url = "redirect:../insertreview/" + board.getRsrvtNo();
		}
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping("insertImage")
	public String insertImage(HttpServletRequest request,
							  @RequestParam("uploadFile") MultipartFile uploadFile){
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/reviewImages");
		Attachment at = service.insertImage(uploadFile, savePath);
		
		return new Gson().toJson(at);
	}
	
	@RequestMapping("review/{boardNo}")
	public String reviewView(@PathVariable("boardNo") int boardNo,
							 Model model,
							 @RequestHeader(value="referer", required = false) String referer,
							 RedirectAttributes ra) {
		
		DriveReview board = service.driveReview(boardNo);
		
		String url = null;
		
		if(board != null) {
		
			board.setBoardNo(boardNo);
			
			model.addAttribute("board", board);
		
			url = "company/reviewView";
			
		}else {
			// 이전 요청 주소가 없는 경우
			if(referer == null) {
				 url = "redirect:../reviewlist";
			}else { // 이전 요청 주소가 있는 경우
				url = "redirect:" + referer;
			}
			
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");

		}
		
		return url;
	}
	
	@RequestMapping("reviewlist")
	public String reviewList(@RequestParam(value="cp", required = false, defaultValue= "1" ) int cp,
			 				 Model model) {
		
		PageInfo pInfo = service.getPageInfo(cp);
		
		List<DriveReview> bList = service.selectList(pInfo);
		
		
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		
		return "company/reviewList";
	}
	
	@ResponseBody
	@RequestMapping("selectReplyList/{boardNo}")
	public String selectReplyList(@PathVariable("boardNo") int boardNo) {
		
		List<Reply> rList = service.selectReplyList(boardNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
		
		
		return gson.toJson(rList);
	}
	
	@RequestMapping("reportBoard")
	public String reportBoard(RedirectAttributes ra,
							  @ModelAttribute Report report,
							  HttpServletRequest request) {
		
		int result = service.reportBoard(report);
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "신고가 완료되었습니다.";
			swalText = "관리자 확인 후 조치 예정입니다.";
		}else {
			swalIcon = "error";
			swalTitle = "이미 신고한 게시글입니다.";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		ra.addFlashAttribute("swalText", swalText);
		
		return "redirect:review/" + report.getReportBoardNo();
	}

}
