package com.project.shop.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.project.shop.cart.CartDAO.";

	public int setAllDelete(CartDTO cartDTO) throws Exception{
		return sqlSession.delete(NAMESPACE + "setAllDelete", cartDTO);
	}
	
	public int setInsert(CartDTO cartDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setInsert", cartDTO);
	}

	public CartDTO getCheck(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCheck", cartDTO);
	}

	public int setAmountUpdate(CartDTO cartDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setAmountUpdate", cartDTO);
	}

	public List<CartDTO> getList(CartDTO cartDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getList", cartDTO);
	}

	public int setDelete(CartDTO cartDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDelete", cartDTO);
	}
	public int setUpdate(CartDTO cartDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "setUpdate", cartDTO);
	}
}
