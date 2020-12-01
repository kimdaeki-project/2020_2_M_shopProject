package com.project.shop.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.shop.member.MemberDTO;
import com.project.shop.review.ReplyDAO;
import com.project.shop.review.ReplyDTO;

@Component
public class ReplyDeleteInterceptor extends  HandlerInterceptorAdapter{

	@Autowired
	private ReplyDAO replyDAO;
	
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
			long replyNum=Long.parseLong(request.getParameter("replyNum"));
			ReplyDTO  replyDTO = new ReplyDTO();
			replyDTO.setReplyNum(replyNum);
			replyDTO=replyDAO.getOne(replyDTO);
			if(replyDTO==null) {
				request.setAttribute("msg", "잘못된 정보입니다");
				request.setAttribute("path", "../");		
				RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
				view.forward(request, response);
			}else {
				String reWriter=replyDTO.getReWriter();
				String id =memberDTO.getId();
				if(id.equals(reWriter)) {
					check =true;
				}else {
					request.setAttribute("msg", "작성자가아닙니다");
					request.setAttribute("path", "../");		
					RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
					view.forward(request, response);
				}
			}
		}
		return super.preHandle(request, response, handler);
	}
}
