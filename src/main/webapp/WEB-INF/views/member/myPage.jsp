<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/common/common.css">
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Cabin&display=swap');
   *{margin:0; padding:0; font-family: 'Cabin', sans-serif, 'Arial', 'Nanum Gothic', '돋움' , sans-serif; list-style: none;}
   
   #section{
      width: 1300px;
      height: 700px;
      margin: 0 auto;
   }
   .my-page{
      width: 1150px;
      height: 600px;
      margin: 60px auto;
   }
   .my-shop-sub{
      width: 1140px;
      height: 150px;
      margin: 0 auto;
      border: 1px solid #e8e8e8;
      font-size: 12px;
   }
   .my-shop-main{
      width: 1132px;
      height: 380px;
      margin: 40px auto;
   }
   .my{
      width: 565px;
      height: 151px;
      float: left;
      margin: 0 0 0 3px;
   }
   .my-li{
      margin: 25px 0 0 20px;
      color: #686868;
   }
   .sub-strong{
      margin: 0 8px 0 0;
   }
   .sub-info{
      float: right;
      margin-right: 68px;
   }
   .line{
      border-right: 1px solid #e8e8e8;
      margin-left: 5px;   
   }
   .info-bt{
      margin-right: 30px;
   }
   .check{
      border: 2px solid #989898;
      width: 50px;
      height: 50px;
      margin: 0 0 0 10px;
      color: #7c7c7c;
      cursor: pointer;
   }
   .box{
      width: 265px;
      height: 160px;
      border: 1px solid #e8e8e8;
      margin: 0 0 20px 0;
      float: left;
      text-align: center;
   }
   .box-m{
      margin: 0 0 0 22px;
   }
   .box-m2{
      margin: 0 20px 0 22px;
   }
   .my-img{
      display: block;
      margin: 30px auto 25px;
   }
   .my-sel{
      font-size: 13px;
      text-decoration: none;
      color: #646464;
   }
   .my-sel:hover{
      color: #a1a1a1;
   }
   .board > img{
      margin-top: 17px;
   }
   .wish > img{
      margin-top: 20px;
   }
   .coupon > img{
      margin-top: 35px;
      margin-bottom: 30px;
   }
   .order > img{
      margin: 25px auto 20px;
   }
   .mileage > img, .deposit > img{
      margin: 25px auto 25px;
   }
   
</style>
<title>List</title>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
   <!-- Section -->
   
   <div id="section">
      <div class="my-page">
         <div class="my-shop-sub">
            <div class="my line">
               <ul>
                 
                  <li class="my-li">
                     <strong class="sub-strong">></strong>
                     가용적립금
                     <strong class="sub-info ">${member.point}P</strong>
                  </li>
                  <li class="my-li">
                     <strong class="sub-strong">></strong>
                     쿠폰
                     <strong class="sub-info ">0원</strong>
                  </li>
               </ul>
            </div>
            <div class="my">
               <ul>
                  <li class="my-li">
                     <strong class="sub-strong">></strong>
                     사용적립금
                     <strong class="sub-info">${dto.totalPoint}P</strong>
                  </li>
                  <li class="my-li"><strong class="sub-strong">></strong>총주문<strong class="sub-info">${dto.totalPrice}원(${dto.totalCount}회)</strong></li>
               </ul>
            </div>
         </div>
         <div class="my-shop-main">
            <div class="box order">
               <img class="my-img" alt="" src="${pageContext.request.contextPath}/resources/images/myPage/order.png" width="55px">
               <a class="my-sel" href="../order/orderList">ORDER<br>주문내역 조회</a>
            </div>
            <div class="box box-m profile">
               <img class="my-img" alt="" src="${pageContext.request.contextPath}/resources/images/myPage/profile.png" width="60px">
               <a class="my-sel" href="./memberInfo">PROFILE<br>회원정보</a>
            </div>
            <div class="box box-m box-m2 address">
               <img class="my-img" alt="" src="${pageContext.request.contextPath}/resources/images/myPage/address.png" width="100px">
               <a class="my-sel" href="./memberAddress">ADDRESS<br>배송 주소록 관리</a>
            </div>
            <div class="box board">
               <img class="my-img" alt="" src="${pageContext.request.contextPath}/resources/images/myPage/board.png" width="45px">
               <a class="my-sel" href="./memberQna">QNA<br>문의게시글 관리</a>
            </div>
            <div class="box board">
               <img class="my-img" alt="" src="${pageContext.request.contextPath}/resources/images/myPage/board.png" width="45px">
               <a class="my-sel" href="./memberReviewPage">REVIEW<br>리뷰게시글 관리</a>
            </div>
            <div class="box box-m mileage">
               <img class="my-img" alt="" src="${pageContext.request.contextPath}/resources/images/myPage/mileage.png" width="70px">
               <a class="my-sel" href="#">MILEAGE<br>적립금</a>
            </div>
            <div class="box box-m box-m2 deposit">
               <img class="my-img" alt="" src="${pageContext.request.contextPath}/resources/images/myPage/deposit.png" width="50px">
               <a class="my-sel" href="#">DEPOSITS<br>예치금</a>
            </div>
            <div class="box coupon">
               <img class="my-img" alt="" src="${pageContext.request.contextPath}/resources/images/myPage/coupon.png" width="60px">
               <a class="my-sel" href="#">COUPON<br>쿠폰</a>
            </div>
         </div>
      </div>
   </div>
   <c:import url="../common/footer.jsp"></c:import>
</body>
</html>