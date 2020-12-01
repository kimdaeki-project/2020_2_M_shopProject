<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link href="./resources/css/common/common.css" rel="stylesheet"
	type="text/css">
<link href="./resources/css/common/index.css" rel="stylesheet"
	type="text/css">
<link href="./resources/css/product/productList.css" rel="stylesheet"
	type="text/css">
<title>index</title>
<style type="text/css">
.new {
	width: 200px;
	height: 50px;
	margin: 100px auto;
	line-height: 50px;
	text-align: center;
	font-family: 'Nunito Sans', serif;
	color: #000;
	font-weight: normal;
	font-size: 15px;
}

* {
	font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic,
		sans-serif;
}


</style>
</head>
<body>

	<c:import url="./common/header.jsp"></c:import>


	<!-- Section -->
	<div id="nav_pa">
		<div id="nav">
			<a href="https://pf.kakao.com/_FxhtqC" target="_blank"><img
				class="nav_img" alt=""
				src="${pageContext.request.contextPath}/resources/images/kakaoic.png"
				width="50px"></a> <a href="https://talk.naver.com/ct/wc0vxm"
				target="_blank"><img class="nav_img" alt=""
				src="${pageContext.request.contextPath}/resources/images/talkic.png"
				width="50px"></a> <img id="page_up" class="nav_arrow" alt=""
				src="${pageContext.request.contextPath}/resources/images/upic.png">
			<img id="page_down" class="nav_arrow" alt=""
				src="${pageContext.request.contextPath}/resources/images/downic.png">
		</div>
	</div>

	<div id="section">

		<div id="slide">
			<div class="slider">
				<c:forEach items="${slideList}" var="dto">
					<div>
					<img alt=""
						src="${pageContext.request.contextPath}/resources/upload/slide/${dto.imgName}" style="width:1300px; height: 600px;">
				</div>
				</c:forEach>
				
				
			</div>
		</div>
		<div id="box">
			<div class="sc_box box_m">
				<p>Outer</p>
			</div>
			<div class="sc_box box_m">
				<p>Pants</p>
			</div>
			<div class="sc_box">
				<p>Knit</p>
			</div>
		</div>
		<div class="new">
			<span>NEW ARRIVAL</span>
		</div>



		<div class="productWrap">
			<ul>
				<c:forEach items="${newList}" var="dto">
					<li class="listWrap">
						<div class="hitwrap">[HIT : ${dto.hit}]</div>
						<div class="imgWrap">
							<a href="./product/productSelect?num=${dto.num}"><img alt=""
								src="./resources/upload/product/${dto.imgName}" class="img"></a>
						</div>
						<div class="productTitle">${dto.name}</div>
						<div class="price">
							<c:if test="${dto.sale>0}">
								<del>
									<strong>${dto.price}원</strong>
								</del>
							</c:if>
						</div>
						<div class="sale">${dto.finalPrice}원
							<c:if test="${dto.sale>0}">
								<span style="font-weight: bold;">${dto.sale}%할인중!</span>
							</c:if>
						</div>
						<div class="colorWrap">
							<div class="color" style="background-color: #5F72A3;"></div>
							<div class="color" style="background-color: #545454;"></div>
							<div class="color" style="background-color: #D7B170;"></div>
							<div class="color" style="background-color: #56754C;"></div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>


		<div class="new">
			<span>BEST ITEM</span>
		</div>
		
		<div class="productWrap">
			<ul>
				<c:forEach items="${bestList}" var="dto">
					<li class="listWrap">
						<div class="hitwrap">[HIT : ${dto.hit}]</div>
						<div class="imgWrap">
							<a href="./product/productSelect?num=${dto.num}"><img alt=""
								src="./resources/upload/product/${dto.imgName}" class="img"></a>
						</div>
						<div class="productTitle">${dto.name}</div>
						<div class="price">
							<c:if test="${dto.sale>0}">
								<del>
									<strong>${dto.price}원</strong>
								</del>
							</c:if>
						</div>
						<div class="sale">${dto.finalPrice}원
							<c:if test="${dto.sale>0}">
								<span style="font-weight: bold;">${dto.sale}%할인중!</span>
							</c:if>
						</div>
						<div class="colorWrap">
							<div class="color" style="background-color: #5F72A3;"></div>
							<div class="color" style="background-color: #545454;"></div>
							<div class="color" style="background-color: #D7B170;"></div>
							<div class="color" style="background-color: #56754C;"></div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>






	<c:import url="./common/footer.jsp"></c:import>


	<script src="./resources/js/common/common.js"> </script>
	
	
   
             
  
	

</body>
</html>