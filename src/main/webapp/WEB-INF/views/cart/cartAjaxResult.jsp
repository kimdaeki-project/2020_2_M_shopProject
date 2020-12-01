<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
      <c:choose>
      	<c:when test="${not empty list}">
      	
		<c:forEach items="${list}" var="dto">
			<tr class="tbody">
			
			<td class="boxcon"><input type="checkbox"  value="${dto.num}" class="check"></td>
			<td class="imgcon"><img alt="" src="../resources/upload/product/${dto.productDTO.imgName}" style="width: 90px; height: 90px;"> </td>
			<td class="infocon">
				<div class="infocondiv" style="font-weight: bold">
					${dto.productDTO.name}
				</div>
				<div class="infocondiv">
					[옵션: 색상:${dto.color} 사이즈:${dto.sizing}]
				</div>
			</td>
			<td class="pricecon">${dto.productDTO.finalPrice}원</td>
			<td class="amountcon"><input type="number" id="${dto.num}" style="width: 40px; height: 40px; border: 1px solid #e9e9e9; text-align: center;" min="1" max="10"  value="${dto.amount}"> </td>			
			<td class="totalcon sel" title="${dto.totalPrice}">${dto.totalPrice}원</td>
			<td class="upcon"><button class="btncon update" value="${dto.num}">변경</button></td>
			<td class="delcon"><button class="btncon delete" value="${dto.num}">삭제</button></td>		
			
				</tr>
		</c:forEach>
			
		<tr class="tfoot"> 
			<td colspan="8">총 상품금액 :   <span style="font-weight:bold; padding-left:10px;">${total}원</span></td>
		</tr>

		</c:when>
		
		<c:otherwise>
			<tr class="empty"><td colspan="8">장바구니가 비어 있습니다.<td></tr>
		</c:otherwise>
		</c:choose>