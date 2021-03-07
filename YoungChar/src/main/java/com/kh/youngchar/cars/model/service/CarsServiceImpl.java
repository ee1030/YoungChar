package com.kh.youngchar.cars.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.board.model.vo.PageInfo2;
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
	

}
