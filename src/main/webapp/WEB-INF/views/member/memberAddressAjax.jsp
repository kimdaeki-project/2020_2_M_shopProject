<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="addrtable">
				<tr class="addrheader">
					<td class="addrfix">고정</td>
					<td class="addrperson">수령인</td><td class="addrphone">수령인번호</td><td class="addr">주소</td><td class="addrdelete">주소록삭제</td>
					<td class="addrdelete">주소록수정</td>
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr class="addrinfo"> 
						<td><input type="checkbox" class="fix" value="${dto.fix}" name="${dto.num}"></td>
						<td>${dto.takePerson}</td>
						<td>${dto.takePhone}</td>
						<td>${dto.takeAddr1} ${dto.takeAddr2} ${dto.takeAddr3}</td>
						<td><button class="selectbtn delbtn" id="${dto.num}">삭제</button></td>
						<td><button class="selectbtn upbtn" value="${dto.num}">수정</button></td>
					</tr>
				
				</c:forEach>
				
			</table>
			<input type="hidden" value="${count}" id="count">
			<script type="text/javascript">
				count=$("#count").val();
				$(".fix").each(function(){
					var fix=$(this).val();
					if(fix==1){
						$(this).prop("checked","true");
					}
				});
			
					
					
					
				
			
			</script>