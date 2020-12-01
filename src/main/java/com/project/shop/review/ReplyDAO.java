package com.project.shop.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.project.shop.review.ReplyDAO.";
	
	public ReplyDTO getOne(ReplyDTO replyDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOne", replyDTO);
	}
	
	public int setReply(ReplyDTO replyDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setReply", replyDTO);
	}
	
	public List<ReplyDTO> getList(ReplyDTO replyDTO) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"getList", replyDTO);
	}
	
	public int setDelete(ReplyDTO replyDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", replyDTO);
				
	}
	
	  public int setUpdate(ReplyDTO replyDTO) throws Exception {
	      return sqlSession.update(NAMESPACE+"setUpdate", replyDTO);
	   }

}
