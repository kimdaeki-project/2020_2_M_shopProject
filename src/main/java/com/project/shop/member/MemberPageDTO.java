package com.project.shop.member;

public class MemberPageDTO {
	private long totalPrice;
	private long totalPoint;
	private long totalCount;
	private String MemberId;
	
	
	
	
	
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public long getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(long totalPoint) {
		this.totalPoint = totalPoint;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
