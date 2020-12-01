<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Header -->
   <header>
         <div id="header_up">
         	<div class="search-hover">
            <div class="search-best">
               BEST KEYWORD : <a href="#">데일리룩</a>  / <a href="#">블라우스</a>  / <a href="#">셔츠</a>  / <a href="#">원피스</a>  / <a href="#">베스트</a>
            </div>
            <form class="search-form-in" action="">
               <input class="search-input" type="text">
               <img class="search-img" alt="" src="${pageContext.request.contextPath}/resources/images/glasses.png" width="25">
            </form>
         </div>
            <ul class="ul ul_all">
            	<c:if test="${member.auth eq 1}">
            	<li class="li li_r"><a class="hover" href="${pageContext.request.contextPath}/admin/adminPage">ADMIN</a></li>
            	</c:if>
            	<c:choose>
            		<c:when test="${not empty member}">
            			<li class="li li_r"><a class="hover" href="${pageContext.request.contextPath}/member/memberInfo">MY INFO</a></li>
            			<li class="li li_r"><a class="hover" href="${pageContext.request.contextPath}/member/memberLogout">LOGOUT</a></li>
            		
            			
            		</c:when>
            		<c:otherwise>
            			 <li class="li li_r"><a class="hover" href="${pageContext.request.contextPath}/member/memberLogin">LOGIN</a></li>
              			 <li class="li li_r"><a class="hover" href="${pageContext.request.contextPath}/member/memberJoin">JOIN+2,000P</a></li>
            		</c:otherwise>
            	</c:choose>
            				<li class="li li_r"><a class="hover tag"  id="cart">CART</a></li>           
               			<li class="li li_r"><a class="hover tag" id="order">ORDER</a></li>
               			<c:if test="${member.auth!=1}">
               			<li class="li li_r"><a class="hover tag"  id="myPage">MY PAGE</a></li>
               			</c:if>
               			
               
               <li class="li li_r"><a class="hover" href="#"><img src="${pageContext.request.contextPath}/resources/images/glass.png" class="search-img-hover"></a></li>
            </ul>
         </div>
         
         <div id="header_po" class="fxMenu">
            <div id="header_logo" class="logo">
               <div id="logo"><a href="${pageContext.request.contextPath}">DAILYJOU</a></div>
            </div>
         
            <div id="header_menu">
               <div id="menu_1">
                  <ul>
                     <li class="li_all"><a class="hover1" href="#">NEW</a></li>
                     <li class="li_all"><a class="hover1" href="#">BEST30</a></li>
                     <li class="li_all sub_hover"><a class="hover1" href="#">당일발송</a>
                        <ul class="sub_menu">
                           <li><a class="sub_a" href="#">Outer</a></li>
                           <li><a class="sub_a" href="#">Top</a></li>
                           <li><a class="sub_a" href="#">Bottom</a></li>
                           <li><a class="sub_a" href="#">Ops</a></li>
                           <li><a class="sub_a" href="#">Acc</a></li>
                        </ul> 
                     </li>
                     <li class="li_all sub_hover"><a class="hover1 sub_hover" href="#">F/W KNIT</a>
                        <ul class="sub_menu m">
                           <li><a class="sub_a" href="#">니트 가디건</a></li>
                           <li><a class="sub_a" href="#">긴팔니트</a></li>
                           <li><a class="sub_a" href="#">반팔니트</a></li>
                           <li><a class="sub_a" href="#">니트조끼</a></li>
                        </ul>
                     </li>
                     <li class="li_all"><a class="hover1" href="#">MADE</a></li>
                     <li class="li_all"><a class="hover1" href="#">UNISEX</a></li>
                     <li class="li_all sub_hover"><a class="hover1 sub_hover" href="${pageContext.request.contextPath}/product/productList?pCode=3">OUTER</a>
                        <ul class="sub_menu m">
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=3&cCode=31">CARDIGAN</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=3&cCode=32">JUMPER</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=3&cCode=33">COAT</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=3&cCode=34">JACKET</a></li>
                        </ul> 
                     </li>
                     <li class="li_all sub_hover"><a class="hover1 sub_hover" href="${pageContext.request.contextPath}/product/productList?pCode=2">PANTS</a>
                        <ul class="sub_menu m">
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=2&cCode=21">슬림&일자</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=2&cCode=22">와이드</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=2&cCode=23">슬랙스</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=2&cCode=24">반바지</a></li>
                        </ul>
                     </li>
                     <li class="li_all sub_hover"><a class="hover1 sub_hover" href="${pageContext.request.contextPath}/product/productList?pCode=1">TOP</a>
                        <ul class="sub_menu top">
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=1&cCode=11">KNIT</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=1&cCode=12">TEE</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=1&cCode=13">맨투맨&후드</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=1&cCode=14">BLOUSE</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=1&cCode=15">SHIRT</a></li>
                        </ul>
                     </li>
                     <li class="li_all le_1 sub_hover"><a class="hover1 sub_hover" href="${pageContext.request.contextPath}/product/productList?pCode=4">DRESS&SKIRT</a>
                        <ul class="sub_menu s">
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=4&cCode=41">SKIRT</a></li>
                           <li><a class="sub_a" href="${pageContext.request.contextPath}/product/productList?pCode=4&cCode=42">DRESS</a></li>
                        </ul>
                     </li>
                     <li class="li_all le_2 sub_hover" ><a class="hover1 sub_hover" href="#">ACC</a>
                        <ul class="sub_menu">
                           <li><a class="sub_a" href="#">Shoes</a></li>
                           <li><a class="sub_a" href="#">Bag</a></li>
                           <li><a class="sub_a" href="#">Jewelry</a></li>
                           <li><a class="sub_a" href="#">Point item</a></li>
                           <li><a class="sub_a" href="#">Shirt</a></li>
                        </ul>
                     </li>
                  </ul>
               </div>
            
               <div id="menu_2">
                  <ul>
                     <li class="li_r"><a class="hover1" href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
                     <li class="li_r"><a class="hover1"href="${pageContext.request.contextPath}/qna/qnaList">문의게시판</a></li>
                     <li class="li_r"><a class="hover1" href="#">리뷰게시판</a></li>
                     <li class="li_r"><a class="hover1" href="#">포토리뷰</a></li>
                     <li class="li_r"><a class="hover1" href="https://www.cjlogistics.com/ko/tool/parcel/tracking#none" target="_blank">배송조회</a></li>
                  </ul>
               </div>
            </div>
         </div>
   </header>
   
   