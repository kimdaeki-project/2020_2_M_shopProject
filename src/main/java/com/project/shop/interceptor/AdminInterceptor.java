package com.project.shop.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.shop.member.MemberDTO;
@Component
public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("member");	
		boolean check =false;
		
		if(memberDTO!=null&&memberDTO.getAuth()==1) {
			check=true;
		}else {
			request.setAttribute("msg", "권한이 없습니다");
			request.setAttribute("path", "../");
			
			RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		return check;
	}
}
