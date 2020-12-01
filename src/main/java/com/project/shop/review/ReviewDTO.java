package com.project.shop.review;

import java.util.List;



public class ReviewDTO {

	
	private long num;
	private String writer;
	private long pnum;
	private String contents;
	private int recommend;
	private int star;
	private List<ReplyDTO> replyDTOs;
	
	
	
	
	public List<ReplyDTO> getReplyDTOs() {
		return replyDTOs;
	}
	public void setReplyDTOs(List<ReplyDTO> replyDTOs) {
		this.replyDTOs = replyDTOs;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public long getPnum() {
		return pnum;
	}
	public void setPnum(long pnum) {
		this.pnum = pnum;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	
	
	
}

