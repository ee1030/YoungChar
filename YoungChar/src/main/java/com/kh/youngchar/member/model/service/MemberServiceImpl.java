package com.kh.youngchar.member.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.board.model.vo.Board;
import com.kh.youngchar.member.model.dao.MemberDAO;
import com.kh.youngchar.member.model.exception.InsertAttachmentFailException;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;
	
	// 암호화를 위한 객체를 의존성 주입(DI)
	@Autowired
	private BCryptPasswordEncoder enc;

	
	
	//---------------------------------------------------
	//				아이디 중복검사 Service (AJAX)
	//---------------------------------------------------
	@Override
	public int idDupCheck(String memberId) {
		return dao.idDupCheck(memberId);
		
	}


	//---------------------------------------------------
	//				닉네임 중복검사 Service (AJAX)
	//---------------------------------------------------
	@Override
	public int nickDupCheck(String memberNickName) {
		return dao.nickDupCheck(memberNickName);
		
	}


	//---------------------------------------------------
	//				일반 회원가입 Service
	//---------------------------------------------------
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int SignUpAction(Member member, List<MultipartFile> images, String savePath) {
		int result = 0;
		int memberNo = dao.nextMemNo();
		String encPwd = enc.encode(member.getMemberPwd());
		
		member.setMemberPwd(encPwd);
		member.setMemberNo(memberNo);
		
		result = dao.SignUpAction(member);
		
		if(result > 0) {
			int memNo = memberNo;
			List<MemberFile> uploadImages = new ArrayList<MemberFile>();
			
			String memImgPath = "/resources/memberFile";
			
			for(int i=0 ; i<images.size() ; i++) {
				
				if( !images.get(i).getOriginalFilename().equals("") ) {
					String memImgName = rename(images.get(i).getOriginalFilename());
					MemberFile mf = new MemberFile(memImgPath, memImgName, i, memNo);
					
					uploadImages.add(mf);
				}
				
			}
			
			
			if(!uploadImages.isEmpty()) {
				
				result = dao.insertMemberFile(uploadImages);

				System.out.println(result);
				System.out.println(uploadImages.size());
				if(result == uploadImages.size()) {
					int size = uploadImages.size();
					
					for(int i=0 ; i<size ; i++) {
						try {
							images.get(uploadImages.get(i).getMemImgLevel())
							.transferTo(new File(savePath + "/" + uploadImages.get(i).getMemImgName()));
							
						}catch (Exception e) {
							e.printStackTrace();
							
							throw new InsertAttachmentFailException("파일 서버 저장 실패");
						}
						
					}
					
					
				}else {// 파일 정보를 DB에 삽입하는데 실패했을 때
					throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
				}
				
			}
			
			
		}
		
		return result;
	}

	
	
	// 파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		//String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
		// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}


	// 로그인 Service 구현
	@Override
	public Member loginAction(Member inputMember) {
		
		Member loginMember = dao.loginAction(inputMember);
		
		if(loginMember != null) {
			// 비밀번호가 같을 때
			if(enc.matches(inputMember.getMemberPwd(), 	// 입력받은 평문 비밀번호
								loginMember.getMemberPwd())) { // DB에 저장된 암호화 비밀번호
				
				// DB에서 조회된 회원 정보를 반환하면 되지만 
				// 비밀번호는 null 값으로 변경해서 내보냄.
				loginMember.setMemberPwd(null);
				
				
			}else { 	// 비밀번호가 다를 때 
				
				// 로그인이 실패한 모양을 만들어 줌
				loginMember = null;
			}
		}
		
		
		return loginMember;
	}


	
	// 업체 회원가입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int cooSignUpAction(Member member, List<MultipartFile> images, String savePath) {
		int result = 0;
		int memberNo = 0;
		
		memberNo = dao.nextMemNo();
		
		String encPwd = enc.encode(member.getMemberPwd());
		
		member.setMemberPwd(encPwd);
		member.setMemberNo(memberNo);
		
		result = dao.cooSignUpAction(member);
		
		if(result > 0) {
			result = 0;
			int memNo = memberNo;
			// COO_MEMBER 테이블 추가
			result = dao.cooMemberInsert(member);
			
			List<MemberFile> uploadImages = new ArrayList<MemberFile>();
			
			String memImgPath = "/resources/memberFile";
			
			for(int i=0 ; i<images.size() ; i++) {
				
				if( !images.get(i).getOriginalFilename().equals("") ) {
					String memImgName = rename(images.get(i).getOriginalFilename());
					MemberFile mf = new MemberFile(memImgPath, memImgName, i, memNo);
					
					uploadImages.add(mf);
				}
				
			}
			
			if(!uploadImages.isEmpty()) {
				
				result = dao.insertMemberFile(uploadImages);
				
				if(result == uploadImages.size()) {
					
					int size = uploadImages.size();
					
					for(int i=0 ; i<size ; i++) {
						try {
							images.get(uploadImages.get(i).getMemImgLevel())
							.transferTo(new File(savePath + "/" + uploadImages.get(i).getMemImgName()));
							
						}catch (Exception e) {
							e.printStackTrace();
							
							throw new InsertAttachmentFailException("파일 서버 저장 실패");
						}
						
					}
					
					
				}else {// 파일 정보를 DB에 삽입하는데 실패했을 때
					throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
				}
				
			}
		}
		
		
		return result;
	}


	// 마이페이지 프사 얻어오기 Service 구현
	@Override
	public MemberFile selectFile(int memNo) {
		MemberFile mFile = dao.selectFile(memNo);
		
		return mFile;
	}


	// 내 정보 수정 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int mypageUpdate(Map<String, Object> map) {
		
		String savePwd = dao.selectPwd((int)map.get("memberNo"));
		
		// 결과 저장용 변수 선언
		int result = 0;
		
		if(savePwd != null) {
			
			// 비밀번호 확인
			if(enc.matches((String)map.get("memberPwd"), savePwd )) {
				// 비밀번호가 일치할 경우
				
				// 2. 현재 비밀번호 일치 확인 시 새 비밀번호로 변경
				// == 비밀번호를 수정할 dao 필요
				
				// 새 비밀번호 암호화 진행
				String encPwd = enc.encode( (String)map.get("newPwd") );
				
				// 암호화된 비밀번호를 다시 map에 세팅
				map.put("newPwd", encPwd);
				
				// 비밀번호 수정 DAO 호출
				result = dao.updatePwd(map);
			}
			
		}
		
		if(result > 0) {
			result = 0;
			
			result = dao.updateAction(map);
			
		}
		
		return result;
	}


	
	// 내 정보 수정(프로필 삭제) Service 구현
	@Override
	public int deleteProfile(int memImgNo) {
		return dao.deleteProfile(memImgNo);

	}

	
	
	//---------------------------------------------------
	//				카카오 로그인 Service (AJAX)
	//---------------------------------------------------
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Member loginMember(Member loginMember) {
		
		int result = dao.loginMember(loginMember);
		
		if(result > 0) {
			loginMember = dao.loginAction(loginMember);
		}
		
		
		return loginMember;
		
	}


	@Override
	public Member naverMem(Member member) {
		
		int result = dao.naverMem(member);
		
		if(result > 0) {
			member = dao.loginAction(member);
			
		}
		
		return member;
	}


	@Override
	public String findIdAction(Map<String, Object> map) {
		return dao.findIdAction(map);
		
	}


	// 비밀번호 찾기
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int findPwdAction(Map<String, Object> map) {
		
		String encPwd = enc.encode( (String)map.get("memberPwd") );
		
		map.put("memberPwd", encPwd);
		
		int result = dao.findPwdAction(map);
		
		return result;
		
	}


	// 마이페이지 내가 쓴 글 조회
	@Override
	public List<Board> selectList(String memberNo) {
		return dao.selectList(memberNo);
		
	}

	// 마이페이지 썸네일
	@Override
	public List<Attachment> selectThumbnailList(List<Board> bList) {
		return dao.selectThumbnailList(bList);
		
	}


	// 전체 게시글 수
	@Override
	public int bListNo(String memberNo) {
		return dao.bListNo(memberNo);
		
	}


	// 마이페이지 카테고리별 조회
	@Override
	public List<Board> chooseList(Map<String, Object> map) {
		return dao.chooseList(map);
		
	}


	
	
	
	
	
}
