package com.kh.youngchar.company.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.board.model.exception.InsertAttachmentFailException;
import com.kh.youngchar.board.model.vo.Attachment;
import com.kh.youngchar.company.model.dao.CompanyDAO;
import com.kh.youngchar.company.model.service.CompanyService;
import com.kh.youngchar.company.model.vo.Application;
import com.kh.youngchar.company.model.vo.Company;
import com.kh.youngchar.company.model.vo.PageInfo;
import com.kh.youngchar.member.model.vo.Member;
import com.kh.youngchar.member.model.vo.MemberFile;

/** 업체페이지 관련 Service
 * @author jeonga
 *
 */
@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder enc;
	

	@Override
	public Company getCompanyProfile(int memberNo) {
		return dao.getCompanyProfile(memberNo);
	}

	@Override
	public int selectWatingCount(int memberNo) {
		return dao.selectWatingCount(memberNo);
	}

	@Override
	public int selectReviewCount(int memberNo) {
		return dao.selectReviewCount(memberNo);
	}


	@Override
	public List<Application> selectSchedule(Map<String, Object> map) {
		return dao.selectSchedule(map);
	}


	@Override
	public List<Application> selectAplList(Map<String, Object> map) {
		return dao.selectAplList(map);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateAplStatus(Application apl) {
		return dao.updateAplStatus(apl);
	}

	@Override
	public PageInfo getPageInfo(Map<String, Object> map) {
		int listCount = dao.getListCount(map);
		
		return new PageInfo((int)map.get("cp"), listCount);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMember(Member updateMember, String newPwd) {

		int result = 0;

			String savePwd = dao.selectPwd(updateMember.getMemberNo());
			
			if(savePwd != null) {
				
				if(enc.matches(updateMember.getMemberPwd(), savePwd )) {
					
					if(!newPwd.equals("null")) {
						updateMember.setMemberPwd(enc.encode(newPwd));
					}else {
						updateMember.setMemberPwd(enc.encode(updateMember.getMemberPwd()));
					}
					
					result = dao.updateMember(updateMember);
				}
			}
		
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMemberStatus(Member member) {
		
		int result = 0;
		
		String savePwd = dao.selectPwd(member.getMemberNo());
				
		if(enc.matches(member.getMemberPwd(), savePwd )) {

			result = dao.selectAplCount(member.getMemberNo());
			
			if(result == 0) {
				result = dao.updateMemberStatus(member.getMemberNo());
			}else {
				result = -1;
			}
		}
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int changeProfileImg(Map<String, Object> map) {
		
		MultipartFile image = (MultipartFile)map.get("image");
		String savePath = (String)map.get("savePath");
		String fileName = rename(image.getOriginalFilename());
		map.put("fileName", fileName);
		
		int result = dao.changeProfileImg(map);
		
		if(result > 0) {
			try {
				image.transferTo( new File(savePath + "/" + fileName));
			}catch(Exception e) {
				e.printStackTrace();
				throw new InsertAttachmentFailException("프로필 사진 업로드 실패");
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
