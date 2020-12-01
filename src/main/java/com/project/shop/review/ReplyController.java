package com.project.shop.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.member.MemberDTO;
import com.project.shop.util.ReviewPager;

@Controller
@RequestMapping(value = "/reply/**")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	
	@PostMapping("setReply")
	public ModelAndView setReply(ReplyDTO replyDTO, HttpSession session, ReviewPager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		replyDTO.setReWriter(memberDTO.getId());
		int result = replyService.setReply(replyDTO);
		String message = "댓글 작성 실패";
		if(result>0) {
			message = "댓글 작성 성공";
		}
		int curPage = pager.getCurPage();
		long pnum = pager.getPnum();
	
		mv.addObject("msg", message);
		mv.addObject("path", "../product/productSelect?num="+pnum+"&curPage="+curPage);
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("setDelete")
	public ModelAndView setDelete(ReplyDTO replyDTO, ReviewPager pager) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = replyService.setDelete(replyDTO);
		long pnum=pager.getPnum();
		long curPage = pager.getCurPage();
		String message ="댓글 삭제 실패";
		if(result>0){
			message = "댓글 삭제 성공";
			
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", "../product/productSelect?num="+pnum+"&curPage="+curPage);
		mv.setViewName("common/result");
		
		return mv;
	}
	
//정보 가져오기
	@PostMapping("setUpdate")
	public ModelAndView setUpdate(ReplyDTO replyDTO, ReviewPager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = replyService.setUpdate(replyDTO);
		String message="수정 실패";
		if(result>0) {
			message = "수정 성공";
		}
		long curPage = pager.getCurPage();
		long pnum = pager.getPnum();
	
		mv.addObject("msg", message);
		mv.addObject("path", "../product/productSelect?num="+pnum+"&curPage="+curPage);
		mv.setViewName("common/result");
		return mv;
	}
}
