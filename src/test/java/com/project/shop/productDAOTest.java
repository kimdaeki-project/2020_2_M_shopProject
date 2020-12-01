package com.project.shop;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.shop.product.ProductDAO;
import com.project.shop.product.ProductDTO;

public class productDAOTest extends MyTestCase{
	
	@Autowired
	private ProductDAO productDAO;
	@Test
	public void productDAOInsertTest() throws Exception {
		for(int i=1;i<=142;i++) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setName("셔츠Test"+i);
			productDTO.setPrice(17000+i);
			productDTO.setImgName("1604416645421_shirt.jpg");
			productDTO.setIntroduce("셔츠설명Test"+i);
			productDTO.setSale(8);
			productDTO.setpCode(1);
			productDTO.setcCode(15);
			
			productDAO.setInsert(productDTO);
			if(i%10==0) {
				Thread.sleep(1000);
			}
		}
	}

}
