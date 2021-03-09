package com.kh.youngchar.news.controller;

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

import com.kh.youngchar.chargerCompany.model.vo.CompanyImage;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.news.model.service.NewsService;
import com.kh.youngchar.news.model.vo.News;
import com.kh.youngchar.news.model.vo.NewsImage;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/news/*")
public class NewsController {

	@Autowired
	private NewsService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("newsMain")
	public String NewsMain(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model) {

		PageInfo pInfo = service.getPageInfo(cp);

		List<News> nList = service.selectNewsList(pInfo);
		List<News> recentList = service.selectRecentNewsList(pInfo);

		if (nList != null && !nList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<CompanyImage> thumbnailList = service.selectThumbnailList(nList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}

		}
		
		else if(recentList != null && !recentList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<CompanyImage> recentThumbnailList = service.recentThumbnailList(recentList);

			if (recentThumbnailList != null) {
				model.addAttribute("recentThList", recentThumbnailList);
			}

		}

		model.addAttribute("nList", nList);
		model.addAttribute("recentList", recentList);
		model.addAttribute("pInfo", pInfo);

		return "news/newsMain";
	}
	

	
	
	
	@RequestMapping("{newsNo}")
	public String NewsView(@PathVariable("newsNo") int newsNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		News news = service.selectNews(newsNo);
		

		String url = null;

		if (news != null) { // 상세 조회 성공 시

//			상세조회 성공한 게시물의 이미지 목록을 조회하는 Service 호출 
			List<NewsImage> newsList = service.selectCharNewsList(newsNo);

//			조회된 이미지 목록이 있을 경우 
			if (newsList != null && !newsList.isEmpty()) {

				model.addAttribute("newsList", newsList);
			}

//			request scope로 board를 세팅한다.
			model.addAttribute("news", news);

			url = "news/newsPage";

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
	
	
	
	
	@RequestMapping("insertNews")
	public String insertCharNews() {
		return "news/insertNews";
	}
	
	
	@RequestMapping("insertAction")
	public String insertNews(@ModelAttribute News news,
						@ModelAttribute("loginMember") Member loginMember,
						@RequestParam(value="image",required = false) List<MultipartFile> images,
						HttpServletRequest request, RedirectAttributes ra) {
//		@RequestParam(value="images",required = false) List<MultipartFile> images 
//		-> <input type="file" name="images"> 태그를 모두 얻어와 images라는 List에 매핑
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", loginMember.getMemberNo());
		map.put("newsTitle", news.getNewsTitle());
		map.put("press", news.getPress());
		map.put("reporter", news.getReporter());
		map.put("newsContent", news.getNewsContent());
		
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
		
		savePath = request.getSession().getServletContext().getRealPath("resources/newsImages");
		
//		게시글 map , 이미지 images, 저장 경로 savePath 
		
//		게시글 삽입 Service 호출
		int result = service.insertNews(map,images,savePath);
		
		String url = null;
//		게시글 삽입 결과에 따른 View 연결 처리
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "등록 성공";
			
//			상세 조회 페이지로 이동 
			url = "redirect:" + result;
			
//			새로 작성한 게시글 상세 조회 시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "..");
			
			
		}else {
			swalIcon = "error";
			swalTitle = "등록 실패";
			
			url ="redirect:insert";
			
		}
		
		ra.addFlashAttribute("swalIcon" , swalIcon);
		ra.addFlashAttribute("swalTitle" , swalTitle);
		
		return url;
		
	}
	
	@RequestMapping("{newsNo}/updateNews")
	public String update(@PathVariable("newsNo") int newsNo, Model model) {

		// 1) 게시글 상세 조회
		News news = service.selectNews(newsNo);

		// 2) 해당 게시글에 포함된 이미지 목록 조회
		if (news != null) {
			List<NewsImage> newsList = service.selectCharNewsList(newsNo);

			model.addAttribute("newsList", newsList);
		}

		model.addAttribute("news", news);

		return "news/updateNews";

	}
	
	
	@RequestMapping("{newsNo}/updateAction")
	public String updateAction(@PathVariable("newsNo") int newsNo, @ModelAttribute News updateNews, Model model,
			RedirectAttributes ra, HttpServletRequest request, @RequestParam("deleteImages") boolean[] deleteImages,
			@RequestParam(value = "images", required = false) List<MultipartFile> images) {
		
		updateNews.setNewsNo(newsNo);

		String savePath = request.getSession().getServletContext().getRealPath("resources/newsImages");

		int result = service.updateNews(updateNews, images, savePath, deleteImages);

		String url = null;

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 수정 성공";
			url = "redirect:../" + newsNo;
		} else {
			swalIcon = "error";
			swalTitle = "게시글 수정 실패";
			url = "redirect:" + request.getHeader("referer");
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}
	
	
	
	@RequestMapping("{newsNo}/deleteNews")
	public String deleteCompany(@PathVariable("newsNo") int newsNo, @ModelAttribute News news, RedirectAttributes ra) {
		
		news.setNewsNo(newsNo);
		
		int result = service.deleteNews(news);
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "삭제 완료";
			url = "redirect:../newsMain";
		}
		
		else {
			swalIcon = "error";
			swalTitle = "삭제 실패";
			url = "redirect:../"+newsNo;
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		
		return url;
	}
	
	
	
	
	
	
	
}
