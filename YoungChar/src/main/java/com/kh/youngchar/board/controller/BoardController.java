package com.kh.youngchar.board.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

//import com.kh.spring.board.model.vo.Attachment;
//import com.kh.spring.board.model.vo.Board;
//import com.kh.spring.board.model.vo.PageInfo;
import com.kh.youngchar.board.model.service.BoardService;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	
//	게시글 목록 조회 Controller
	@RequestMapping("list/{type}")
	public String boardList(@PathVariable("type") int type , 
						@RequestParam(value="cp", required=false, defaultValue="1") int cp,
						Model model) {
/*		
//		System.out.println("type : " + type);
//		System.out.println("cp : " + cp);
		
//		1) 페이징 처리를 위한 객체 PageInfo 생성
		PageInfo pInfo = service.getPageInfo(type, cp);
		
//		System.out.println(pInfo);
		
//		2) 게시글 목록 조회
		List<Board> bList = service.selectList(pInfo);
		
//		for(Board b : bList) {
//			System.out.println(b);
//		}
		
		if(bList != null && !bList.isEmpty()) { // 게시글 목록 조회 성공 시 
			List<Attachment> thumbnailList = service.selectThumbnailList(bList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
			
		}
		
//		게시글 목록, 페이징 처리 정보를 request scope로 세팅 후 forward 진행
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		
		
		*/
		String url = "";
		
		if(type == 1) {
			url = "board/reviewBoardList";
		}else {
			url = "board/boardList";
		}
		
		return url;
	}

}
