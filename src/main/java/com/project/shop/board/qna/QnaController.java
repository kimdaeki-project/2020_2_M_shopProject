package com.project.shop.board.qna;

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

import com.project.shop.board.BoardDTO;
import com.project.shop.board.file.BoardFileDTO;
import com.project.shop.util.Pager;

@Controller
@RequestMapping(value = "/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@PostMapping("pwCheck")
	public ModelAndView pwCheck(BoardDTO boardDTO) throws Exception {
		boardDTO=qnaService.getOne(boardDTO);
		long pw= boardDTO.getQnaPw();
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", pw);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("summernoteDelete")
	public ModelAndView summernoteDelete(String file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = qnaService.summernoteDelete(file, session);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	@PostMapping("summernote")
	public ModelAndView summernote(MultipartFile file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String fileName = qnaService.summernote(file, session);
		System.out.println(fileName);
		
//		String name = session.getServletContext().getContextPath()+File.separator;
//		name = name+"qna"+File.separator+fileName;
//		System.out.println(name);
		
		mv.addObject("msg", fileName);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	

	
	@GetMapping(value="qnaList")
	public ModelAndView getList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = qnaService.getList(pager);
		
		//BoardDTO boardDTO = ar.get(0);
		//QnaDTO qnaDTO = (QnaDTO)boardDTO;
		//System.out.println(qnaDTO.getDepth());
		
		//System.out.println(qnaDTO.getQnaPw());
		
		//mv.addObject("dto",qnaDTO);
		mv.addObject("board","qna");
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		
		mv.setViewName("qna/qnaList");
		
		return mv;
	}
	
	@GetMapping("qnaSelect")
	public ModelAndView getOne(QnaDTO qnaDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		qnaDTO = qnaService.getSelectOne(qnaDTO);
		long cnt=0;
		if(qnaDTO!=null) {
			 cnt = qnaService.getCnt(qnaDTO);
		}
		
		mv.setViewName("qna/qnaSelect");
		mv.addObject("dto", qnaDTO);
		mv.addObject("qna","qna");
		mv.addObject("cnt", cnt);
		

		return mv;
	}
	
	@GetMapping("qnaWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("qna", "qna");
		mv.setViewName("qna/qnaWrite");
		return mv;
	}
	
	@PostMapping("qnaWrite")
	public ModelAndView setInsert(QnaDTO qnaDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setInsert(qnaDTO);
		String message = "작성 실패";
		if(result>0) {
			message = "작성되었습니다.";
		}
		
		mv.addObject("msg",message);
		mv.addObject("path", "./qnaList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("qnaReply")
	public ModelAndView setReply(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		long cnt =qnaService.getCnt(boardDTO);
		if(cnt>1) {
			mv.addObject("msg", "이미 답글이 등록된 문의글입니다");
			mv.addObject("path", "./qnaList");		
			mv.setViewName("common/result");
		}else {
			mv.setViewName("qna/qnaReply");
			mv.addObject("qna", "qna");
		}
		
		return mv;
	}
	
	@PostMapping("qnaReply")
	public ModelAndView setReply(QnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setReply(qnaDTO);
		
		String message = "답변 작성 실패";
		
		if(result>0) {
			message = "답변이 작성되었습니다.";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", "./qnaList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("qnaUpdate")
	public ModelAndView setUpdate2(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO result = qnaService.getOne(boardDTO);
		mv.setViewName("qna/qnaUpdate");
		mv.addObject("dto",boardDTO);
		mv.addObject("qna","qna");
		mv.addObject("dto",result);
		return mv;
	}
	
	@PostMapping("qnaUpdate")
	public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setUpdate(boardDTO);
		String message = "수정 실패";
		if(result>0) {
			message = "수정되었습니다.";
		}
		
		mv.addObject("msg",message);
		mv.addObject("path", "./qnaList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping(value="qnaDelete")
	public ModelAndView setDelete(BoardDTO boardDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setDelete(boardDTO);
		String message = "삭제 실패";
		
		if(result>0) {
			message = "삭제되었습니다.";
		}
		
		mv.setViewName("common/result");
		mv.addObject("msg",message);
		mv.addObject("path", "./qnaList");
		
		return mv;
	}
}
