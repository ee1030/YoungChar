package com.kh.youngchar.member.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
		int memNo = 0;
		
		String encPwd = enc.encode(member.getMemberPwd());
		
		member.setMemberPwd(encPwd);
		
		result = dao.SignUpAction(member);
		
		if(result > 0) {
			memNo = dao.memNo();
			
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
	
	
	
	
	
}
