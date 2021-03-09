package com.kh.youngchar.common.scheduling;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.youngchar.admin.model.service.AdminService;

@Component
public class ImageDeleteScheduling {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private AdminService service;
	
	private List<File> serverFileList = null;
	private List<String> dbFileList = null;
	
	@Scheduled(cron="0 * * * * *") //  매 분마다 진행
	public void deleteImage() {
		
		serverFileList = new ArrayList<File>();
		
		String savePath = servletContext.getRealPath("/resources/carImages");
		getServerFileList(savePath);
		
		savePath = servletContext.getRealPath("/resources/chargerCompanyImages");
		getServerFileList(savePath);
		
		savePath = servletContext.getRealPath("/resources/memberFile");
		getServerFileList(savePath);
		
		savePath = servletContext.getRealPath("/resources/reviewImages");
		getServerFileList(savePath);
		
		savePath = servletContext.getRealPath("/resources/uploadImages");
		getServerFileList(savePath);
		
		savePath = servletContext.getRealPath("/resources/newsImages");
		getServerFileList(savePath);
		
		dbFileList = service.getDbList();
		
		if(dbFileList != null && !serverFileList.isEmpty()) {
			
			// serverFileList 반복접근
			for(File serverFile : serverFileList) {
				String fileName = serverFile.toString().substring(serverFile.toString().lastIndexOf("\\") + 1);
				
				// indexOf(비교값) : 비교값이 List에 존재하면 해당 index 반환, 없으면 -1 반환
				if(dbFileList.indexOf(fileName) < 0) {
					serverFile.delete();
					System.out.println(fileName + " 삭제");
				}
			}
		}
		
	}
	
	// 서버 파일리스트 불러오기
	private void getServerFileList(String savePath) {
		
		// 해당 경로에 있는 모든 파일을 읽어옴
		File folder = new File(savePath);
		
		File[] fileList = folder.listFiles(); // savePath 폴더에 있는 모든 파일 정보가 배열로 반환
		
		Date threeDaysAgo = new Date(System.currentTimeMillis() - (3 * 24 * 60 * 60 * 1000));
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHH");
		
		String standard = sdf.format(threeDaysAgo);
		// 3일 전 날짜가 지정된 패턴 모양의 문자열 반환
		
		for(File file : fileList) {
			// fileList 배열에 반복 접근하여 파일명만 얻어오기
			String fileName = file.toString().substring( file.toString().lastIndexOf('\\')+1 );
			// System.out.println(file.toString());
			// System.out.println(fileName);
			
			// 12 | 15
			// 21021512		21021012
			// 기준(3일전 시간) 보다 더 이전에 만들어진 파일일 경우
			// A.compareTo(B)
			// A가 B보다 크면 양수
			// A가 B보다 작으면 음수
			// A와 B가 같다면 0
			if(standard.compareTo(fileName.substring(0,8)) >= 0) {
				serverFileList.add(file);
			}
			
		}
	}
}
