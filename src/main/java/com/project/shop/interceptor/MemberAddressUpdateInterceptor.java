package com.project.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.shop.member.MemberDTO;
import com.project.shop.order.OrderDAO;
import com.project.shop.order.OrderDTO;

@Component
public class MemberAddressUpdateInterceptor extends  HandlerInterceptorAdapter {

	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mv) throws Exception {
		String method =request.getMethod();
		if(method.equals("POST")) {
			return ;
		}
		HttpSession session= request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String id = memberDTO.getId();
		OrderDTO orderDTO=(OrderDTO) mv.getModel().get("dto");
		if(orderDTO==null) {
			mv.addObject("msg", "잘못된정보입니다");
			mv.addObject("path", "./memberAddress");
			mv.setViewName("common/result");
		}else {
			String writer = orderDTO.getMemberId();
			if(!id.equals(writer)) {
				mv.addObject("msg", "작성자가 아닙니다");
				mv.addObject("path", "./memberAddress");
				mv.setViewName("common/result");
			}
		}
	}
}
