package com.kh.youngchar.chargerCompany.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.chargerCompany.model.vo.ChargerCompany;
import com.kh.youngchar.chargerCompany.model.vo.CompanyImage;
import com.kh.youngchar.chargerCompany.model.vo.PageInfo5;

@Service
public interface ChargerCompanyService {

	PageInfo5 getPageInfo(int cp);

	List<ChargerCompany> selectList(PageInfo5 pInfo);

	List<CompanyImage> selectThumbnailList(List<ChargerCompany> cList);
	
	ChargerCompany selectCompany(int companyNo);

	List<CompanyImage> selectChargerCompanyList(int companyNo);

	int insertCompany(Map<String, Object> map, List<MultipartFile> images, String savePath);

	int updateCompany(ChargerCompany updateCompany, List<MultipartFile> images, String savePath,
			boolean[] deleteImages);


	int deleteCompany(ChargerCompany chargerCompany);





}
