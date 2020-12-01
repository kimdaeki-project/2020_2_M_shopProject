<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Footer -->   
   <footer>
      <div id="ft_left">
         <div class="ft_link">
            <ul class="ul_all">
                  <li class="ft_li"><a href="#">ABOUT</a></li>
                  <li class="ft_li"><a href="#">AGREEMENT</a></li>
                  <li class="ft_li"><a href="#">PRIVACY POLICY</a></li>
                  <li class="ft_li"><a href="#">GUIDE</a></li>
                  <li class="ft_li"><a class="info" href="#">사업자정보 확인</a></li>
               </ul>
         </div>
         <div class="ft_span">
            <span>COMPANY : 주식회사 데일리쥬</span>
            <span>OWNER : 정한빈,정연희</span>
            <span>TEL : 1661-0823</span>
            <span>BUSINESS NUMBER : 133-87-01483</span>
         </div>
         <div class="ft_span">
            <span>ADD : 02570 서울특별시 동대문구 제기동 1067 세우빌딩 4층</span>
            <span>MAIL ORDER LICENSE : 2019-서울동대문-1675<a href="#">[사업자정보확인]</a></span>
         </div>
         <div class="ft_span">
            <span>CHIEF PRIVACY OFFICER : 정한빈</span>
            <span>HOSTING BY 심플렉스인터넷(주)</span>
            <span>COPYRIGHT(C) 데일리쥬 ALL RIGHTS RESERVED</span>
         </div>
         <div class="ft_span">
            <span><a>DESIGNED BY SOMETHING</a></span>
         </div>
            <img alt="" src="${pageContext.request.contextPath}/resources/images/downbn.png">
         </div>
         
      <div id="ft_center">
         <p class="ft_c">COMMUNITY</p>
         <ul class="ul_all">
            <li class="ft_c_in"><a href="#">공지사항</a></li>
            <li class="ft_c_in"><a href="#">문의게시판</a></li>
            <li class="ft_c_in"><a href="#">구매후기</a></li>
            <li class="ft_c_in"><a href="#">이벤트</a></li>
            <li class="ft_c_in"><a href="#">배송조회</a></li>
         </ul>
      </div>
      
      <div id="ft_right">
         <ul class="ul_all sp">
            <li class="ft_c sp">CONTACT</li>
            <li class="ft_c_in sp">* 1661-0823</li>
            <li class="ft_c_in sp">MON-FRI am 11 - pm 17</li>
            <li class="ft_c_in sp">Break time pm 12 - pm 13</li>
            <li class="ft_c_in sp">SAT, SUN, HOLIDAY OFF</li>
         </ul>
         <div class="bank">
            <ul class="ul_all sp">
               <li class="ft_c sp">BANK INFO</li>
               <li class="ft_c_in sp">국민 033201-04-199729</li>
               <li class="ft_c_in sp">예금주 주식회사 데일리쥬</li>
            </ul>
         </div>
      </div>
      
      
   </footer>
   <script type="text/javascript">
	 $("#order").click(function(){
		 if(${not empty member}){
			 location.href="${pageContext.request.contextPath}/order/orderList";
		 }else{
			 alert("로그인후 이용가능합니다");
			 location.href="${pageContext.request.contextPath}/member/memberLogin";
		 }
	});
	
	$("#cart").click(function(){
		 if(${not empty member}){
			 location.href="${pageContext.request.contextPath}/cart/cartList";
		 }else{
			 alert("로그인후 이용가능합니다");
			 location.href="${pageContext.request.contextPath}/member/memberLogin";
		 }
	});
	
	$("#myPage").click(function(){
		 if(${not empty member}){
			 location.href="${pageContext.request.contextPath}/member/myPage";
		 }else{
			 alert("로그인후 이용가능합니다");
			 location.href="${pageContext.request.contextPath}/member/memberLogin";
		 }
	});
	$(".search-img").click(function(){
 		var search=$(".search-input").val();
 		location.href="${pageContext.request.contextPath}/product/productSearch?search="+search;
 	});
	 </script>