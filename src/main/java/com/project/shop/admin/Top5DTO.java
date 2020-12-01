package com.project.shop.admin;

import java.sql.Date;

public class Top5DTO {
	//기간별 상품 매출 top5
	private long total;
	private long productNum;
	private String name;
	private Date startDate;
	private Date endDate;
	private long counter;
	
	//
	
	//현재날짜 00시부터 현재접속시간까지 매출과 주문건수
	private long todayTotal;
	private long todayCount;
	//
	
	//오늘기준 어제 그저께 매출가져오는 변수
	private long dayPrice;
	private long day;
	
	//현재 날짜의 월 일 시 분 가져오는 변수
	private String todayDate;
	
	
	//메인슬라이드
	private long num;
	private String imgName;
	private long seq;
	
	
	
	
	public long getSeq() {
		return seq;
	}
	public void setSeq(long seq) {
		this.seq = seq;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getTodayDate() {
		return todayDate;
	}
	public void setTodayDate(String todayDate) {
		this.todayDate = todayDate;
	}
	public long getCounter() {
		return counter;
	}
	public void setCounter(long counter) {
		this.counter = counter;
	}
	public long getDay() {
		return day;
	}
	public void setDay(long day) {
		this.day = day;
	}
	public long getDayPrice() {
		return dayPrice;
	}
	public void setDayPrice(long dayPrice) {
		this.dayPrice = dayPrice;
	}
	public Date getStartDate() {
		return startDate;
	}
	public long getTodayTotal() {
		return todayTotal;
	}
	public void setTodayTotal(long todayTotal) {
		this.todayTotal = todayTotal;
	}
	public long getTodayCount() {
		return todayCount;
	}
	public void setTodayCount(long todayCount) {
		this.todayCount = todayCount;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
