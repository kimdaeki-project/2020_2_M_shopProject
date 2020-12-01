package com.project.shop.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.member.MemberDTO;
import com.project.shop.member.MemberService;
import com.project.shop.order.OrderDTO;
import com.project.shop.order.OrderService;
import com.project.shop.util.OrderPager;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	@PostMapping("slideSeqUpdate")
	public ModelAndView setSlideSeqUpdate(@RequestParam(value = "seqs[]")String []seqs,@RequestParam(value = "nums[]")String []nums) throws Exception {
		
		int result=adminService.setSlideSeqUpdate(seqs, nums);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("slideDelete")
	public ModelAndView setSlideDelete(Top5DTO top5dto,HttpSession httpSession)throws Exception{
		int result = adminService.setSlideDelete(top5dto, httpSession);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("slideInsert")
	public ModelAndView slideInsert(Top5DTO top5dto, MultipartFile mainImg,HttpSession httpSession) throws Exception {
		System.out.println("gd");
		int result=adminService.setSlideInsert(top5dto,mainImg,httpSession);
		String message="등록 실패";
		if(result>0) {
			message="등록 성공";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", message);
		mv.addObject("path", "./adminSlide");
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("adminSlide")
	public void adminSlide() throws Exception {
		
	}
	
	@PostMapping("adminSlide")
	public ModelAndView getAdminSlideList() throws Exception {
		List<Top5DTO> top5dtos=adminService.getSlideList();
		int count =top5dtos.size();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", top5dtos);
		mv.addObject("count", count);
		mv.setViewName("admin/adminSlideAjaxResult");
		return mv;
	}
	
	//문자전송
	@PostMapping("smsSend")
	public ModelAndView smsSemd(String phone, String text) {
			
		ModelAndView mv = new ModelAndView();
			String api_key = "NCSFQBS0EJAVMATT";
		    String api_secret = "4A1AZXI8FH80H4PDTL2MKOHWOSTZJSZQ";
		    Message coolsms = new Message(api_key, api_secret);
		    int result=0;
		 // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phone);
		    params.put("from", "발신번호");
		    params.put("type", "SMS");
		    params.put("text", text);
		    params.put("app_version", "test app 1.2"); // application name and version
		    
		    try {
		        JSONObject obj = (JSONObject) coolsms.send(params);
		        System.out.println(obj.toString());
		        if (obj !=null) {
					result=1;
				}
		        
		      } catch (CoolsmsException e) {
		        System.out.println(e.getMessage());
		        System.out.println(e.getCode());
		      }
				mv.addObject("msg", result);
				mv.setViewName("common/ajaxResult");
			    return mv;
			
	}
	//문자보내기폼으로이동
	@GetMapping("smsSend")
	public void smsSend() {
		
	}
	
	//회원관리
	@GetMapping("adminMember")
	public ModelAndView getMemberList(OrderPager pager)throws Exception {
		List<MemberDTO> memberDTOs = adminService.getMemberList(pager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", memberDTOs);
		mv.addObject("pager", pager);
		mv.setViewName("admin/adminMember");
		return mv;
	}
	
	@PostMapping("orderStatusUpdate")
	public ModelAndView setorderStatusUpdate(OrderDTO orderDTO)throws Exception{
		
		int result = orderService.setOrderStatusUpdate(orderDTO);
		if(orderDTO.getStatus().equals("구매확정")) {
			orderDTO=orderService.getOrderOne(orderDTO);
			orderDTO.setPoint(orderDTO.getTotalPrice()/10);
			
			result=memberService.setPointBuy(orderDTO);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	
	@GetMapping("adminPage")
	public void getAdminPage() throws Exception{
				
	}
	@GetMapping("adminProduct")
	public void getAdminProduct() throws Exception{
		
	}
	@PostMapping("adminProduct")
	public ModelAndView getAdminProduct(Top5DTO top5dto) throws Exception{
		List<Top5DTO> top5dtos = adminService.getTop5List(top5dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", top5dtos);
		mv.setViewName("admin/adminProductajax");
		return mv;
		
	}
	
	@GetMapping("adminOrder")
	public void getOrderList() {
		
	}
	
	@PostMapping("adminOrder")
	public ModelAndView getOrderList(OrderPager pager) throws Exception {
		
		List<OrderDTO> orderDTOs= orderService.getOrderList(pager);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", orderDTOs);
		mv.addObject("pager", pager);
		mv.setViewName("admin/adminOrderAjax");
		return mv;
	}
	@GetMapping("adminToday")
	public ModelAndView getTodayInfo(Top5DTO top5dto) throws Exception {
		Top5DTO todayInfo = adminService.getTodayInfo();
		Top5DTO todayDate =adminService.getTodayDate();
		List<Top5DTO> top5dtos = adminService.getDayTotal(top5dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("todayInfo", todayInfo);
		mv.addObject("todayDate", todayDate);
		mv.addObject("list", top5dtos);
		mv.setViewName("admin/adminToday");
		return mv;
	}
}
