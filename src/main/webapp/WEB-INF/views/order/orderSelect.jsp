<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/bootStrap.jsp"></c:import>
<style type="text/css">
.orderwrap {
	margin-top: 100px;
	width: 850px;

		
}

.ordertable {
	width: 800px;
	border: 1px solid #757575;
	margin: 20px 0 30px;
	
}

.tr {
	width: 800px;
	height: 30px;
	text-align: center;
	line-height: 30px;
}

.headtd {
	width: 100px;
	height: 30px;
	background-color: #EDEDED;
}

.sectiontd {
	width: 300px;
	height: 30px;
	
}

.imginfo {
	width: 100px;
	height: 30px;
}

.proinfo {
	width: 400px;
	height: 30px;
}

.amountinfo {
	width: 100px;
	height: 30px;
}

.priceinfo {
	width: 100px;
	height: 30px;
}
.reviewinfo {
	width: 100px;
	height: 30px;
}
.img {
	text-align: center;
	width: 100px;
	height: 70px;
}

.pro {
	width: 400px;
	height: 70px;
}

.amount {
	width: 100px;
	height: 70px;
}

.price {
	width: 100px;
	height: 70px;
}

.infop {
	margin-left: 10px;
}

.wrap {
	font-size: 12px;
	color: #757575;
	font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic,
		sans-serif;
		margin-left: 20px;
		margin-top: 30px;
		font-weight: bold;
}
.reviewbtn{
		background-color: #6e6e6e;
		color: #ffffff;
		border: none;
		width: 80px;
		height: 30px;
}

</style>
</head>
<body>
		
	<div class="wrap">
		<p style="color: #3D77BD;  font-size: 12px; font-weight: bold;">주문정보</p>

		<table class="ordertable" border="1">
			<tr class="tr">
				<td class="headtd">주문번호</td>
				<td class="sectiontd">${list.num}</td>
				<td class="headtd">주문일자</td>
				<td class="sectiontd">${list.regdate}</td>

			</tr>
			<tr class="tr">
				<td class="headtd">주문자</td>
				<td class="sectiontd">${list.memberId}</td>
				<td class="headtd">주문처리현황</td>
				<td class="sectiontd">${list.status}		
				</td>
			</tr>
		</table>
		<p style="color: #3D77BD; font-size: 12px; font-weight: bold;">배송정보</p>
		<table class="ordertable" border="1">
			<tr class="tr">
				<td class="headtd">수취인</td>
				<td class="sectiontd">${list.takePerson}</td>
				<td class="headtd">연락처</td>
				<td class="sectiontd">${list.takePhone}</td>

			</tr>
			<tr class="tr">
				<td class="headtd">주소</td>
				<td colspan="3">${list.takeAddr1}: ${list.takeAddr2}
					${list.takeAddr3}</td>

			</tr>
		</table>
		<p style="color: #3D77BD;  font-size: 12px; font-weight: bold;">상품정보</p>
		<table class="ordertable" border="1">
			<tr class="tr" style="background-color: #EDEDED;">
				<td class="imginfo">상품이미지</td>
				<td class="proinfo">상품정보</td>
				<td class="amountinfo">수량</td>
				<td class="priceinfo">가격</td>
				<td class="reviewinfo">후기작성</td>
			</tr>

			<c:forEach items="${list.orderDetailDTOs}" var="dto">
				<tr>
					<td class="img"><img alt=""
						src="../resources/upload/product/${dto.productDTO.imgName}"
						style="width: 100px; height: 70px;"></td>
					<td class="pro">
						<p class="infop">${dto.productDTO.name}</p>
						<p class="infop">옵션[색상 : ${dto.color} 사이즈: ${dto.sizing}]</p>
					</td>
					<td class="amount" style="text-align: center">${dto.amount}개</td>
					<td class="price" style="text-align: center">${dto.price}원</td>
					<td class="price" style="text-align: center"><button class="reviewbtn" id="${dto.productNum}">후기작성</button> </td>
				</tr>
			</c:forEach>
			<tr class="tr" style="background-color: #EDEDED; text-align: right; font-size: 14px; padding-right: 10px;"> 
				<td colspan="5">총 결제 금액 : <span style="margin-right: 10px; font-weight: bold;">${list.totalPrice}원</span></td>
			</tr>
			<tr class="tr" style="background-color: #EDEDED; text-align: right; font-size: 14px; padding-right: 10px;"> 
				<td colspan="5">적립금 사용 : <span style="margin-right: 10px; font-weight: bold;">${list.point}P</span></td>
			</tr>
		</table>
		
	
	</div>
	<script type="text/javascript">
		$(".reviewbtn").click(function(){
			var num= $(this).attr("id");
			location.href="../product/productSelect?num="+num;
		});
		
	
	</script>
	
</body>
</html>