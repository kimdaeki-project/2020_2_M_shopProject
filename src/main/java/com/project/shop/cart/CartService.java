package com.project.shop.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class CartService {
	@Autowired
	private CartDAO cartDAO;
	
	public int setAllDelete(CartDTO cartDTO) throws Exception{
		return cartDAO.setAllDelete(cartDTO);
	}
	
	public int setInsert(CartDTO cartDTO)throws Exception{
		return cartDAO.setInsert(cartDTO);
	}
	public CartDTO getCheck(CartDTO cartDTO)throws Exception{
		return cartDAO.getCheck(cartDTO);
	}
	public int setAmountUpdate(CartDTO cartDTO)throws Exception{
		return cartDAO.setAmountUpdate(cartDTO);
	}
	public List<CartDTO> getList(CartDTO cartDTO) throws Exception{
		return cartDAO.getList(cartDTO);
	}
	public int setDelete(CartDTO cartDTO)throws Exception{
		return cartDAO.setDelete(cartDTO);
	}
	
	public int setUpdate(CartDTO cartDTO)throws Exception{
		return cartDAO.setUpdate(cartDTO);
	}
}
