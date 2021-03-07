package com.kh.youngchar.cars.model.service;

import java.util.List;

import com.kh.youngchar.board.model.vo.PageInfo2;
import com.kh.youngchar.cars.model.vo.Cars;

public interface CarsService {

	/** 차량 조회시 페이지 네이션 
	 * @param cp
	 * @return
	 */
	PageInfo2 carListPageInfo(int cp);

	/** 차량 리스트 조회
	 * @param pInfo
	 * @return
	 */
	List<Cars> selectCarList(PageInfo2 pInfo);

	/** 차량 상세조회
	 * @param carNo
	 * @return
	 */
	Cars selectCar(int carNo);

}
