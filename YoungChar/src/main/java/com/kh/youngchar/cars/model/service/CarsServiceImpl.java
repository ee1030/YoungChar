package com.kh.youngchar.cars.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.board.model.vo.PageInfo2;
import com.kh.youngchar.board.model.vo.Search;
import com.kh.youngchar.cars.model.dao.CarsDAO;
import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;

@Service
public class CarsServiceImpl implements CarsService{
	
	@Autowired
	private CarsDAO dao;
	
	
	
//	챠량 리스트 페이지 네이션 
	@Override
	public PageInfo2 carListPageInfo(int cp) {
		
		int listCount = dao.getCarListCount();
		
		return new PageInfo2(cp,listCount);
	}
	
//	차량 목록 조회 service구현 
	@Override
	public List<Cars> selectCarList(PageInfo2 pInfo) {
		return dao.selectCarList(pInfo);
	}
	
	@Override
	public List<Cars> selectList() {
		return dao.selectList();
	}
	
//	차량 상세조회 Service 구현 
	@Override
	public Cars selectCar(int carNo) {
		return dao.selectCar(carNo);
	}
	
//	썸네일 조회 Service 구현 
	@Override
	public List<CAttachment> selectThumbnailList(List<Cars> carList) {
		return dao.selectThumbnailList(carList);
	}
	
//	상세조회 시 이미지 목록 조회 service
	@Override
	public List<CAttachment> selectAttachmentList(int carNo) {
		return dao.selectAttachmentList(carNo);
	}
	
//	검색차량 조회 1
	@Override
	public Cars selectSearchCar1(int carNo1) {
		return dao.selectSearchCar1(carNo1);
	}
	
//	검색 차량 조회 2
	@Override
	public Cars selectSearchCar2(int carNo2) {
		return dao.selectSearchCar2(carNo2);
	}
	
//	차량 이미지 조회 1
	@Override
	public List<CAttachment> selectAtList1(int carNo1) {
		return dao.selectAtList1(carNo1);
	}
	
//	차량 이미지 조회 2
	@Override
	public List<CAttachment> selectAtList2(int carNo2) {
		return dao.selectAtList2(carNo2);
	}
	
//	검색 페이지 인포
	@Override
	public PageInfo2 getSearchPageInfo(Search search, int cp) {
		
		int listCount = dao.getListCount(search);
		
		return new PageInfo2(cp, listCount);
	}
	
//	카테고리 검색 차량 
	@Override
	public List<Cars> selectCarList2(Search search, PageInfo2 pInfo) {
		return dao.selectCarList2(search , pInfo);
	}

}
