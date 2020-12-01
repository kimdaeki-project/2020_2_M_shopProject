package com.project.shop.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.shop.board.BoardDTO;
import com.project.shop.board.qna.QnaDAO;
import com.project.shop.member.MemberDTO;

@Component
public class QnaDeleteInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private QnaDAO qnaDAO;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean check =false;
		HttpSession session = request.getSession();
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("member");
		if(memberDTO==null) {
			request.setAttribute("msg", "권한이 없습니다");
			request.setAttribute("path", "../");		
			RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}else {
			long num=Long.parseLong(request.getParameter("num"));
			BoardDTO boardDTO=new BoardDTO();
			boardDTO.setNum(num);
			boardDTO= qnaDAO.getOne(boardDTO);
			if(boardDTO==null) {
				request.setAttribute("msg", "잘못된 정보입니다");
				request.setAttribute("path", "../");		
				RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
				view.forward(request, response);
			}else {
				String writer=boardDTO.getWriter();
				String  id =memberDTO.getId();
				if(id.equals(writer)) {
					check=true;
				}else {
					request.setAttribute("msg", "작성자가아닙니다");
					request.setAttribute("path", "../");		
					RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
					view.forward(request, response);
				}
			}
		}
		return check;
	}
}
