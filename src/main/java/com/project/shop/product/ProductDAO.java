package com.project.shop.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.shop.util.ProductPager;




@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	public static String NAMESPACE="com.project.shop.product.ProductDAO.";
	
	//상품등록
	public int setInsert(ProductDTO productDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsert", productDTO);
	}
	
	//상품리스트 개수가져오기
	public long getTotalCount(ProductPager pager)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}
	//상품리스트 가져오기
	public List<ProductDTO> getList(ProductPager pager)throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	public ProductDTO getOne(ProductDTO productDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOne", productDTO);
	}
	
	public int setHitUpdate(ProductDTO productDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setHitUpdate", productDTO);
	}
	
	public int setProductDelete(ProductDTO productDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setProductDelete", productDTO);
	}
	public int setProductUpdate(ProductDTO productDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setProductUpdate", productDTO);
	}
	
	public List<ProductDTO> getNewProduct()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getNewProduct");
		
	}
	
	public List<ProductDTO> getBestProduct()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getBestProduct");
		
	}
	public List<CategoryDTO> getCategory(ProductPager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCategory", pager);
	}
	public List<CategoryDTO> getpCode() throws Exception{
		return sqlSession.selectList(NAMESPACE+"getpCode");
	}
	
	public List<CategoryDTO> getcCode(CategoryDTO categoryDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getcCode",categoryDTO);
	}
	
	public List<ProductDTO> getSearchList(ProductPager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getSearchList", pager);
	}
	public  long getSearchCount(ProductPager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSearchCount", pager);
	}
}
