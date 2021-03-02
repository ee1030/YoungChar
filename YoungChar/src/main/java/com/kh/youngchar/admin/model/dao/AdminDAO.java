package com.kh.youngchar.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.youngchar.admin.model.vo.ChartData;
import com.kh.youngchar.member.model.vo.Member;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 신규 회원 수 조회 DAO
	 * @return newMember
	 */
	public int getNewMember() {
		return sqlSession.selectOne("adminMapper.getNewMember");
	}

	/** 신규 업체 수 조회 DAO
	 * @return newCompany
	 */
	public int getNewCompany() {
		return sqlSession.selectOne("adminMapper.getNewCompany");
	}

	/** 전체 게시글 수 조회 DAO
	 * @return allBoardCount
	 */
	public int getAllBoardCount() {
		return sqlSession.selectOne("adminMapper.getAllBoardCount");
	}

	/** 전체 시승 예약 건수 조회 DAO
	 * @return testDrive
	 */
	public int getTestDrive() {
		return sqlSession.selectOne("adminMapper.getTestDrive");
	}

	/** 신규 회원 목록 조회 DAO
	 * @return mList
	 */
	public List<Member> getNewMemList() {
		return sqlSession.selectList("adminMapper.getNewMemList");
	}

	/** 대시보드 차트 데이터 조회 DAO
	 * @return
	 */
	public List<ChartData> getChartData() {
		return sqlSession.selectList("adminMapper.getChartData");
	}
}
