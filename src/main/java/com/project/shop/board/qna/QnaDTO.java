package com.project.shop.board.qna;

import com.project.shop.board.BoardDTO;

public class QnaDTO extends BoardDTO{
	
	private long qnaPw;
	private long ref;
	private long depth;
	
	
	public long getQnaPw() {
		return qnaPw;
	}
	public void setQnaPw(long qnaPw) {
		this.qnaPw = qnaPw;
	}
	public long getRef() {
		return ref;
	}
	public void setRef(long ref) {
		this.ref = ref;
	}
	public long getDepth() {
		return depth;
	}
	public void setDepth(long depth) {
		this.depth = depth;
	}

}