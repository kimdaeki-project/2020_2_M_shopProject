package com.project.shop.order;

import java.sql.Date;
import java.util.List;

import com.project.shop.product.ProductDTO;

public class OrderDTO {
	private String num;
	private String memberId;
	private String takePerson;
	private String takePhone;
	private String takeAddr1;
	private String takeAddr2;
	private String takeAddr3;
	private long totalPrice;
	private long point;
	private String status;
	private Date regdate;
	private List<OrderDetailDTO> orderDetailDTOs;
	
	//주소록 고정 변수
	private int fix;
	
	//주문목록에서 상품이름보이게하기
	private List<ProductDTO> productDTOs;
	
	
	
	public List<ProductDTO> getProductDTOs() {
		return productDTOs;
	}
	public void setProductDTOs(List<ProductDTO> productDTOs) {
		this.productDTOs = productDTOs;
	}
	public int getFix() {
		return fix;
	}
	public void setFix(int fix) {
		this.fix = fix;
	}
	public List<OrderDetailDTO> getOrderDetailDTOs() {
		return orderDetailDTOs;
	}
	public void setOrderDetailDTOs(List<OrderDetailDTO> orderDetailDTOs) {
		this.orderDetailDTOs = orderDetailDTOs;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMemberId() {
		
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTakePerson() {
		return takePerson;
	}
	public void setTakePerson(String takePerson) {
		this.takePerson = takePerson;
	}
	public String getTakePhone() {
		return takePhone;
	}
	public void setTakePhone(String takePhone) {
		this.takePhone = takePhone;
	}
	public String getTakeAddr1() {
		return takeAddr1;
	}
	public void setTakeAddr1(String takeAddr1) {
		this.takeAddr1 = takeAddr1;
	}
	public String getTakeAddr2() {
		return takeAddr2;
	}
	public void setTakeAddr2(String takeAddr2) {
		this.takeAddr2 = takeAddr2;
	}
	public String getTakeAddr3() {
		return takeAddr3;
	}
	public void setTakeAddr3(String takeAddr3) {
		this.takeAddr3 = takeAddr3;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public long getPoint() {
		return point;
	}
	public void setPoint(long point) {
		this.point = point;
	}
	public String getStatus() {
		
		return status;
	}
	public void setStatus(String status) {
		
		this.status = status;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
