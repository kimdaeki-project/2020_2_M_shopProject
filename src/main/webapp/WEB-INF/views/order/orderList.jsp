<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/common/common.css">
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<style type="text/css">
	.orderwrap{
		margin : 100px auto;
		width: 900px;
		
	}
	.orderheader{
		border-bottom: 1px solid #e8e8e8;
		
	}
	.ordertable{
		border: 1px solid #e8e8e8;
		width:900px;
		border-collapse: collapse;
	}
	.orderdate{
		width:100px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.ordernum{
		width:350px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.orderprice{
		width:150px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.orderstatus{
		width:100px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.orderselect{
		width:100px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.orderinfo{
		width:900px;
		height: 40px;
		text-align: center;
		font-size: 11px;
		line-height: 30px;
		color:#757575;
		font-weight: bold;
		border-bottom: 1px solid #e8e8e8;
	}
	.selectbtn{
		width: 60px;
		height: 30px;
		margin-left:20px;
		line-height:30px;
		background-color: #6e6e6e;
		color: #ffffff;
		border: 1px solid #e8e8e8;
		
	
	}
	.selectbtn a{
		color: #ffffff;
		text-decoration: none;
	}
	
	.pagerwrap{
		width: 800px;
		height: 50px;
		margin: 50px auto;
		
		text-align: center;
		line-height: 50px;
		font-size: 11px;
	}
	.c1{
		cursor: pointer;
		
	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
	
	<section>
	<div class="orderwrap">
		
		<table class="ordertable">	
			<tr class="orderheader">
				<td class="orderdate">주문일자</td><td class="ordernum">주문상품</td><td class="orderprice">결제금액</td><td class="orderstatus">주문처리</td><td class="orderselect">상세조회</td><td class="orderselect">환불하기</td>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr class="orderinfo"> 
				<td>${dto.regdate}</td>	
				<td>${dto.productDTOs[0].name}
				<c:if test="${dto.productDTOs.size() >1}">
					외${dto.productDTOs.size()-1}건
				</c:if>				
				</td>	
				<td>${dto.totalPrice}</td>	
				<td>${dto.status}				
				</td>
				<td><div class="selectbtn"><a id="${dto.num}"   href="./orderSelect?num=${dto.num}" onclick="window.open(this.href, '_blank', 'width=850px,height=800px,toolbars=no,scrollbars=no'); 
     			 return false;">조회</a></div></td>
     			 <td> 
     			  	<c:choose>
     			  		<c:when test="${dto.status=='결제완료'}">
     			  			<button style="width: 60px; height: 30px; background-color: #6e6e6e;
							color: #ffffff;
							border: 1px solid #e8e8e8;" value="${dto.num}" class="refund">환불하기</button>
     			  		</c:when>
     			  		<c:otherwise>
     			  			환불불가
     			  		</c:otherwise>
     			  	</c:choose>		
     			</td>	
			</tr>
			
			</c:forEach>	
			
			
		</table>
	
	</div>
	<div class="pagerwrap">
		<c:if test="${pager.startNum gt 1}">		
    		<span class="c1" title="${pager.startNum-1}"><</span>
    	</c:if>
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    				<span  class="c1" title="${i}" id="${i}">${i}</span>
    		</c:forEach>
    		<c:if test="${pager.nextCheck}">
    			<span class="c1" title="${pager.lastNum+1}">></span>  
    				
    		</c:if>
	</div>	
	</section>

	
	<c:import url="../common/footer.jsp"></c:import>
	<script type="text/javascript">
		$(".c1").click(function(){		
			var t = $(this).attr("title");
			location.href="./orderList?curPage="+t;
		});
		$("#"+${pager.curPage}).css("color","red");
		
		$(".refund").click(function(){
			var num=$(this).val();
			$.post("./orderDelete",{num:num},function(data){
				data=data.trim();
				if(data>0){
					alert("환불성공");
					location.href="./orderList";
				}else{
					alert("환불실패");
				}
			});
		});
		
	</script>
</body>
</html>