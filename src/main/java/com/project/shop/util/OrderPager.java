package com.project.shop.util;

public class OrderPager {

	private int startRow;
	private int lastRow;
	private long totalCount;
	private Integer curPage;
	private int perPage;
	private long startNum;
	private long lastNum;
	private boolean nextCheck;
	private long lastPage;
	private String memberId;	
	private String status;
	
	
	
	
	public String getStatus() {
		if(status=="") {
			status=null;
		}
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public OrderPager() {
		perPage=10;
	}
	public void  makeRow() {
		startRow=(this.getCurPage()-1)*this.getPerPage()+1;
		lastRow=this.getCurPage()*this.getPerPage();
	
	}
	
	public void makePage() {
		//전체 페에지의 개수
		long totalPage=this.getTotalCount()/10;
		if(this.getTotalCount()%10!=0) {
			totalPage++;
		}
		this.setLastPage(totalPage);
		//전체 블럭의 개수
		long totalBlock=totalPage/5;
		if(totalPage%5!=0) {
			totalBlock++;
		}
		
		//현재페이지를 이용해서 현재블럭 번호를찾기
		long curBlock = this.getCurPage()/5;
		if(this.getCurPage()%5!=0) {
			curBlock++;
			}
		
		//현재블럭번호로 시작번호 끝번호 계산
		 this.startNum=(curBlock-1)*5+1;
		 this.lastNum=curBlock*5;
		
		
		//현재 블럭번호와 전체블럭 번호가 같은지 판단
		 this.nextCheck=true;
		if(curBlock == totalBlock) {
			nextCheck= !nextCheck;
			lastNum=totalPage;
		}
		
		
	}
	
	
	
	public String getMemberId() {
		if(memberId=="") {
			memberId=null;
		}
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}
	public long getTotalCount() {
		if(this.totalCount==0) {
			this.totalCount=1;
		}
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getCurPage() {
		if(curPage==null) {
			curPage=1;
		}
		return curPage;
	}
	public void setCurPage(Integer curPage) {
		if(curPage==null) {
			curPage=1;
		}
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public long getStartNum() {
		return startNum;
	}
	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}
	public long getLastNum() {
		return lastNum;
	}
	public void setLastNum(long lastNum) {
		this.lastNum = lastNum;
	}
	public boolean isNextCheck() {
		return nextCheck;
	}
	public void setNextCheck(boolean nextCheck) {
		this.nextCheck = nextCheck;
	}
	public long getLastPage() {
		return lastPage;
	}
	public void setLastPage(long lastPage) {
		this.lastPage = lastPage;
	}
	
	
	
}
