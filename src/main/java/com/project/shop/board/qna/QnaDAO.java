package com.project.shop.board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.board.BoardDAO;
import com.project.shop.board.BoardDTO;
import com.project.shop.board.file.BoardFileDTO;
import com.project.shop.util.Pager;

@Repository
public class QnaDAO implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String namespace="com.project.shop.board.qna.QnaDAO.";
	
	public QnaDTO getSelectOne(QnaDTO qnaDTO)throws Exception{
		return sqlSession.selectOne(namespace+"getSelectOne", qnaDTO);
	}
	
	public Long getNum() throws Exception{
		return sqlSession.selectOne(namespace+"getNum");
	}
	
	public int setInsertFile(BoardFileDTO boardFileDTO) throws Exception{
		return sqlSession.insert(namespace+"setInsertFile", boardFileDTO);
	}
	
	public int setReply(BoardDTO boardDTO) throws Exception{
		return sqlSession.insert(namespace+"setReply", boardDTO);
	}
	
	public int setReplyUpdate(BoardDTO boardDTO) throws Exception{
		return sqlSession.update(namespace+"setReplyUpdate", boardDTO);
	}
	
	public long getCnt(BoardDTO boardDTO) throws Exception{
		return sqlSession.selectOne(namespace+"getCnt", boardDTO);
	}
	
	
	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"setInsert", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"setDelete", boardDTO);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getList",pager);
	}

	@Override
	public BoardDTO getOne(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getOne", boardDTO);
	}

	@Override
	public long getCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getCount",pager);
	}
	
	

}