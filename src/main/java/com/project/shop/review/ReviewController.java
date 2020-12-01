package com.project.shop.review;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.member.MemberDTO;

@Controller
@RequestMapping(value = "/review/**")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("reviewInsert")
	public ModelAndView setInsert(ReviewDTO reviewDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		reviewDTO.setWriter(memberDTO.getId());
		String message="작성 실패";
		int result=reviewService.setInsert(reviewDTO);
		if(result>0) {
			message="작성 성공";
		}
		long pnum=reviewDTO.getPnum();
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", message);
		mv.addObject("path", "../product/productSelect?num="+pnum);
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("summernoteDelete")
	public ModelAndView summernoteDelete(String file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = reviewService.summernoteDelete(file, session);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("summernote")
	public ModelAndView summernote(MultipartFile file,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String fileName = reviewService.summernote(file, session);
		System.out.println(fileName);
		
		String name = session.getServletContext().getContextPath()+File.separator;
		name = name+"resources"+File.separator+"upload"+File.separator;
		name = name+"review"+File.separator+fileName;
		System.out.println(name);
		
		mv.addObject("msg", fileName);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
}
