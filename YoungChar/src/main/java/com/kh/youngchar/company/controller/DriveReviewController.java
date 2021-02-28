package com.kh.youngchar.company.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.youngchar.company.model.service.DriveReviewService;
import com.kh.youngchar.company.model.vo.DriveReview;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.company.model.vo.Reply;

/** 시승후기 관련 Controller
 * @author jeonga
 *
 */
@Controller
@RequestMapping("/driveReview/*")
public class DriveReviewController {
	
	@Autowired
	private DriveReviewService service;
	
	private Logger logger = LoggerFactory.getLogger(DriveReviewController.class);
	
	@RequestMapping("insertreview")
	public String insertReview() {
		return "company/insertReview";
	}
	@RequestMapping("{boardNo}/{categoryNm}/{cooName}/{carName}/{csat}")
	public String reviewView(@PathVariable("boardNo") int boardNo,
							 @PathVariable("categoryNm") String categoryNm,
							 @PathVariable("cooName") String cooName,
							 @PathVariable("carName") String carName,
							 @PathVariable("csat") int csat,
							 Model model,
							 @RequestHeader(value="referer", required = false) String referer,
							 RedirectAttributes ra) {

		
		Map<String, Object> map = service.driveReview(boardNo);

		DriveReview board = (DriveReview)map.get("board");
		
		String url = null;
		
		if(board != null) {
		
			board.setBoardNo(boardNo);
			board.setCategoryNm(categoryNm);
			board.setCooName(cooName);
			board.setCarName(carName);
			board.setCsat(csat);
			
			model.addAttribute("board", board);
			model.addAttribute("mFile", map.get("mFile"));
		
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

}
