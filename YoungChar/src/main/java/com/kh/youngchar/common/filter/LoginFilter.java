package com.kh.youngchar.common.filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(urlPatterns = {"/*"})
public class LoginFilter implements Filter {
	// 로그인이 되어있지 않아도 접근 가능한(허용되는) 경로를 모아둘 set을 생성
		private static final Set<String> ALLOWED_PATH = new HashSet<String>();
		
		public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

			// 로그인이 되어있지 않아도 접근 가능한 경로 추가
			//ALLOWED_PATH.add("/"); // 메인페이지
			//ALLOWED_PATH.add("/resources/\\w"); // 이미지, css, js 파일 등을 접근할 수 있는 경로 추가
			
			// 회원 전용 페이지 중 비회원이 접근 가능한 페이지 경로 추가
			ALLOWED_PATH.add("/member/login"); // 로그인 페이지 요청
			ALLOWED_PATH.add("/member/loginAction");
			ALLOWED_PATH.add("/member/signUp");
			ALLOWED_PATH.add("/member/SignUpAction");
			ALLOWED_PATH.add("/member/cooSignUp");
			ALLOWED_PATH.add("/member/cooSignUpAction");
			ALLOWED_PATH.add("/member/idDupCheck");
			ALLOWED_PATH.add("/member/nickDupCheck");
			ALLOWED_PATH.add("/member/findPwdMail");
			ALLOWED_PATH.add("/member/normalSignUpMail");
			ALLOWED_PATH.add("/member/callback");
			ALLOWED_PATH.add("/member/kakaoLogin");
			ALLOWED_PATH.add("/member/findId");
			ALLOWED_PATH.add("/member/findIdAction");
			ALLOWED_PATH.add("/member/findIdResult");
			ALLOWED_PATH.add("/member/findPwd");
			ALLOWED_PATH.add("/member/findPwdAction");
			
			
			
			HttpServletRequest req = (HttpServletRequest)request;
			HttpServletResponse res = (HttpServletResponse)response;
			HttpSession session = req.getSession();
			
			// 요청 주소 확인
			String path = req.getRequestURI().substring(req.getContextPath().length());
					//    /spring/member/login				/spring
			
			// 로그인 여부 확인
			boolean isLogin = session.getAttribute("loginMember") != null;
			
			// 요청 주소가 허용 목록에 있는 주소 인지 확인
			boolean isAllowedPath = false;
			
			for(String p : ALLOWED_PATH) {
				
				// ALLOWED_PATH 목록의 내용과 요청 주소가 일치할 경우
				if(Pattern.matches(p, path)) {
					isAllowedPath = true;
					break;
				}
			}
			
			// 로그인이 X이고, 허용되는 주소 == 비로그인 상태로 요청 허용된 주소
			// 로그인을 안하고도 이용 가능한 요청 주소들
			if( !isLogin && isAllowedPath ) {
				chain.doFilter(request, response);
		
			}else if(isLogin && !isAllowedPath ) {
				// 로그인이 되어있을 때 허용 주소를 제외한 요청
				// == 로그인이 되었을 때만 이용 가능한 요청 주소
				chain.doFilter(request, response);
				
			} else { // 로그인이나 허용 주소 여부 관계 없이
				
				if(Pattern.matches("/", path) 
						|| Pattern.matches("/resources/.*", path)
						|| Pattern.matches("/reviewlist/.*", path)
						|| Pattern.matches("/search/.*", path) 
						|| Pattern.matches("/chargerLocation/.*", path)
						|| Pattern.matches("/chargerCompany/.*", path)
						|| Pattern.matches("/car/list", path)
						|| Pattern.matches("/car/carView/.*", path)
						|| Pattern.matches("/board/list/.*", path)
						|| Pattern.matches("/board/search/.*", path)
						|| Pattern.matches("/board/boardView/.*", path)
						|| Pattern.matches("/news/.*", path) ) {
					chain.doFilter(request, response);
				}else {
					res.sendRedirect(req.getContextPath()); // 메인페이지로 이동
				}
			}	
		}

	    public LoginFilter() {}
	    public void init(FilterConfig fConfig) throws ServletException {}
		public void destroy() {}

}
