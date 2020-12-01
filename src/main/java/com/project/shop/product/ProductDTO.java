package com.project.shop.product;

import java.sql.Date;




public class ProductDTO {
	private long num;
	private String name;
	private long price;
	private String introduce;
	private long sale;
	private String imgName;
	private long pCode;
	private long cCode;
	private long hit;
	private Date regDate;
	private long finalPrice;
	
	
	public long getFinalPrice() {
		 long price =this.getPrice();
		 long  sale =this.getSale();
		 finalPrice =(long) (price*(100-sale)*0.01);	
		return finalPrice;
	}
	public void setFinalPrice(long finalPrice) {
		this.finalPrice = finalPrice;
	}
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public long getSale() {
		return sale;
	}
	public void setSale(long sale) {
		this.sale = sale;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public long getpCode() {
		return pCode;
	}
	public void setpCode(long pCode) {
		this.pCode = pCode;
	}
	public long getcCode() {
		return cCode;
	}
	public void setcCode(long cCode) {
		this.cCode = cCode;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
