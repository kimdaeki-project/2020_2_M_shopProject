package com.project.shop.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.member.MemberDTO;
import com.project.shop.util.OrderPager;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.project.shop.admin.AdminDAO.";
	
	//슬라이드 순서정렬
	public int setSlideSeqUpdate(Top5DTO top5dto)throws Exception{
		 return sqlSession.update(NAMESPACE+"setSlideSeqUpdate", top5dto);
		}
	
	//슬라이드 지우기
	public int setSlideDelete(Top5DTO top5dto)throws Exception{
		return sqlSession.delete(NAMESPACE+"setSlideDelete", top5dto);
	}
	//메인슬라이드 이미지 리스트
	public List<Top5DTO> getSlideList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getSlideList");
	}
	//메인슬라이드 이미지등록
	public int setSlideInsert(Top5DTO top5dto)throws Exception{
		return sqlSession.insert(NAMESPACE+"setSlideInsert", top5dto);
	}
	
	//기간별 최고매출상품5가지
	public List<Top5DTO> getTop5List(Top5DTO top5dto)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getTop5List",top5dto);
	}
	
	//현재시간기준 매출과 주문횟수
	public Top5DTO getTodayInfo()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTodayInfo");
	}
	
	//오늘 어제 그저께 매출 가져오기
	public Top5DTO getDayTotal(Top5DTO top5dto)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDayTotal", top5dto);
	}
	//오늘 현재시간
	public Top5DTO getTodayDate()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTodayDate");
	}
	//회원리스트가져오기
	
	public List<MemberDTO> getMemberList(OrderPager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberList", pager);
	}
	
	public long getMemberCount(OrderPager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberCount", pager);
	}
}
