package com.kh.youngchar.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youngchar.member.model.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;
}
