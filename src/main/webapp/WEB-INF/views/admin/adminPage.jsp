<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<c:import url="../common/bootStrap.jsp"></c:import>



<link rel="stylesheet" href="../resources/css/common/common.css">

<title>Insert title here</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	font-family: 'Arial', 'Nanum Gothic', sans-serif;
	list-style: none;
}

/* Section Nav*/
#section {
	width: 1300px;
	height: 700px;
	margin: 0 auto;
}

.admin-side {
	width: 1300px;
	height: 700px;
	margin: 0 auto;
}

.side-l {
	width: 120px;
	height: 700px;
	background-color: rgba(212, 212, 212, 0.5);
	float: left;
}

.side-r {
	width: 1180px;
	height: 700px;
	float: left;
	border: none;
	framespacing: 0;
	marginheight: 0;
	marginwidth: 0;
	scrolling: no;
	vspace: 0;
}

.a-side-li {
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #f7f7f7;
}

.list-a {
	margin: 0 0 0 20px;
	text-decoration: none;
	color: #646464;
}
</style>

</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
	<!-- Section -->

	<div id="section">
		<div class="admin-side">
			<div class="side-l">
				<ul>
					<li class="a-side-li"><a class="list-a" target="iframe_a"
						href="./adminToday">일일/주간통계</a></li>

					<li class="a-side-li"><a class="list-a" target="iframe_a"
						href="./adminProduct">TOP5상품</a></li>
					<li class="a-side-li"><a href="../product/productInsert"
						target="iframe_a" class="list-a">상품등록</a></li>
					<li class="a-side-li"><a class="list-a" target="iframe_a"
						href="./adminOrder">주문관리</a></li>
					<li class="a-side-li"><a class="list-a" target="iframe_a"
						href="./adminMember">회원관리</a></li>
						<li class="a-side-li"><a class="list-a" target="iframe_a"
						href="./adminSlide">메인사진관리</a></li>
				</ul>
			</div>
			<iframe class="side-r" src="./adminToday" name="iframe_a"
				title="Iframe Example"></iframe>

		</div>


	</div>






	<c:import url="../common/footer.jsp"></c:import>
	<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>