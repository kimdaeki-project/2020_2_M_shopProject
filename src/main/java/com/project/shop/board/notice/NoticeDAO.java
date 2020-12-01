package com.project.shop.board.notice;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.board.BoardDAO;
import com.project.shop.board.BoardDTO;
import com.project.shop.board.file.BoardFileDTO;
import com.project.shop.util.Pager;

@Repository
public class NoticeDAO implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.project.shop.board.notice.NoticeDAO.";

	public Long getNum()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	public int setInsertFile(BoardFileDTO boardFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsertFile", boardFileDTO);
	}
	
	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setInsert", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setDelete", boardDTO);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}

	@Override
	public BoardDTO getOne(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getOne", boardDTO);
	}

	@Override
	public long getCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}
	
//	@Override
//	public ArrayList<List> getPrev(BoardDTO boardDTO) throws Exception {
//		return sqlSession.selectOne(NAMESPACE+"getPrev", boardDTO);
//	}
//	
//	@Override
//	public BoardDTO getNext(BoardDTO boardDTO) throws Exception {
//		return sqlSession.selectOne(NAMESPACE+"getNext", boardDTO);
//	}
//	
//	@Override
//	public ArrayList<List> getPN(long num) throws Exception {
//		return sqlSession.selectOne(NAMESPACE+"getPN", num);
//	}
	
}
