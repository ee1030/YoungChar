package com.kh.youngchar.board.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Arrays;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.youngchar.board.model.vo.Search;
import com.kh.youngchar.company.model.vo.Report;
import com.kh.youngchar.board.model.service.BoardService;
import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.board.model.vo.PageInfo2;
import com.kh.youngchar.member.model.vo.Member;

@Controller // 컨트롤러임을 알려줌 + bean 등록
@SessionAttributes({"loginMember"})
@RequestMapping("/board/*")
public class BoardController {

	
//	Service객체 의존성 주업 
	@Autowired // 등록된 bean 중에서 같은 타입인 bean을 의존성 주입
	private BoardService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
//	/board/list/1
	
//	@PathVariable : @RequestMapping에 작성된 URL 경로에 있는 특정 값을 
//					변수로 사용할 수 있게하는 어노테이션 
//	게시글 목록 조회 Controller
	@RequestMapping("list/{type}" )
	public String boardList(@PathVariable("type") int type ,
						@RequestParam(value="cp", required=false, defaultValue="1") int cp,
						Model model) {
		
		
//		1) 페이징 처리를 위한 객체 PageInfo 생성
		PageInfo2 pInfo = service.getPageInfo(type, cp);
		
		
//		2) 게시글 목록 조회
		List<Board> bList = new ArrayList<Board>();
		
		
		bList = service.selectList(pInfo , type);
		
		if(bList != null && !bList.isEmpty()) { // 게시글 목록 조회 성공 시 
			List<Attachment> thumbnailList = service.selectThumbnailList(bList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
			
		}
		
//		게시글 목록, 페이징 처리 정보를 request scope로 세팅 후 forward 진행
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		
		String url = "";
				
		if (pInfo.getBoardType() == 1 || pInfo.getBoardType() == 2) {
			url = "board/reviewBoardList";
		} else {
			url = "board/boardList";
		}
		
		return url;
	}
	
//	카테고리 별 조회 기능
	@RequestMapping("list/{type}/{categoryCode}")
	public String categoryBoardList(@PathVariable("type") int type , @PathVariable("categoryCode") int categoryCode,
												@RequestParam(value="cp", required=false, defaultValue="1") int cp,
												Model model) {
		
//		1) 페이징 처리를 위한 객체 PageInfo 생성
		PageInfo2 pInfo = service.getPageInfo(type, cp);
		
		List<Board> bList = new ArrayList<Board>();
		
		String categoryName = null;
		
		switch(categoryCode) {
			case 1 : categoryName = "테슬라"; break;
			case 2 : categoryName = "현대자동차"; break;
			case 3 : categoryName = "기아"; break;
			case 4 : categoryName = "벤츠"; break;
			case 5 : categoryName = "BMW"; break;
			case 6 : categoryName = "아우디"; break;
			case 7 : categoryName = "포르쉐"; break;
			case 8 : categoryName = "르노"; break;
		}
												
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type" , pInfo.getBoardType());
		map.put("categoryName" , categoryName);
		
		bList = service.categoryBoardList(pInfo , map);
		
		if(bList != null && !bList.isEmpty()) { // 게시글 목록 조회 성공 시 
			List<Attachment> thumbnailList = service.selectThumbnailList(bList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
			
		}
		
//		게시글 목록, 페이징 처리 정보를 request scope로 세팅 후 forward 진행
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		
		String url = "";
				
		if (type == 3) {
			url = "board/boardList";
		} else {
			url = "board/reviewBoardList";
		}
		
		return url;
	}
	
	
//	게시글 상세조회 Controller
	@RequestMapping("boardView/{type}/{boardNo}")
	public String boardView(@PathVariable("type") int type, @PathVariable("boardNo") int boardNo,
							Model model, @RequestHeader(value = "referer",required = false ) String referer,
							RedirectAttributes ra) {
		
//		@RequestHeader(name = "referer") String referer
//		--> HTTP 요청 헤더에 존재하는 "referer" 값을 얻어와 
//		매개변수 String referer에 저장
		
		
//		게시글 상세조회 Service 호출 
		Board board = service.selectBoard(boardNo,type);
		
	
		
		String url = null;
		
		if(board != null) { // 상세 조회 성공 시
			
//			상세조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출 
			List<Attachment> attachmentList = service.selectAttachmentList(boardNo);
			
			
//			조회된 이미지 목록이 있을 경우 
			if(attachmentList != null && !attachmentList.isEmpty()) {
				
				model.addAttribute("attachmentList" , attachmentList);
			}
			
//			request scope로 board를 세팅한다.
			model.addAttribute("board", board);
			
	
			url = "board/boardView";
			
		} else { // 상세 조회 실패 시 
			
			if(referer == null) { // 이전 요청 주소가 없는 경우 (직접 주소를 적는 경우)
				
				url = "redirect:../list/" + type;
				
				
			}else { // 이전 요청 주소가 있는 경우
				
				url = "redirect:" + referer;
			}
			
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글 입니다.");
			
			
		}
		
		return url;
	}
	
	
//	게시판 등록 화면 전환용 Controller 
	@RequestMapping("{type}/insert")
	public String insertView(@PathVariable("type") int type) {
		
		return "board/boardInsert";
//		boardInsert1.jsp == 기존 방식 
//		boardInsert2.jsp == summernote 적용 방식 
	}
	
//	게시글 등록 Controller 
	@RequestMapping("{type}/insertAction")
	public String insertAction(@PathVariable("type") int type, @ModelAttribute Board board,
						@ModelAttribute("loginMember") Member loginMember,
						@RequestParam(value="image",required = false) List<MultipartFile> images,
						HttpServletRequest request, RedirectAttributes ra) {
//		@RequestParam(value="images",required = false) List<MultipartFile> images 
//		-> <input type="file" name="images"> 태그를 모두 얻어와 images라는 List에 매핑
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("boardTitle", board.getBoardTitle());
		map.put("boardContent", board.getBoardContent());
		map.put("categoryCode", board.getCategoryName());
		map.put("boardType", type);
		
//		파일 업로드 확인 
		for(int i=0;i< images.size();i++) {
			System.out.println("images[" + i + "] :" + images.get(i).getOriginalFilename());
		}
//		파일이 업로드 되지 않은 부분도 출력되고 있음을 확인
//		== 모든 input type = "file" 태그가 순서대로 넘어오고 있음을 확인
//		--> 넘어오는 순서를 file level로 사용가능
		
//		파일 저장 경로 설정
//		HttpServletRequest 객체가 있어야지만 파일 저장 경로를 얻어올 수 있다.
//		-> HttpServletRequest 객체는 Controller에서만 사용 가능하다.
		String savePath = null;
		
		savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		
//		게시글 map , 이미지 images, 저장 경로 savePath 
		
//		게시글 삽입 Service 호출
		int result = service.insertBoard(map,images,savePath);
		
		String url = null;
//		게시글 삽입 결과에 따른 View 연결 처리
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			
//			상세 조회 페이지로 이동 
			url = "redirect:../boardView/" + type + "/" + result;
			
//			새로 작성한 게시글 상세 조회 시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "../../list/" + type);
			
			
		}else {
			swalIcon = "error";
			swalTitle = "게시글 삽입 실패";
			
			url ="redirect:insert";
			
		}
		
		ra.addFlashAttribute("swalIcon" , swalIcon);
		ra.addFlashAttribute("swalTitle" , swalTitle);
		
		return url;
		
	}
	
	/* @PathVariable , QueryString 각각 언제 써야되는가 ?
	 * 
	 * @PathVariable : 식별 용도로 사용 
	 * 
	 * QueryString : 주소 마지막에 k=v 형태의 문자열 형태로 파라미터를 전달 
	 * 			-> 필터링, 정렬 등을 나타내고 싶을때
	 *  */
	
//	게시글 수정 화면 전환용 Controller
	@RequestMapping("{type}/{boardNo}/update")
	public String update(@PathVariable int type,@PathVariable int boardNo, Model model) { 
		
//		1. 게시글 상세 조회
		Board board = service.selectBoard(boardNo, type);
		
//		2. 해당 게시글에 포함된 이미지 목록 조회
		if(board != null) {
			
			List<Attachment> attachmentList = service.selectAttachmentList(boardNo);
			
			model.addAttribute("attachmentList" , attachmentList);
//			NULL 값이 전달되어도 EL이 빈 문자열로 처리해준다.
			
			
		}
		
		model.addAttribute("board", board);
		
		String url = "board/boardUpdate";
		
		return url;
	}
	
//	게시글 수정 Controller 
	@RequestMapping("{type}/{boardNo}/updateAction")
	public String updateAction(@PathVariable int boardNo, @PathVariable int type,
					@ModelAttribute Board updateBoard, Model model, RedirectAttributes ra,
					HttpServletRequest request,
					@RequestParam("deleteImages") boolean[] deleteImages,
					@RequestParam(value="image",required=false) List<MultipartFile> images) {
//																	input 태그들을 다 잡았다.
		
//		boardNo를 updateBoard에 세팅
		updateBoard.setBoardNo(boardNo);
		
//		게시판 종류에 따라서 Service에서 크로스사이트 스크립팅 처리를 결정 할 수 있도록 
//		type을 updateBoard.boardCode 추가
		updateBoard.setBoardCode(type);
		
//		파일 저장 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		
//		파일 수정 Service 호풀
		int result = service.updateBoard(updateBoard, images, savePath, deleteImages);
//						수정된 게시글의 정보, 새롭게 업데이트 되거나 바뀐 이미지 정보	, 이미지 저장 경로 , 어떤 레벨이 삭제되었는지 알려주는 배열 
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 수정 성공";
			url = "redirect:../../boardView/" + type + "/" + boardNo;
		} else {
			swalIcon = "error";
			swalTitle = "게시글 수정 실패";
			url = "redirect:" + request.getHeader("referer");
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		
		return url;
	}
	
//	----------------------------- summernote ----------------------------------
//	summernote에 업로드된 이미지 저장 Controller 
	@RequestMapping(value = {"{type}/insertImage" , "{type}/{boardNo}/insertImage"})
	@ResponseBody // 응답시 값 자체를 return해준다. (주소나 view Name이 아닌)
    public String insertImage(HttpServletRequest request,
                              @RequestParam("uploadFile") MultipartFile uploadFile) {
        // 서버에 파일(이미지)를 저장할 폴더 경로 얻어오기
        String savePath
            = request.getSession().getServletContext().getRealPath("resources/uploadImages");

        Attachment at = service.insertImage(uploadFile, savePath);

//      java -> js로 객체 전달 : JSON
        return new Gson().toJson(at);
    }
	
//	게시글 검색 Controller 
	@RequestMapping("search/{type}")
	public String searchBoard(@PathVariable int type, 
					@RequestParam(value = "cp" , required= false, defaultValue = "1") int cp,
					@ModelAttribute Search search/* ct,sv,sk 커맨드 객체 형태로 반환 */, Model model) {
		
//		@PathVariable로 얻어온 게시판 타입을 search 커맨드 객체에 저장 
		search.setBoardType(type);
		
//		1) 검색 조건이 포함된 페이징 처리용 객체 얻어오기
		
		
		PageInfo2 pInfo = service.getSearchPageInfo(search,cp);
		
//		2) 검색 조건이 포함된 게시글 목록 조회
		List<Board> bList = service.selectSearchList(search, pInfo);
		
		System.out.println(bList);
		System.out.println(pInfo);
		
		String url = "";
		
//		3) 썸네일 목록 조회
		if(!bList.isEmpty()) { // 검색된 목록이 있다면
			
			List<Attachment> thList = service.selectThumbnailList(bList);
			
			model.addAttribute("thList",thList);
			
		}
		
		model.addAttribute("bList" , bList);
		model.addAttribute("pInfo" , pInfo);
		model.addAttribute("search" , search);
		
		System.out.println(search);
		if(type == 3) {
			url = "board/boardList";
		} else {
			url = "board/reviewBoardList";
		}
		
		return url;
	}
	
	
	
	@RequestMapping("delete/{boardCode}/{boardNo}")
	public String delBoard(@PathVariable int boardCode ,@PathVariable int boardNo ,
			@RequestHeader(value = "referer",required = false ) String referer,
			RedirectAttributes ra) {
		
		int result = service.delBoard(boardNo);
		
		String url = "";
		
		System.out.println(boardCode);
		
		if(result > 0 ) {
			
			url = "redirect:../../list/" + boardCode;
			
			swalIcon = "success";
			swalTitle = "삭제가 완료되었습니다.";
			
			/*
			 * if(boardCode == 3) {
				url = "board/boardList";
			} else {
				url = "board/reviewBoardList";
			} */
		}else {
			swalIcon = "error";
			swalTitle = "삭제가 실패 되었습니다.";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
		
	}
	
	@RequestMapping("{boardCode}/reportBoard")
	public String reportBoard(@PathVariable int boardCode, RedirectAttributes ra , @ModelAttribute Report report ,
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
		
		return "redirect:../" + boardCode +"/"+ report.getReportBoardNo();
	}
	
	
	
	
	
	
	
	
	
	
}
