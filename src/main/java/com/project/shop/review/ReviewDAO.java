package com.project.shop.review;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.util.ReviewPager;


@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.project.shop.review.ReviewDAO.";
	
	public List<ReviewDTO> pageList(ReviewPager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"pageList", pager);
	}
	
	public int setInsert(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsert", reviewDTO);
	}
	public List<ReviewDTO> getList(ReviewPager pager) throws Exception{
		List<ReviewDTO> reviewDTOs= sqlSession.selectList(NAMESPACE+"getList", pager);
		return reviewDTOs;
	}
	public long getCount(ReviewPager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}
	
}
