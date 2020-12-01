<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/bootStrap.jsp"></c:import>
<style type="text/css">
	.memberwrap{
		margin : 100px auto;
		width: 800px;
		
	}
	.membertable{
		border: 1px solid #e8e8e8;
		width:800px;
		border-collapse: collapse;
	}
	.memberheader{
		border-bottom: 1px solid #e8e8e8;
		
	}
	.memberid{
		width: 100px;
		height: 40px;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
		text-align: center;
	}
	.membername{
		width: 100px;
		height: 40px;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
		text-align: center;
	}
	.memberdate{
		width: 100px;
		height: 40px;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
		text-align: center;
	}
	.memberemail{
		width: 200px;
		height: 40px;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
		text-align: center;
	}
	.memberphone{
		width: 200px;
		height: 40px;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
		text-align: center;
	}
	.membersms{
		width: 100px;
		height: 40px;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
		text-align: center;
	}
	.memberinfo{
		width:800px;
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
	<section>
	<div class="memberwrap">
		<form action="./adminMember" method="get">
			<input type="text" placeholder="아이디 검색" id="memberId" value="${pager.memberId}" name="memberId" style="margin-bottom: 30px; height: 30px;">
			<input type="submit" value="검색" style="background-color: #6e6e6e;
		color: #ffffff; height: 31px;border: 1px solid #e8e8e8;">
		</form>
		<table class="membertable">
			
			<tr class="memberheader">
				<td class="memberid">ID</td><td class="membername">이름</td><td class="memberdate">가입일자</td><td class="memberemail">이메일</td><td class="memberphone">휴대폰번호</td><td class="membersms">SMS</td>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr class="memberinfo"> 
				<td>${dto.id}</td>	
				<td>${dto.name}</td>	
				<td>${dto.regDate}</td>	
				<td>${dto.email}</td>
				<td>${dto.phone}</td>
				<td><div class="selectbtn"><a id="${dto.phone}"  class="sms" href="" onclick="window.open(this.href, '_blank', 'width=850px,height=800px,toolbars=no,scrollbars=no'); 
     			 return false;">SMS</a></div> </td>		
				
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
	<script type="text/javascript">
		$(".c1").click(function(){		
			var t = $(this).attr("title");
			location.href="./adminMember?curPage="+t;
		});
		$("#"+${pager.curPage}).css("color","red");
		
		$(".sms").each(function(){
			 $(this).attr("href","./smsSend?phone="+$(this).attr("id"));
		})
	</script>
</body>
</html>