package com.project.shop.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.member.MemberDTO;

@Controller
@RequestMapping(value = "/cart/**")
public class CartController {
	@Autowired
	private CartService cartService;
	
	//장바구니 모두비우기
	
	@PostMapping("cartAllDelete")
	public ModelAndView setAllDelete(CartDTO cartDTO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO= (MemberDTO) session.getAttribute("member");
		cartDTO.setMemberId(memberDTO.getId());
		int result=cartService.setAllDelete(cartDTO);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	//장바구니에서 수량변경
	@PostMapping("cartUpdate")
	public ModelAndView setUpdate(CartDTO cartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartService.setUpdate(cartDTO);
		String message="변경하지 못했습니다";
		if(result>0) {
			message="변경되었습니다";
		}
		mv.addObject("msg", message);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//장바구니에서 장바구니 삭제
	@PostMapping("cartDelete")
	public ModelAndView setDelete(CartDTO cartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartService.setDelete(cartDTO);
		String message="장바구니에서 삭제실패하였습니다";
		if(result>0) {
			message="장바구니에서 삭제하였습니다";
		}
		mv.addObject("msg", message);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//장바구니 페이지
	@GetMapping("cartList")
	public void getList() {
		
	}
	//장바구니 리스트
	@PostMapping("cartList")
	public ModelAndView getList(CartDTO cartDTO, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO= (MemberDTO) session.getAttribute("member");
		cartDTO.setMemberId(memberDTO.getId());
		
		List<CartDTO> cartDTOs =cartService.getList(cartDTO);
		long total =0;
		for(int i=0;i<cartDTOs.size();i++) {
			total+=cartDTOs.get(i).getTotalPrice();
		}
		mv.addObject("total", total);
		mv.addObject("list", cartDTOs);	
		mv.setViewName("cart/cartAjaxResult");
		return mv;
	}
	
	
	//장바구니에 추가
	@PostMapping("cartInsert")
	public ModelAndView setInsert(CartDTO cartDTO,HttpSession session) throws Exception {
		MemberDTO memberDTO= (MemberDTO) session.getAttribute("member");
		cartDTO.setMemberId(memberDTO.getId());
	
		int result =cartService.setInsert(cartDTO);
	
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", result);		
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	//장바구니에 추가버튼을 눌렸을때 해당상품이 이미 장바구니에담겨져있는지 확인함
	@PostMapping("cartCheck")
	public ModelAndView getCheck(CartDTO cartDTO,HttpSession session) throws Exception{
		MemberDTO memberDTO= (MemberDTO) session.getAttribute("member");
		cartDTO.setMemberId(memberDTO.getId());
		cartDTO=cartService.getCheck(cartDTO);
		int result=0;
		if(cartDTO!=null) {
			result=1;
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	//장바구니에 이미있다고 알림창을 띄운후에 추가하겠다고하면 제품의 수량만큼 업데이트함
	@PostMapping("cartAmountUpdate")
	public ModelAndView setAmountUpdate(CartDTO cartDTO,HttpSession session)throws Exception {
		MemberDTO memberDTO= (MemberDTO) session.getAttribute("member");
		
		
		cartDTO.setMemberId(memberDTO.getId());
		int result=cartService.setAmountUpdate(cartDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
}
