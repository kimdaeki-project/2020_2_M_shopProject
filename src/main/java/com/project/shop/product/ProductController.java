package com.project.shop.product;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.review.ReplyService;
import com.project.shop.review.ReviewDTO;
import com.project.shop.review.ReviewService;
import com.project.shop.util.FileSaver;
import com.project.shop.util.ProductPager;
import com.project.shop.util.ReviewPager;


@Controller
@RequestMapping("/product/**")
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private ReviewService reviewService;
	
	//상품검색
	@GetMapping("productSearch")
	public ModelAndView getproductSearch(ProductPager pager)throws Exception{
		List<ProductDTO> productDTOs = productService.getSearchList(pager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", productDTOs);
		mv.addObject("pager", pager);
		mv.setViewName("product/productSearch");
		return mv;
	}
	//상품삭제
	@GetMapping("productDelete")
	public ModelAndView setproductDelete(ProductDTO productDTO ,HttpSession httpSession)throws Exception{
		ModelAndView mv = new ModelAndView();
		long pCode = productDTO.getpCode();
		long cCode = productDTO.getcCode();
		int result =productService.setProductDelete(productDTO,httpSession);
		String message="상품 삭제 실패!";
		if(result>0) {
			message="상품 삭제 성공!";
		}
		mv.addObject("msg", message);
		mv.addObject("path", "./productList?pCode="+pCode+"&cCode="+cCode);
		mv.setViewName("common/result");
		return mv;
	}
	//상품 업데이트폼으로 이동
	@GetMapping("productUpdate")
	public ModelAndView setproductUpdate(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		productDTO=productService.getOne(productDTO);
		mv.addObject("dto", productDTO);
		mv.setViewName("product/productUpdate");
		return mv;
	}
	@PostMapping("productUpdate")
	public ModelAndView setproductUpdate(ProductDTO productDTO,MultipartFile mainImg, HttpSession httpSession) throws Exception{
		ModelAndView mv = new ModelAndView();
		long num=productDTO.getNum();
		String message="상품 수정 실패!";
		int result=productService.setProductUpdate(productDTO, mainImg, httpSession);
		if(result>0) {
			message="상품 수정 성공!";
		}
		mv.addObject("msg", message);
		mv.addObject("path", "./productSelect?num="+num);
		mv.setViewName("common/result");
		return mv;
	}
	//상품 상세페이지 이동
	@GetMapping("productSelect")
	public ModelAndView getproductSelect(ProductDTO productDTO, ReviewDTO reviewDTO, ReviewPager pager) throws Exception{
		int result =productService.setHitUpdate(productDTO);
		List<ReviewDTO> ar = null;
		String message=null;
		if(result>0) {
			productDTO=productService.getOne(productDTO);
			pager.setPnum(productDTO.getNum());
			ar =reviewService.getList(pager);
		}
		 ModelAndView mv = new ModelAndView();
		 mv.addObject("dto", productDTO);
		 mv.addObject("list", ar);
		 mv.addObject("rpager", pager);
		 mv.addObject("msg", message);
		 mv.setViewName("product/productSelect");
		 return mv;
		
	}
	
	//상품 등록 폼이동
	@GetMapping("productInsert")
	public ModelAndView setInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<CategoryDTO> pCodeDTOs = productService.getpCode();
		List<CategoryDTO> cCodeDTOs =null;
		if(pCodeDTOs!=null) {
			CategoryDTO categoryDTO = pCodeDTOs.get(0);
		
			cCodeDTOs=productService.getcCode(categoryDTO);
			
		}
		mv.addObject("plist", pCodeDTOs);
		mv.addObject("clist", cCodeDTOs);
		mv.setViewName("product/productInsert");
		return mv;
	}
	//상품 등록에서 대분류 카테고리가 바뀔떄마다 소분류 카테고리가 동적으로 변함
	@PostMapping("getcCodeAjax")
	public ModelAndView getcCodeAjax(CategoryDTO categoryDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CategoryDTO> categoryDTOs = productService.getcCode(categoryDTO);
		mv.addObject("clist", categoryDTOs);
		return mv;
	}
	//상품 등록
	@PostMapping("productInsert")
	public ModelAndView setproductInsert(ProductDTO productDTO,MultipartFile mainImg, HttpSession httpSession)throws Exception{
		
		int result=productService.setInsert(productDTO, mainImg, httpSession);
		 ModelAndView mv = new ModelAndView();
		 String message="상품등록 실패!";
		if(result>0) {
			message="상품등록 성공!";
			
			
		}
		 mv.addObject("msg", message);
		 mv.addObject("path", "./productInsert");
		 mv.setViewName("common/result");
		 return mv;
		
	}
	//상품등록 상세보기에 들어가는 사진들
	@PostMapping("summernote")
	public ModelAndView summertnoteInsert(MultipartFile file,HttpSession httpSession) throws Exception {
		String path = httpSession.getServletContext().getRealPath("/resources/upload/product");
		System.out.println(path);
		File dest = new File(path);
		String name= fileSaver.save(file,dest);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", name);
		mv.setViewName("common/ajaxResult");
		return mv;
		
	}
	//상품등록 상세보기에 들어가는 사진지우기
	@PostMapping("summernoteDelete")
	public ModelAndView summernoteDelete(String file,HttpSession httpSession)throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = httpSession.getServletContext().getRealPath("/resources/upload/product");
		File dest = new File(path,file);
		boolean result =false;
		if(dest.exists()) {
			result= dest.delete();
		}
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	//상품리스트
	@GetMapping("productList")
	public ModelAndView getList(ProductPager pager) throws Exception {
		ModelAndView mv = new ModelAndView();	
		List<ProductDTO> productDTOs= productService.getList(pager);
		List<CategoryDTO> categoryDTOs =productService.getCategory(pager);
		mv.addObject("category", categoryDTOs);
		mv.addObject("list", productDTOs);
		mv.addObject("pager", pager);
		mv.setViewName("product/productList");
		
		return mv;
	}
	
}
