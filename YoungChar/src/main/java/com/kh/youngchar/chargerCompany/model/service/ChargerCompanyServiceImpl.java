package com.kh.youngchar.chargerCompany.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.chargerCompany.model.dao.ChargerCompanyDAO;
import com.kh.youngchar.chargerCompany.model.vo.ChargerCompany;
import com.kh.youngchar.chargerCompany.model.vo.CompanyImage;
import com.kh.youngchar.company.model.vo.PageInfo;

@Service
public class ChargerCompanyServiceImpl implements ChargerCompanyService{
	
	@Autowired
	private ChargerCompanyDAO dao;

	@Override
	public PageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount(cp);

		return new PageInfo(cp, listCount);
	}

	@Override
	public List<ChargerCompany> selectList(PageInfo pInfo) {
		return dao.selectList(pInfo);
	}

	
	@Override
	public List<CompanyImage> selectThumbnailList(List<ChargerCompany> cList) {
		return dao.selectThumbnailList(cList);
	}
	
	
	
	@Override
	public ChargerCompany selectCompany(int companyNo) {
		ChargerCompany temp = new ChargerCompany();
		temp.setCompanyNo(companyNo);

		ChargerCompany chargerCompany = dao.selectCompany(temp);


		return chargerCompany;
	}
	
	

	@Override
	public List<CompanyImage> selectChargerCompanyList(int companyNo) {
		return dao.selectChargerCompanyList(companyNo);

	}
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertCompany(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		int result = 0; // 최종 결과 저장 변수 선언
		
//		1. 게시글 번호 얻어오기 -> SEQ_BNO.NEXTVAL를 통해 얻어온다.
		int companyNo = dao.selectNextNo();

//		2. 게시글 삽입 
		if (companyNo > 0) { // 다음 게시글 번호를 얻어온 경우
			map.put("companyNo", companyNo); // map에 boardNo 추가

//			크로스 사이트 스크립팅 방지 처리 
//			추후 summernote api 사용을 염두하여 게시판 타입별로 
//			크로스 사이트 스크립팅 방지 처리를 선택적으로 진행

	

				String companyName = (String) map.get("companyName");
				String phone = (String) map.get("phone");
				String fax = (String) map.get("fax");
				String email = (String) map.get("email");
				String link = (String) map.get("link");
				String companyContent = (String) map.get("companyContent");
				String introduction = (String)map.get("introduction");
				String itemA = (String)map.get("itemA");
				String itemB = (String)map.get("itemB");

//				크로스 사이트 스크립팅 방지 처리 적용 
				companyName = replaceParameter(companyName);
				phone = replaceParameter(phone);
				fax = replaceParameter(fax);
				email = replaceParameter(email);
				link = replaceParameter(link);
				companyContent = replaceParameter(companyContent);
				introduction = replaceParameter(introduction);
				itemA = replaceParameter(itemA);
				itemB = replaceParameter(itemB);

//				처리된 문자열을 다시 map에 세팅
				map.put("companyName", companyName);
				map.put("phone", phone);
				map.put("fax", fax);
				map.put("email", email);
				map.put("link", link);
				map.put("companyContent", companyContent);
				map.put("introduction", introduction);
				map.put("itemA", itemA);
				map.put("itemB", itemB);
				


//			게시글 삽입 DAO 메소드 호출 
			result = dao.insertCompany(map);

//			3. 게시글 삽입 성공 시 이미지 정보 삽입
			if (result > 0) {

//				이미지 정보를 Attachment 객체에 저장하여 List에 추가 
				List<CompanyImage> chargerCompanyImages = new ArrayList<CompanyImage>();

//				images.get(i).getOriginalName() -> 업로드된 파일의 원본 파일명 
//				--> 중복 상황을 대비하여 파일명을 변경하는 코드가 필요하다. (rename() 메소드)

//				DB에 저장할 웹상 접근 주소 ( filePath)
				String filePath = null;

				filePath = "/resources/chargerCompanyImages";
				

//				for문을 이용하여 파일정보가 담긴 images를 반복접근 
//				-> 업로드된 파일이 있을 경우에만 uploadImages 리스트에 추가
//				향상된 포문을 안쓰는 이유는 i 값을 이용해서 파일레벨을 지정하기 위해서 i == 인덱스 == fileLevel과 같은값
				for (int i = 0; i < images.size(); i++) {
//					현재 접근한 images의 요소(MultipartFile)에 업로드된 파일이 있는지 확인
					if (!images.get(i).getOriginalFilename().equals("")) { // 빈문자열이 아니라면 == 파일이 업로드 되었다면
//						파일이 업로드 된 경우 == 업로드된 원본 파일명이 있는 경우

//						원본 파일명 변경 
						String fileName = rename(images.get(i).getOriginalFilename());

//						Attachment 객체 생성
						CompanyImage ci = new CompanyImage(filePath, fileName, i, companyNo);

//						리스트에 추가
						chargerCompanyImages.add(ci);

					}
				}


		
				
				// ------------------------------ summernote --------------------------------

				if (!chargerCompanyImages.isEmpty()) { // 업로드된 이미지가 있을경우

//					파일 정보 삽입 DAO 호출 
					result = dao.insertchargerCompanyImagesList(chargerCompanyImages);
//					result == 삽입된 행의 개수 

//					모든 데이터가 정상 삽입 되었을 경우 -> 서버에 파일 저장 
					if (result == chargerCompanyImages.size()) {
						result = companyNo; // result에 boardNo저장

//						MultipartFile.transferTo()
//						-> MutipartFile 객체에 저장된 파일을 지정된 경로에 실제 파일의 형태로 변환하여 저장하는 메소드 
//						uploadImages 리스트 안에 Attachment들이 담겨있다.
//						Attachment안에 파일 레벨이 정해져있다. 
						
						/*
						int size=0;
						if((int)map.get("boardType")==1 ) {
							size = chargerCompanyImages.size();
						}else if(!images.get(0).getOriginalFilename().equals("")){
							size = images.size();
						}*/

						for (int i = 0; i < chargerCompanyImages.size(); i++) {

							try {

								images.get(chargerCompanyImages.get(i).getFileLevel())
										.transferTo(new File(savePath + "/" + chargerCompanyImages.get(i).getFileName()));

							} catch (Exception e) {
								e.printStackTrace();


//								throw new InsertAttachmentFailException("파일 서버 저장 실패");
							}
						}

					} else { // 파일 정보를 DB에 삽입하는데 실패 했을 때
//						throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
					}

				}else {
					result = companyNo;
				}
			}
		}

		return result;
	}
	
	
	
	
	//  크로스 사이트 스크립트 방지 처리 메소드
	private String replaceParameter(String param) {
		String result = param;
		if (param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}

		return result;
	}
	
	
// 	파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);
		// String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
		// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)
		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}

	
	
	
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateCompany(ChargerCompany updateCompany, List<MultipartFile> images, String savePath,
			boolean[] deleteImages) {
		// 1) 게시글 수정
		// 제목, 내용 크로스사이트 스크립팅 방지
		updateCompany.setCompanyName(replaceParameter(updateCompany.getCompanyName()));
		updateCompany.setPhone(replaceParameter(updateCompany.getPhone()));
		updateCompany.setFax(replaceParameter(updateCompany.getFax()));
		updateCompany.setEmail(replaceParameter(updateCompany.getEmail()));
		updateCompany.setLink(replaceParameter(updateCompany.getLink()));
		updateCompany.setCompanyContent(replaceParameter(updateCompany.getCompanyContent()));

		// 게시글 수정 DAO 호출
		int result = dao.updateCompany(updateCompany);

		// 2) 이미지 수정(난이도 쩔음)
		if (result > 0) {
			// 수정 전 업로드 되어있던 파일 정보를 얻어옴.
			// -> 새롭게 삽입 또는 수정되는 파일과 비교하기 위함.
			List<CompanyImage> oldFiles = dao.selectChargerCompanyList(updateCompany.getCompanyNo());

			// 새로 업로드 된 파일 정보를 담을 리스트
			List<CompanyImage> uploadImages = new ArrayList<CompanyImage>();
			// 삭제 되어야 할 파일 정보를 담을 리스트
			List<CompanyImage> removeFileList = new ArrayList<CompanyImage>();

			// DB에 저장할 웹상 이미지 접근 경로
			String filePath = "/resources/chargerCompanyImages";

			// 새롭게 업로드 된 파일 정보를 가지고 있는 images에 반복 접근
			for (int i = 0; i < images.size(); i++) {
				if (!images.get(i).getOriginalFilename().equals("")) {
					// 파일명 변경
					String fileName = rename(images.get(i).getOriginalFilename());

					// Attachment 객체 생성
					CompanyImage ci = new CompanyImage(filePath, fileName, i, updateCompany.getCompanyNo());

					uploadImages.add(ci); // 업로드 이미지 리스트에 추가

					// true : update 진행
					// false : insert 진행
					boolean flag = false;

					// 새로운 파일 정보와 이전 파일 정보를 비교하는 반복문
					for (CompanyImage old : oldFiles) {
						if (old.getFileLevel() == i) {
							// 현재 접근한 이전 파일의 레벨이 새롭게 업로드한 파일의 레벨과 같은 경우
							// == 같은 레벨의 새로운 이미지 업로드 -> update 진행
							flag = true;

							// DB에서 파일 번호가 일치하는 행의 내용을 수정하기 위해 파일 번호를 받아옴.
							ci.setFileNo(old.getFileNo());

							removeFileList.add(old);
						}
					}
					// flag 값에 따른 insert / update 제어
					if (flag) { // true : update 진행
						result = dao.updateCompanyImage(ci);
					} else { // false : insert 진행
						result = dao.insertCompanyImage(ci);
					}
					if (result <= 0) {
//						throw new UpdateAttachmentFailException("파일 정보 수정 실패");
					}

				} else { 

					if (deleteImages[i]) {

						for (CompanyImage old : oldFiles) {
							if (old.getFileLevel() == i) {
								result = dao.deleteCompanyImage(old.getFileNo());

								if (result > 0) { // 삭제 성공 시
//									removeFileList : 서버에서 삭제할 파일 정보를 모아둔 리스트
									removeFileList.add(old);
								} else { // 삭제 실패 시
//									throw new UpdateAttachmentFailException("파일 정보 수정 실패");
								}
							}
						}
					}
				}

			}
			if (result > 0) {
				for (int i = 0; i < uploadImages.size(); i++) {

					try {
						images.get(uploadImages.get(i).getFileLevel())
								.transferTo(new File(savePath + "/" + uploadImages.get(i).getFileName()));
					} catch (Exception e) {
						e.printStackTrace();
//						throw new UpdateAttachmentFailException("파일 정보 수정 실패");
					}
				}

			}
			// ------------------------------------------
			// 이전 파일 서버에서 삭제하는 코드
			for (CompanyImage removeFile : removeFileList) {
				File tmp = new File(savePath + "/" + removeFile.getFileName());
				tmp.delete();
			}
			// ------------------------------------------

		}

		return result;
	}

	
	
	
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int deleteCompany(ChargerCompany chargerCompany) {
		int result = 0;
		
		
		result = dao.deleteCompany(chargerCompany);
		
		return result;
	}


	

	


}
