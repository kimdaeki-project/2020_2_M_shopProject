package com.project.shop.board.notice;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.board.BoardDTO;
import com.project.shop.util.Pager;


@Controller
@RequestMapping(value="/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	@PostMapping("summernoteDelete")
	public ModelAndView summernoteDelete(String file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = noticeService.summernoteDelete(file, session);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("summernote")
	public ModelAndView summernote(MultipartFile file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();

		String fileName = noticeService.summernote(file, session);
		
	//	String name = session.getServletContext().getContextPath()+File.separator;
	//	name = name+"resources"+File.separator+"upload"+File.separator;
	//	name = name+"notice"+File.separator+fileName;
	//	System.out.println(name);
		mv.addObject("msg", fileName);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("noticeList")
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO>  ar = noticeService.getList(pager);
		
		mv.addObject("notice", "notice");
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
//		System.out.println("Notice List");
		mv.setViewName("notice/noticeList"); 
		return mv;
	}
	
	   @GetMapping(value="noticeDelete")
	   public ModelAndView setDelete(BoardDTO boardDTO) throws Exception{
	      System.out.println("Notice Delete");
	      ModelAndView mv = new ModelAndView();
	      int result = noticeService.setDelete(boardDTO);
	      String message = "Delete Fail!";
	      
	      if(result>0) {
	         message = "Delete Success!";
	      }
	      mv.setViewName("common/result");
	      mv.addObject("msg",message);
	      mv.addObject("path", "./noticeList");
	      
	      return mv;
	      
	   }
	
	   @GetMapping("noticeUpdate")
	   public ModelAndView setUpdate2(BoardDTO boardDTO) throws Exception{
	      ModelAndView mv = new ModelAndView();
	      BoardDTO result = noticeService.getOne(boardDTO);
	      mv.setViewName("notice/noticeUpdate");
	      mv.addObject("dto",boardDTO);
	      mv.addObject("notice","notice");
	      mv.addObject("dto",result);
	      return mv;
	   }
	   
	   @PostMapping("noticeUpdate")
	   public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception{
	      ModelAndView mv = new ModelAndView();
//	      System.out.println("title ::: " + boardDTO.getTitle());
//	      System.out.println("num ::: " + boardDTO.getNum());
//	      System.out.println("contents ::: " + boardDTO.getContents());
	      int result = noticeService.setUpdate(boardDTO);
	      String message = "Update Fail";
	      if(result>0) {
	         message = "Update Success";
	      }
	      
	      mv.addObject("msg",message);
	      mv.addObject("path", "./noticeList");
	      mv.setViewName("common/result");
	      
	      return mv;
	   }
	
	@GetMapping("noticeSelect")
	public ModelAndView getOne(BoardDTO boardDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		boardDTO = noticeService.getOne(boardDTO);
		if(boardDTO != null) {
			mv.setViewName("notice/noticeSelect");
			mv.addObject("dto", boardDTO);
			mv.addObject("notice", "notice");
		}else {
			mv.setViewName("common/result");
			mv.addObject("msg", "No Data");
			mv.addObject("path", "./noticeList");
		}
		
		return mv;
				
	}
	
	@PostMapping("noticeWrite")
	public ModelAndView setInsert(BoardDTO boardDTO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setInsert(boardDTO);
		String message="Write Fail";
		if(result>0) {
			message ="Write Success";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", "./noticeList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("noticeWrite")
	public ModelAndView setInsert()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notice/noticeWrite");
		mv.addObject("notice", "notice");
		return mv;
	}
	
//	@GetMapping("noticeSelectPrev")
//	public ModelAndView getPrev(BoardDTO boardDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		//boardDTO = noticeService.getPrev(boardDTO);
//		
//		if(boardDTO != null) {
//			mv.setViewName("notice/noticeSelect");
//			mv.addObject("dto", boardDTO);
//			mv.addObject("notice", "notice");
//		}else {
//			mv.setViewName("common/result");
//			mv.addObject("msg", "No Data");
//			mv.addObject("path", "./noticeList");
//		}
//		return mv;
//	}
//	
//	@GetMapping("noticeSelectNext")
//	public ModelAndView getNext(BoardDTO boardDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		boardDTO = noticeService.getNext(boardDTO);
//		if(boardDTO != null) {
//			mv.setViewName("notice/noticeSelect");
//			mv.addObject("dto", boardDTO);
//			mv.addObject("notice", "notice");
//		}else {
//			mv.setViewName("common/result");
//			mv.addObject("msg", "No Data");
//			mv.addObject("path", "./noticeList");
//		}
//		return mv;
//	}
//	
}
