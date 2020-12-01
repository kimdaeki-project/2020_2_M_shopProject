package com.project.shop.board;

import java.util.ArrayList;
import java.util.List;

import com.project.shop.util.Pager;

public interface BoardDAO {

	public int setInsert(BoardDTO boardDTO) throws Exception;
	
	public int setUpdate(BoardDTO boardDTO)throws Exception;
	
	public int setDelete(BoardDTO boardDTO)throws Exception;
	
	public List<BoardDTO> getList(Pager pager)throws Exception;
	
	public BoardDTO getOne(BoardDTO boardDTO)throws Exception;
	
	public long getCount(Pager pager)throws Exception;
	
//	public ArrayList<List> getPrev(BoardDTO boardDTO) throws Exception;
//	
//	public BoardDTO getNext(BoardDTO boardDTO) throws Exception;
//
//	ArrayList<List> getPN(long num) throws Exception;
	
}
