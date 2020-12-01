<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<title>Insert title here</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
		font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
		text-decoration: none;
   }
   
   .search_title {
   	text-align: center;
   }
   
   #search{
		border: 1px solid #000;
   		padding: 10px 50px;
   		margin: 50px auto 50px;
   		letter-spacing: 1px;
   		display: inline-block;
   }
   
    table{
   		width: 1140px;
		border: 1px solid #e8e8e8;
		color: #353535;
		font-size: 11px;
		line-height: 180%;
	}
	
	table td{
		padding-left: 10px;
	}
	
	.group{
		border: 1px solid #d9d9d9;
		color: #202020;
	}
	
	.leftrow{
		background-color: #fbfafa;
		width: 110px;
		padding: 10px 0 8px 20px;
		border: 1px solid #e8e8e8;
		text-align: left;
		font-weight: normal;
		vertical-align: middle;
   }
   
   #contents{
   		padding: 17px 0 15px 20px;
   		border: 1px solid #e8e8e8;
   		height: 500px;
   		vertical-align: top;
   }
   
   	.btn:hover{
   	  background-color: #D4D8D9;
   	  color: white;
   }
   
	.btn{
	  margin: 20px 0px 50px;
	  margin-left: 5px;
	  float: right;
	  text-align: center;
	  text-decoration: none;
	  font-size: 12px;
	  padding: 15px;
	  font-weight: normal;
	  border-radius: 2px;
	  letter-spacing: 0px;
   }
   
	.btn-list{
   	  border: 1px solid #d4d8d9;
   	  background-color: white;
   }
   
   .btn-cancel{
   	  border: 1px solid #d4d8d9;
   	  background-color: white;
   }
   
    .btn-update{
   	  border: none;
	  background-color: #6e6e6e;
	  color: white;
   }
   
    .btn-write{
      text-decoration: none;
   	  border: 1px solid #d4d8d9;
   	  background-color: white;
   	  color:#353535;
   }
   
</style>

</head>
<body>
<c:import url="../common/header.jsp"></c:import>

<div class="container">
<div class="search_title">
  <span id="search" ><font color="333333">문의게시판</font></span>
</div>

<table>
	<tr class="group">
		<td class="leftrow">제목</td>
		<td>${dto.title}</td>
	</tr>
	
	<tr class="group">
		<td class="leftrow">작성자</td>
		<td>${dto.writer}</td>
	</tr>
	
	<tr class="group">
		<td colspan="2" id="contents" name ="contents">${dto.contents}</td>
	</tr>
	
</table>

  <c:if test="${member.auth==1 && dto.depth<1 && cnt==1}">
	<span class="btn_write">
	<a href="./qnaReply?num=${dto.num}" class="btn btn-write">답변</a>
	</span>
  </c:if>

 
  <c:if test="${not empty dto and member.id eq dto.writer}">
  <input type="button" value="수정" id="update" class="btn btn-update">
  <input type="button" title="${dto.num}" name="${dto.depth}" value="삭제" class="btn btn-cancel" id="del">
  </c:if>
  <input type="button" title="${dto.num}" value="목록" class="btn btn-list" id="list">

</div>
<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript">

   $("#list").click(function() {
	   location.href="./qnaList";
   });

   $("#update").click(function() {
      location.href="./qnaUpdate?num=${dto.num}";
   });

   //$("css선택자").action();
   $("#del").click(function() {
	   
      var num =$(this).attr("title");
      var depth=$(this).attr("name");
      location.href="./qnaDelete?num="+num+"&depth="+depth;
   });

   


</script>


</body>
</html>