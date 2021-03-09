package com.kh.youngchar.home.model.service;

import java.util.List;

import com.kh.youngchar.cars.model.vo.CAttachment;
import com.kh.youngchar.cars.model.vo.Cars;

public interface HomeService {

	List<Cars> selectList();

	List<CAttachment> selectThumbnailList(List<Cars> carList);

}
