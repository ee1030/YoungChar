package com.kh.youngchar.chargerCompany.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.youngchar.chargerCompany.model.vo.ChargerCompany;
import com.kh.youngchar.company.model.vo.PageInfo;

@Service
public interface ChargerCompanyService {

	PageInfo getPageInfo(int cp);

	List<ChargerCompany> selectList(PageInfo pInfo);



}
