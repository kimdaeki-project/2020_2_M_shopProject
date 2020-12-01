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
	
.searchwrap{
	width: 600px;
	height: 350px;
	
	margin: 50px auto;
	text-align: center;
	border: 1px solid #e8e8e8;
	font-size: 20px;
}
.procount{
	width: 1300px;
	height: 40px;
	
	margin: 40px auto;
	line-height: 40px;
	font-size: 13px;
	border: 1px solid #e8e8e8;
}
.inputwrap{
	margin-top: 30px;
}
#searchinput{
	width:200px;
	height:30px;
	font-size: 13px;
	border: 1px solid #e8e8e8;
}
.priceinput{
	width:100px;
	height: 30px;
	font-size: 13px;
	border: 1px solid #e8e8e8;
}
#searchbtn{
	width: 200px;
	height: 30px;
	background-color:white;
	font-size:12px;
	border: 1px solid #e8e8e8;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

<section>
<div class="searchwrap">
	<div style="margin-bottom: 50px; margin-top: 30px;"><span style="font-size: 25px; font-weight: bold;">"${pager.search}"</span>검색결과</div>
	<div class="inputwrap"><span style="margin: 0px;padding: 0px; font-size: 14px; margin-right: 20px">상품명</span><input type="text" placeholder="상품검색" value="${pager.search}" id="searchinput"></div>
	<div class="inputwrap"><span style="margin: 0px;padding: 0px; font-size: 14px; margin-right: 22px;margin-left: 20px">가격대</span><input type="text" class="priceinput" id="startPrice" value="${pager.startPrice}">~
	<input type="text" class="priceinput"  id="endPrice" value="${pager.endPrice}"></div>
	<p style="font-size: 10px; margin-top: 10px;margin-left: 32px;">0원입력시 모든 가격대가 조회됩니다</p>
	<div class="inputwrap" style="margin-left: 60px;"><button id="searchbtn">검색</button></div>
</div>
<div class="procount">
	총 <span style="margin: 0px;padding: 0px;font-size: 15px;font-weight: bold;">${pager.totalCount}</span>개의  상품이 검색되었습니다
</div>


<div class="productWrap">
<ul>
<c:forEach items="${list}" var="dto" >
<li class="listWrap"> 
<div class="hitwrap">[HIT : ${dto.hit}]</div>
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
$(".c1").click(function(){
	var t=$(this).attr("title");
	location.href="./productSearch?curPage="+t+"&search=${pager.search}&startPrice=${pager.startPrice}&endPrice=${pager.endPrice}";
});
$("#searchbtn").click(function(){
	var search= $("#searchinput").val();
	var startPrice =$("#startPrice").val();
	var endPrice =$("#endPrice").val();
	location.href="./productSearch?search="+search+"&startPrice="+startPrice+"&endPrice="+endPrice;
});
$("#${pager.curPage}").css("color","red");
$("#${pager.curPage}").css("font-weight","bold");
</script>
</body>
</html>