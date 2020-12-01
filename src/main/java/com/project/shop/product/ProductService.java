package com.project.shop.product;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.shop.util.FileSaver;
import com.project.shop.util.ProductPager;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProductService {
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private ProductDAO productDAO;

	
	// 상품수정
	public int setProductUpdate(ProductDTO productDTO, MultipartFile mainImg, HttpSession httpSession)
			throws Exception {
		String path = httpSession.getServletContext().getRealPath("/resources/upload/product");
		System.out.println(path);
		File dest = new File(path);
		String imgName = "";
		imgName = fileSaver.save(mainImg, dest);
		productDTO.setImgName(imgName);
		int result = productDAO.setProductUpdate(productDTO);
		return result;
	}

	// 상품등록
	public int setInsert(ProductDTO productDTO, MultipartFile mainImg, HttpSession httpSession) throws Exception {
		String path = httpSession.getServletContext().getRealPath("/resources/upload/product");
		System.out.println(path);
		File dest = new File(path);
		String imgName = "";
		imgName = fileSaver.save(mainImg, dest);
		productDTO.setImgName(imgName);
		int result = productDAO.setInsert(productDTO);

		return result;
	}

	// 상품 리스트
	public List<ProductDTO> getList(ProductPager pager) throws Exception {
		pager.makeRow();
		pager.setTotalCount(productDAO.getTotalCount(pager));

		pager.makePage();
		List<ProductDTO> productDTOs = productDAO.getList(pager);
		return productDTOs;
	}
	//상품검색리스트
	public List<ProductDTO> getSearchList(ProductPager pager)throws Exception{
		pager.makeRow();
		pager.setTotalCount(productDAO.getSearchCount(pager));
		pager.makePage();
		List<ProductDTO> productDTOs = productDAO.getSearchList(pager);
		return productDTOs;
	}
	
	// 상품상세
	public ProductDTO getOne(ProductDTO productDTO) throws Exception {
		return productDAO.getOne(productDTO);
	}

	public int setHitUpdate(ProductDTO productDTO) throws Exception {
		return productDAO.setHitUpdate(productDTO);
	}

	public int setProductDelete(ProductDTO productDTO, HttpSession httpSession) throws Exception {
		int result = productDAO.setProductDelete(productDTO);
		if (result > 0) {
			String path = httpSession.getServletContext().getRealPath("/resources/upload/product");
			File dest = new File(path, productDTO.getImgName());
			if (dest.exists()) {
				dest.delete();
			}
		}
		return result;
	}

	// 홈페이지에서 신상품 가져오기
	public List<ProductDTO> getNewProduct() throws Exception {
		return productDAO.getNewProduct();

	}

	// 홈페이지에서 신상품 가져오기
	public List<ProductDTO> getBestProduct() throws Exception {
		return productDAO.getBestProduct();

	}

	// 리스트가 어떤카테고리인지가져옴
	public List<CategoryDTO> getCategory(ProductPager pager) throws Exception {
		return productDAO.getCategory(pager);
	}
	//상품등록할때 대분류 코드만가져와서 셀렉터에뿌림
	public List<CategoryDTO> getpCode() throws Exception {
		return productDAO.getpCode();
	}
	public List<CategoryDTO> getcCode(CategoryDTO categoryDTO) throws Exception {
		return productDAO.getcCode(categoryDTO);
	}
}
