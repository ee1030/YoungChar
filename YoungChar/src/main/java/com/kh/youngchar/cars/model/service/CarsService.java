package com.kh.youngchar.cars.model.service;

import java.util.List;

import com.kh.youngchar.board.model.vo.PageInfo2;
import com.kh.youngchar.board.model.vo.Search;
import com.kh.youngchar.cars.model.vo.CAttachment;
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

	/** 썸네일 조회
	 * @param carList
	 * @return
	 */
	List<CAttachment> selectThumbnailList(List<Cars> carList);

	/** 상세조회 시 이미지 목록 조회 service
	 * @param carNo
	 * @return
	 */
	List<CAttachment> selectAttachmentList(int carNo);

	/** 검색 차량 조회 1
	 * @param carNo1
	 * @return
	 */
	Cars selectSearchCar1(int carNo1);

	/** 검색 차량 조회 2
	 * @param carNo2
	 * @return
	 */
	Cars selectSearchCar2(int carNo2);

	/** 차량 이미지 조회 1
	 * @param carNo1
	 * @return
	 */
	List<CAttachment> selectAtList1(int carNo1);

	/** 차량 이미지 조회 2
	 * @param carNo2
	 * @return
	 */
	List<CAttachment> selectAtList2(int carNo2);

	/** 서치 카 페이지 인포
	 * @param cp 
	 * @param ctList 
	 * @param strings
	 * @param cp
	 * @return
	 */
	PageInfo2 getSearchPageInfo(Search search, int cp);

	/** 카테고리 검색 차량 
	 * @param search
	 * @param pInfo
	 * @return
	 */
	List<Cars> selectCarList2(Search search, PageInfo2 pInfo);

}
