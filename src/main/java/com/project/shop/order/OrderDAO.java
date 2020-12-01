package com.project.shop.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import com.project.shop.cart.CartDTO;
import com.project.shop.product.ProductDTO;
import com.project.shop.util.OrderPager;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.project.shop.order.OrderDAO.";
	
	public int setOrderDelete(OrderDTO orderDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setOrderDelete", orderDTO);
	}
	
	public OrderDTO getOrderOne(OrderDTO orderDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOrderOne", orderDTO);
	}
	public List<ProductDTO> getOrderDetailList(OrderDTO orderDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOrderDetailList", orderDTO);
	}
	
	public int setOrderAddressFixUpdate(OrderDTO orderDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setOrderAddressFixUpdate", orderDTO);
	}
	
	public int setOrderAddressUpdate(OrderDTO orderDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setOrderAddressUpdate", orderDTO);
	}
	
	public OrderDTO getOrderAddressOne(OrderDTO orderDTO)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getOrderAddressOne", orderDTO);
	}
	
	public int setOrderAddressDelete(OrderDTO orderDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setOrderAddressDelete", orderDTO);
	}
	
	public CartDTO getOne(CartDTO cartDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOne", cartDTO);
		
	}
	
	public int setOrderInsert(OrderDTO orderDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setOrderInsert", orderDTO);
	}
	
	public int setOrderDetail(OrderDetailDTO orderDetailDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setOrderDetailInsert", orderDetailDTO);
	}
	
	public List<OrderDTO> getOrderList(OrderPager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOrderList", pager);
	}
	public long getOrderCount(OrderPager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOrderCount", pager);
	}
	
	public OrderDTO getSelect(OrderDTO orderDTO)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getOrderSelect", orderDTO);
	}
	
	public int setOrderStatusUpdate(OrderDTO orderDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setOrderStatusUpdate", orderDTO);
	}
	
	public List<OrderDTO> getOrderAddress(OrderDTO orderDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOrderAddress", orderDTO);
	}
	public int setDestInsert(OrderDTO orderDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setDestInsert", orderDTO);
	}
	
	public OrderDTO getOrderAddressCheck(OrderDTO orderDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOrderAddressCheck", orderDTO);
	}
	
	public Long getOrderAddressCount(OrderDTO orderDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOrderAddressCount", orderDTO);
	}
	public int setOrderAddressFixDelete(OrderDTO orderDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setOrderAddressFixDelete", orderDTO);
	}
	public int setOrderAddressSequenceUpdate(OrderDTO orderDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setOrderAddressSequenceUpdate", orderDTO);
	}
}
