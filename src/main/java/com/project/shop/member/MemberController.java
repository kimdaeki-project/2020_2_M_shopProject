package com.project.shop.member;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.shop.board.BoardDTO;
import com.project.shop.board.qna.QnaDTO;
import com.project.shop.board.qna.QnaService;
import com.project.shop.order.OrderDTO;
import com.project.shop.order.OrderService;
import com.project.shop.review.ReviewDTO;
import com.project.shop.review.ReviewService;
import com.project.shop.util.Pager;
import com.project.shop.util.ReviewPager;



@Controller
@RequestMapping("/member/**")
public class MemberController {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private ReviewService reviewService;
	//memberReviewPage
	@GetMapping("memberReviewPage")
	public ModelAndView pageList(HttpSession session, ReviewPager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
	
		MemberDTO memberDTOs =(MemberDTO)session.getAttribute("member");
		pager.setMemberId(memberDTOs.getId());
		System.out.println(memberDTOs.getId());
		System.out.println(pager.getMemberId());
		List<ReviewDTO> ar =reviewService.pageList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager",pager);
		

		mv.setViewName("member/memberReviewPage");
		return mv;
	}
	
	
	@GetMapping("memberQna")
	public ModelAndView memberQna(HttpSession session, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		pager.setMemberId(memberDTO.getId());
		List<BoardDTO> ar = qnaService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("member/memberQna");
		return mv;
	}
	
	@PostMapping("memberAddressFixUpdate")
	public ModelAndView setMemberAddressFixUpdate(OrderDTO orderDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result=orderService.setOrderAddressFixUpdate(orderDTO);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("memberAddressUpdate")
	public ModelAndView setMemberAddressUpdate(OrderDTO orderDTO) throws Exception {
		orderDTO=orderService.getOrderAddressOne(orderDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", orderDTO);
		mv.setViewName("member/memberAddressUpdate");
		return mv;
	}
	
	@PostMapping("memberAddressUpdate")
	public ModelAndView setMemberAddressUpdate(OrderDTO orderDTO,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("member");
		orderDTO.setMemberId(memberDTO.getId());
		OrderDTO check= orderService.getOrderAddressCheck(orderDTO);
		int result=0;
		if(check!=null) {
			mv.addObject("msg", result);
			mv.setViewName("common/ajaxResult");
			return mv;
		}else {
			result=orderService.setOrderAddressUpdate(orderDTO);
			mv.addObject("msg", result);
			mv.setViewName("common/ajaxResult");
			return mv;
		}
		
	}
	
	@PostMapping("memberAddressInsert")
	public ModelAndView memberAddressInsert(OrderDTO orderDTO,HttpSession session) throws Exception {
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("member");
		orderDTO.setMemberId(memberDTO.getId());
		ModelAndView mv = new ModelAndView();
		
			OrderDTO check=orderService.getOrderAddressCheck(orderDTO);
			int result=0;
			if(check!=null) {
				mv.addObject("msg", result);
				mv.setViewName("common/ajaxResult");
				return mv;
			}else {
				result=orderService.setDestInsert(orderDTO);
				mv.addObject("msg", result);
				mv.setViewName("common/ajaxResult");
				return mv;
			}	
		
		
	}
	
	@GetMapping("memberAddressInsert")
	public ModelAndView memberAddressInsert2(OrderDTO orderDTO,HttpSession session) throws Exception {
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("member");
		orderDTO.setMemberId(memberDTO.getId());
		ModelAndView mv = new ModelAndView();
		List<OrderDTO> orderDTOs=orderService.getOrderAddress(orderDTO);
		if(orderDTOs.size()>=5) {
			mv.addObject("msg", "최대 5개까지만 등록가능합니다");
			mv.addObject("path", "./memberAddress");
			mv.setViewName("common/result");		
		}else {
			mv.setViewName("member/memberAddressInsert");
		}
		return mv;
	}
	
	//배송주소지 관리에서 지움
	@PostMapping("memberAddressDelete")
	public ModelAndView setOrderAddressDelete(OrderDTO orderDTO)throws Exception{
		int result=orderService.setOrderAddressDelete(orderDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("memberAddress")
	public void memberAddress() {
		
	}
	
	
	@PostMapping("memberAddress")
	public ModelAndView memberAddress(HttpSession session,OrderDTO orderDTO) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		orderDTO.setMemberId(memberDTO.getId());		
		List<OrderDTO> orderDTOs = orderService.getOrderAddress(orderDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("count", orderDTOs.size());
		mv.addObject("list", orderDTOs);
		mv.setViewName("member/memberAddressAjax");
		return mv;
	}
	
	//아이디찾기결과
	@PostMapping("memberIdResult")
	public void memberIdResult(String resultName, String resultEmail, String resultId){
		
	}
	//비밀번호 찾기 폼이동
	@GetMapping("memberPwFind")
	public void memberPwFind() {
		
	}
	//아이디찾기 폼이동
	@GetMapping("memberIdFind")
	public void memberIdFind() {
		
	}
	//이메일과 이름,아이디가있는지검증
	@PostMapping("memberPwFind")
	public ModelAndView memberPwFind(MemberDTO memberDTO) throws Exception{
		memberDTO=memberService.getPwFind(memberDTO);
		ModelAndView mv = new ModelAndView();
		int result=0;
		//일치하는 계정이 있으면 아이디 보내줌
		if(memberDTO!=null) {		
			char upper =(char)((Math.random() * 26) + 65);
			char lower =(char) ((Math.random() * 26) + 97);
			Random r = new Random();
	        int dice = r.nextInt(4589362) + 49311;
	        String newPw= String.valueOf(upper)+String.valueOf(lower)+dice;
			String setfrom = "dlgkstjq623@gamil.com";
	         // 받는 사람 이메일
	         String title = "비밀번호찾기 이메일 입니다."; // 제목
	         String email=memberDTO.getEmail();
	         
	         String content =
	         
	         System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	         
	         System.getProperty("line.separator")+
	                 
	         "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	         
	         +System.getProperty("line.separator")+
	         
	         System.getProperty("line.separator")+
	 
	         " 비밀번호는 " +newPw+ " 입니다. "
	         
	         +System.getProperty("line.separator")+
	         
	         System.getProperty("line.separator")+
	         
	         "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
	         
	         
	         try {
	             MimeMessage message = mailSender.createMimeMessage();
	             MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                     true, "UTF-8");

	             messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	             messageHelper.setTo(email); // 받는사람 이메일
	             messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	             messageHelper.setText(content); // 메일 내용
	             
	            mailSender.send(message);
	            memberDTO.setPw(newPw);
	            memberService.setMemberUpdate(memberDTO);
	            result=1;
	         } catch (Exception e) {
	             System.out.println(e);
	         }
		}
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		 return mv;
	}
	
	//이메일과 이름이 있는지 검증
	@PostMapping("memberIdFind")
	public ModelAndView memberIdFind(MemberDTO memberDTO) throws Exception{
		memberDTO=memberService.getIdFind(memberDTO);
		ModelAndView mv = new ModelAndView();
		String result="";
		if(memberDTO!=null) {
			result=memberDTO.getId();
		}
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		 return mv;
	}
	//멤버 페이지 이동
	@GetMapping("myPage")
	public ModelAndView getMemberPage(MemberPageDTO memberPageDTO ,HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		memberPageDTO.setMemberId(memberDTO.getId());
		memberPageDTO=memberService.getMyPage(memberPageDTO);
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("dto", memberPageDTO);
		  mv.setViewName("member/myPage");
		  return mv;
	}
	
	//회원탈퇴
	@PostMapping("memberDelete")
	public ModelAndView setMemberDelete(MemberDTO memberDTO,HttpSession session) throws Exception{
		  int result = memberService.setMemberDelete(memberDTO);
		  int message=0;
		  if(result>0) {
			  message=1;
			  session.invalidate();
		  }
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("msg", message);
		  mv.setViewName("common/ajaxResult");
		  return mv;
	}
	//회원 정보폼가져오기
	@GetMapping("memberInfo")
	public ModelAndView setMemberInfo(HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO=memberService.getIdCheck(memberDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("info", memberDTO);
		mv.setViewName("member/memberInfo");
		
		return mv;
	}
	//회원정보 변경
	@PostMapping("memberInfo")
	public ModelAndView setMemberInfo(MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		int result= memberService.setMemberUpdate(memberDTO);
		String message="수정 실패";
		if(result>0) {
			message="수정 성공";
		}
		mv.addObject("msg", message);
		mv.addObject("path", "./memberInfo");
		mv.setViewName("common/result");
		return mv;
	}
	//로그아웃
	@GetMapping("memberLogout")
	public ModelAndView getMemberLogout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.addObject("msg", "로그아웃 성공!");
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	//로그인
	@GetMapping("memberLogin")
	public void getMemberLogin() {
		
	}
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO,HttpSession session,String remember,HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO= memberService.getMemberLogin(memberDTO);
		if(memberDTO!=null) {
			if(remember!=null) {
				Cookie cookie = new Cookie("remember", memberDTO.getId());
				//cookie.setDomain("/cookie/showCookie");
				cookie.setMaxAge(86400);
				response.addCookie(cookie);
			}else {
				Cookie cookie = new Cookie("remember", "");
				
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			session.setAttribute("member", memberDTO);
			mv.setViewName("redirect:../");
		}else {
			mv.addObject("msg", "로그인 실패!");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");
		}
		return mv;
		
		
	}
	
	
	//회원가입 폼이동
	@GetMapping("memberJoin")	
	public void setInsert(){
		
	}
	//회원가입
	@PostMapping("memberJoin")
	public ModelAndView setInsert(MemberDTO memberDTO) throws Exception {

		ModelAndView mv = new ModelAndView();
		int result=memberService.setInsert(memberDTO);
		String message="회원가입 실패!";
		if(result>0) {
			message="회원가입 성공!";
		}
		 mv.addObject("msg", message);
		 mv.addObject("path", "../");
		 mv.setViewName("common/result");
		 return mv;
	}
	
	//회원가입에서 중복된 아이디가있는지 검사
	@PostMapping("memberIdCheck")
	public ModelAndView getIdCheck(MemberDTO memberDTO) throws Exception{
		System.out.println("hello");
		ModelAndView mv = new ModelAndView();
		memberDTO=memberService.getIdCheck(memberDTO);
		int message=0;
		if(memberDTO==null) {
			message=1;
		}
		 mv.addObject("msg", message);
		 mv.setViewName("common/ajaxResult");
		 return mv;
		
	}
	//메일인증
	@PostMapping("memberMailCheck")
	public ModelAndView memberMailCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		 Random r = new Random();
         int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
         
         String setfrom = "dlgkstjq623@gamil.com";
         // 받는 사람 이메일
         String title = "인증 이메일 입니다."; // 제목
         String email=request.getParameter("email");
        
         String content =
         
         System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
         
         System.getProperty("line.separator")+
                 
         "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
         
         +System.getProperty("line.separator")+
         
         System.getProperty("line.separator")+
 
         " 인증번호는 " +dice+ " 입니다. "
         
         +System.getProperty("line.separator")+
         
         System.getProperty("line.separator")+
         
         "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
         
         
         try {
             MimeMessage message = mailSender.createMimeMessage();
             MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                     true, "UTF-8");

             messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
             messageHelper.setTo(email); // 받는사람 이메일
             messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
             messageHelper.setText(content); // 메일 내용
             
             mailSender.send(message);
         } catch (Exception e) {
             System.out.println(e);
         }
         
         mv.addObject("msg", dice);
         mv.setViewName("common/ajaxResult");
         return mv;
	}
}
