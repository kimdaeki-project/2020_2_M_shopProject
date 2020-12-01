package com.project.shop.board;

import java.sql.Date;
import java.util.List;

import com.project.shop.board.file.BoardFileDTO;


public class BoardDTO {

	private long num;
	private String title;
	private String writer;
	private String contents;
	private Date regDate;
	private long hit;
	private long depth;
	
	private long qnaPw;
	private String email;
//	private long prevNum;
//	private long nextNum;
//	private String prevTitle;
//	private String nextTitle;
	
	
	List<BoardFileDTO> boardFileDTOs;
	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getQnaPw() {
		return qnaPw;
	}
	public void setQnaPw(long qnaPw) {
		this.qnaPw = qnaPw;
	}
	public long getDepth() {
		return depth;
	}
	public void setDepth(long depth) {
		this.depth = depth;
	}
	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}
	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
	}
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
//	public long getPrevNum() {
//		return prevNum;
//	}
//	public void setPrevNum(long prevNum) {
//		this.prevNum = prevNum;
//	}
//	public long getNextNum() {
//		return nextNum;
//	}
//	public void setNextNum(long nextNum) {
//		this.nextNum = nextNum;
//	}

//	public String getPrevTitle() {
//	return prevTitle;
//}
//public void setPrevTitle(String prevTitle) {
//	this.prevTitle = prevTitle;
//}
//public String getNextTitle() {
//	return nextTitle;
//}
//public void setNextTitle(String nextTitle) {
//	this.nextTitle = nextTitle;
//}

}
