package com.kh.youngchar.chargerCompany.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.youngchar.chargerCompany.model.vo.ChargerCompany;
import com.kh.youngchar.company.model.vo.PageInfo;

@Service
public interface ChargerCompanyService {

	PageInfo getPageInfo(int cp);

	List<ChargerCompany> selectList(PageInfo pInfo);

	ChargerCompany selectCompany(int companyNo);

	List<ChargerCompany> selectChargerCompanyList(int companyNo);

	int insertCompany(Map<String, Object> map, List<MultipartFile> images, String savePath);



}
