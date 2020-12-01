package com.project.shop;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.admin.AdminService;
import com.project.shop.admin.Top5DTO;
import com.project.shop.product.ProductDTO;
import com.project.shop.product.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private AdminService adminService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() throws Exception {
		List<ProductDTO> newDTOs = productService.getNewProduct();
		List<ProductDTO> bestDTOs = productService.getBestProduct();
		List<Top5DTO> top5dtos=adminService.getSlideList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("newList", newDTOs);
		mv.addObject("bestList", bestDTOs);
		mv.addObject("slideList", top5dtos);
		mv.setViewName("index");
		return mv;
	}
	
}
