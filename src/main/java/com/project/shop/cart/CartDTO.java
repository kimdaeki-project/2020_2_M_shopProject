package com.project.shop.cart;

import java.sql.Date;

import com.project.shop.product.ProductDTO;

public class CartDTO {

	private long num;
	private String memberId;
	private long productNum;
	private String color;
	private String sizing;
	private long amount;
	private Date regDate;
	private ProductDTO productDTO;
	private long totalPrice;
	
	public long getTotalPrice() {
		totalPrice=productDTO.getFinalPrice()*getAmount();
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSizing() {
		return sizing;
	}
	public void setSizing(String sizing) {
		this.sizing = sizing;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
