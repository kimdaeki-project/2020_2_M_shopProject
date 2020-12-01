package com.project.shop.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.cart.CartDTO;
import com.project.shop.cart.CartService;
import com.project.shop.member.MemberDTO;
import com.project.shop.member.MemberService;
import com.project.shop.product.ProductDTO;
import com.project.shop.product.ProductService;
import com.project.shop.util.OrderPager;

@Controller
@RequestMapping(value = "/order/**")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductService ProductService;
	@Autowired
	private MemberService memberService;

	
	
	//환불
	@PostMapping("orderDelete")
	public ModelAndView setOrderDelete(OrderDTO orderDTO,HttpSession session)throws Exception{
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		orderDTO=orderService.getOrderOne(orderDTO);
		int result =memberService.setPointBuy(orderDTO);
		if(result>0) {
			memberDTO.setPoint(memberDTO.getPoint()+orderDTO.getPoint());
			result=orderService.setOrderDelete(orderDTO);
		}
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//주문상세페이지보기
	@GetMapping("orderSelect")
	public ModelAndView getSelect(OrderDTO orderDTO) throws Exception {
		orderDTO=orderService.getSelect(orderDTO);

		ModelAndView mv = new ModelAndView();
		mv.addObject("list", orderDTO);
		mv.setViewName("order/orderSelect");
		return mv;
	}
	
	//주문내역리스트보기
	@GetMapping("orderList")
	public ModelAndView getOrderList(OrderPager pager, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		pager.setMemberId(memberDTO.getId());
		List<OrderDTO> orderDTOs = orderService.getOrderList(pager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", orderDTOs);
		mv.addObject("pager", pager);
		
		mv.setViewName("order/orderList");
		return mv;
		
	}
	
	
	
	//장바구니에서 주문페이지로이동
	@PostMapping("cartOrderPage")
	public ModelAndView cartOrderPage(HttpServletRequest request,HttpSession session,OrderDTO orderDTO) throws Exception {
		//체크된 장바구니 번호만 담아서 가져와서 리스트로만들어서보냄
		String[]arr =request.getParameterValues("arr");	
		List<CartDTO> cartDTOs =orderService.getOrderList(arr);
		
		//주문자정보에 셋팅될 정보가져옴
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO=memberService.getIdCheck(memberDTO);	
		//배송지 목록에서 해당사용자의 리스트를가져옴
		orderDTO.setMemberId(memberDTO.getId());
		List<OrderDTO> orderDTOs=orderService.getOrderAddress(orderDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", cartDTOs);
		mv.addObject("userInfo", memberDTO);
		mv.addObject("addressList", orderDTOs);
		mv.setViewName("order/orderPage");
		return mv;
	}
	//상품페이지에서 바로 구매로 주문페이지로이동
	@PostMapping("directOrderPage")
	public ModelAndView directOrderPage(CartDTO cartDTO,HttpSession session,OrderDTO orderDTO) throws Exception {
		
		ProductDTO productDTO = new ProductDTO();
		//상품상세페이지에서 가져온 상품번호를 상품객체에 셋팅해서 모든정보를가져옴
		productDTO.setNum(cartDTO.getProductNum());
		productDTO=ProductService.getOne(productDTO);
		//카트dto에 상품번호와 수량 사이즈 색상이 담겨있음 여기에 가져온 상품정보를 세팅하여 매칭함
		cartDTO.setProductDTO(productDTO);
		List<CartDTO> cartDTOs = new ArrayList<CartDTO>();
		cartDTOs.add(cartDTO);
		//주문자정보에 셋팅될 정보가져옴
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO=memberService.getIdCheck(memberDTO);
		//사용자의 배송지목록가져옴
		orderDTO.setMemberId(memberDTO.getId());
		List<OrderDTO> orderDTOs=orderService.getOrderAddress(orderDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", cartDTOs);
		mv.addObject("userInfo", memberDTO);
		mv.addObject("addressList", orderDTOs);
		mv.setViewName("order/orderPage");
		return mv;
	}
	//결제후 주문테이블에 데이터 넣기
	@PostMapping("orderInsert")	
	public ModelAndView setInsert(@RequestParam(value = "color[]")String []color,@RequestParam(value = "sizing[]")String []sizing,
			@RequestParam(value = "productNum[]")long []productNum,@RequestParam(value = "amount[]")long []amount,
			@RequestParam(value = "price[]")long []price, @RequestParam(value = "cartNum[]")long []cartNum,OrderDTO orderDTO,HttpSession session
		)throws Exception{
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");	
			orderDTO.setMemberId(memberDTO.getId());		
			int result=orderService.setOrderInsert(orderDTO,productNum, price, amount, color, sizing,memberDTO,cartNum);
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("msg", result);
			mv.setViewName("common/ajaxResult");
			return mv;
			
	}
}
