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
<style type="text/css">
	
	*{
		margin: 0;
		padding: 0;
		font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
		text-decoration: none;
   }
   
	table{
		color: #353535;
		font-size: 12px;
		padding: 60px;
		line-height: 140%;
		width: 1140px;
		text-decoration: none;
		border: 1px solid #e8e8e8;
	}
	
	table tr{
		padding: 12px 0 10px;
		color: #353535;
		
	}
	
	table td{
		color: #353535;
		text-align: center;
		padding: 12px 0 10px;
		border-bottom: 1px solid #e8e8e8;
	}
	
	table a{
		color: #353535;
		text-decoration: none;
		cursor: pointer;
	}
	
	#index{
		background: #fbfafa;
	}
	
	.search_container{
		padding: 15px 0 20px;
		width: 1140px;
		height: 80px;
		margin: 0 auto;
   }
	.search-form{
		width:25%;
		height: 60px;
		margin: 0 auto;
		padding-top: 14px;
	}
   
	select{
		float: left;
		height: 22px;
		margin: 0 3px 0 0;
		font-size: 11px;
		border: 1px solid #d5d5d5;
      
	}
   
	#search_input{
		float:left;
		height: 22px;
		width: 150px;
		border: 1px solid #d5d5d5;
		font-size: 11px;
	}
   
	.search-button{
		font-size: 11px;
		float:left;
		width: 49px;
		height: 22px;
		background-color: white;
		border: 1px solid #d5d5d5;
		margin-left: 3.5px;
	}
	
	#review1{
		font-weight: bold;
		color: #333333;
		padding-right: 15px;
		font-size: 13px;
	}
	
	#review2{
		margin: 0 8px;
		color: #7d7d7d;
		font-size: 13px;
	}
	
	hr{
		background-color: #e1e1e1;
		height: 0.2px;
	}
	
	.contents{
		padding-top: 60px;
		padding-bottom: 10px;
		margin-bottom: 10px;
		border-bottom: 1px solid #dadada;
		width: 1140px;
	}
	
	.review_table{
		margin-top: 30px;
	}
	.page{
		padding: 80px 0 0;
		text-align: center;
		margin-bottom: 25px;
	}
	
	.page a{
		color: #313131;
		text-decoration: none;
	}
   
</style>

</head>
<body>
<c:import url="../common/header.jsp"></c:import>


<div class="container">

<div class="contents">
   <span><b>MY BOARD</b></span>
   <span style="padding-left: 5px;">|</span>
   <span style="padding-left: 5px; font-size: 13.5px;">내가 작성한 게시글</span>

</div>

<table>
	<tr id="index">
        <td>글번호</td>
        <td>분류</td>
        <td>제목</td>
        <td>작성자</td>
        <td>작성일</td>
     </tr>
	<tr>
		<c:forEach items="${list}" var="dto" varStatus="vs">
			<td style="width: 70px;">${dto.num}</td>
			<td style="width: 80px;"><a href="../qna/qnaList">Q&A</a></td>
			<td style="text-align: left; padding-left: 20px;"><a title="${dto.num}" class="subject">${dto.title}</a></td>
			<td style="width: 130px;">${dto.writer}</td>
			<td style="width: 130px;">${dto.regDate}</td>
			<tr></tr>
		</c:forEach>
		<c:if test="${list.size()==0}">
			<td colspan="5">게시물이 없습니다.</td>
		</c:if>
	</tr>

</table>
<div class="page" >
   <c:if test="${pager.beforeCheck}">
      <a href="./memberQna?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"><</a>
      </c:if>
     <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
        <a href="./memberQna?curPage=${i}&kind=${pager.kind}&search=${pager.search}" id="${i}">${i}</a>
     </c:forEach>
     <c:if test="${pager.nextCheck}">
     <a href="./memberQna?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">></a>
     </c:if>
  </div>

<form>
<div class="search_container">
         <div class="search-form">
            <select id="kind" name="kind">
               <option value="tt">제목</option>
               <option value="con">내용</option>
               <option value="wr">글쓴이</option>
            </select>
            <input id="search_input" type="text" name="search">
                <button type="submit" class="search-button">찾기</button>
         </div>
</div>
</form>

</div>
<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript">
$("#"+${pager.curPage}).css("color","red");
var kind ='${pager.kind}';
var search='${pager.search}';
if(kind==''){
	$("#kind").val("tt");
}else{
	$("#kind").val(kind);
}

$("#search_input").val(search);

$(".subject").click(function(){
	var num = $(this).attr('title');
	$.post("../qna/pwCheck",{num:num},function(data){
		data=data.trim();
		data;
		location.href ="../qna/qnaSelect?num="+num+"&qnaPw="+data;
	});
});
</script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>