package com.kh.youngchar.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.kh.youngchar.board.model.dao.BoardDAO;

@Service // Service임을 알려줌 + bean 등록 
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;
}
