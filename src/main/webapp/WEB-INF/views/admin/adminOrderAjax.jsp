<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="orderwrap">
		<input type="text" placeholder="아이디 검색" id="memberId" value="${pager.memberId}" style="margin-bottom: 30px; height: 30px; ">
		<select style=" height: 30px;" id="statusSelect">
			<option value="">전체</option>
			<option>결제완료</option>
			<option>배송준비중</option>
			<option>배송시작</option>
			<option>구매확정</option>
		</select>
		<button id="searchbtn" style="background-color: #6e6e6e;
		color: #ffffff; height: 31px;border: 1px solid #e8e8e8;">검색</button>
		
		<table class="ordertable">	
			<tr class="orderheader">
				<td class="orderselect">ID</td><td class="orderdate">주문일자</td><td class="ordernum">주문상품</td><td class="orderprice">결제금액</td><td class="orderstatus">주문처리</td><td class="orderselect">상태변경</td><td class="orderselect">상세조회</td>
				
			
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr class="orderinfo"> 
				<td>${dto.memberId}</td>
				<td>${dto.regdate}</td>	
				<td>${dto.productDTOs[0].name}
				<c:if test="${dto.productDTOs.size() >1}">
					외${dto.productDTOs.size()-1}건
				</c:if>				
				</td>	
				<td>${dto.totalPrice}</td>	
				<td>
					<c:choose>
						<c:when test="${dto.status == '구매확정'}">
							구매확정
						</c:when>
						
						<c:otherwise>
							<select class="status ${dto.num}" title="${dto.status}">	
							<option value="결제완료">결제완료</option>			
							<option value="배송준비중">배송준비중</option>					
							<option value="배송시작">배송시작</option>
							<option value="구매확정">구매확정</option>
				</select>
						</c:otherwise>
					</c:choose>
								
				</td>
				<td>
				<c:choose>
					<c:when test="${dto.status == '구매확정'}">
						변경불가
					</c:when>
					<c:otherwise>
					<div class="selectbtn">
						<a title="${dto.num}" class="update">변경</a>
						</div>
					</c:otherwise>
				</c:choose>			
				 </td>	
     				
				<td><div class="selectbtn"><a id="${dto.num}"   href="../order/orderSelect?num=${dto.num}" onclick="window.open(this.href, '_blank', 'width=850px,height=800px,toolbars=no,scrollbars=no'); 
     			 return false;">조회</a></div> </td>		
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
	<script type="text/javascript">
	$("#statusSelect").val("${pager.status}");
	
	$(".update").click(function(){
		var num=$(this).attr("title");
		var status=$("."+num).val();
		
		
		$.post("./orderStatusUpdate",{
			num:num,
			status:status
		},function(data){
			data=data.trim();
			if(data>0){
				alert("변경성공");
			}else{
				alert("변경실패");
			}
			getList();
		});
	});
	
	$(".status").each(function(){
		var v=$(this).attr("title");
		$(this).val(v);
	
	});
	
	$("#"+${pager.curPage}).css("color","red");

	$(".c1").click(function(){		
		var curPage = $(this).attr("title");
		var memberId=$("#memberId").val();
		var status=$("#statusSelect").val();
		//location.href="./adminOrder?curPage="+t;
		$.ajax({
			url:"./adminOrder",
			type:"POST",
			data:{
			curPage:curPage,
			memberId:memberId,
			status:status
			},
			success: function(data){
				$("#sec").empty();
				$("#sec").append(data);
			}		
		});
	});
	
	
	$("#searchbtn").click(function(){
		var memberId=$("#memberId").val();
		var status=$("#statusSelect").val();
		$.ajax({
			url:"./adminOrder",
			type:"POST",
			data:{
			memberId:memberId,
			status:status
			},
			success: function(data){
				$("#sec").empty();
				$("#sec").append(data);
			}		
		});
	});
	</script>