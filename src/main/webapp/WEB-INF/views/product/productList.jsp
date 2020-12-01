<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">
<link href="../resources/css/product/productList.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
	*{
		 font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
	}
	
	.pCode{
		margin: 50px auto 30px;
		width: 1300px;
		height: 50px;
		
		text-align: center;
		line-height	: 50px;
		font-size:15px;
		
		letter-spacing: 2px;
		font-family: 'Nunito Sans',serif;

	}
	.cCode{
		margin: 20px auto;
		width: 1300px;
		height: 50px;
		
		text-align: center;
		line-height	: 50px;		
		color: #000;
    	font-size: 12px;
   	 	letter-spacing: 2px;
   	 	text-decoration: none;
    	font-family: 'Arial',sans-serif;
    	font-weight: 500;
	}
	.codename{
		margin-left: 20px;
	}
	.codename :hover{
		text-decoration: none;
	}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>


<section>
<div class="pCode">
<a href="./productList?pCode=${category[0].pCode}">${category[0].name}</a> 


</div>
<div class="cCode">
<c:forEach items="${category}" var="dto" begin="1">
<c:if test="${dto.cCode ne pager.cCode}">
<a href="./productList?pCode=${dto.pCode}&cCode=${dto.cCode}" class="codename">${dto.name}</a> 
</c:if> 
</c:forEach>
</div>
<div class="seqWrap">
<select id="seq" onchange="sequence()" >
	<option value="0">최신순</option>
	<option value="1">조회순</option>
	<option value="2">높은 가격순</option>
	<option value="3">낮은 가격순</option>
</select>
</div>

<div class="productWrap">
<ul>
<c:forEach items="${list}" var="dto" >
<li class="listWrap"> 
<div class="hitWrap">[HIT : ${dto.hit}]</div>
<div class="imgWrap"> 
<a href="./productSelect?num=${dto.num}"><img alt="" src="../resources/upload/product/${dto.imgName}" class="img"></a>
</div>
<div class="productTitle">
${dto.name}
</div>
<div class="price">
<c:if test="${dto.sale>0}">
<del><strong>${dto.price}원</strong></del>
</c:if>
</div>
<div class="sale">${dto.finalPrice}원
<c:if test="${dto.sale>0}">
<span style=" font-weight:bold;">${dto.sale}%할인중!</span>
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


<div class="pageWrap">
		<c:if test="${pager.startNum gt 5}">		
    		<span class="c1" title="1" style="padding-left: 40px;"><<</span>
    	</c:if>
		<c:if test="${pager.startNum gt 1}">		
    		<span class="c1" title="${pager.startNum-1}"><</span>
    	</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    				<span  class="c1" title="${i}" id="${i}">${i}</span>
    		</c:forEach>
    		<c:if test="${pager.nextCheck}">
    			<span class="c1" title="${pager.lastNum+1}">></span>  
    			<span class="c1" title="${pager.lastPage}">>></span> 			
    		</c:if>
    		
    		
    			
</div>

</section>
<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<script type="text/javascript">

$("#seq").val(${pager.seq});

$(".c1").click(function(){
	var t=$(this).attr("title");
	location.href="./productList?curPage="+t+"&pCode=${pager.pCode}&cCode=${pager.cCode}&seq=${pager.seq}";
});

function sequence(){
	var seq = $("#seq").val();
	location.href="./productList?pCode=${pager.pCode}&cCode=${pager.cCode}&seq="+seq;
}

$("#${pager.curPage}").css("color","red");
$("#${pager.curPage}").css("font-weight","bold");



</script>
</body>
</html>