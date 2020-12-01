<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">
<title>Insert title here</title>
<style type="text/css">

*{
		 font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
	}
	

  .con{
      width:1100px;
      height:380px;
      border-color: #E8E7E7;
      border-style: solid;
      border-width: 1px;
      padding-bottom: 30px;
      padding-top: 30px;
      margin: 100px auto;
   }
   #findheader{
  	line-height:80px;
  	 margin: 0px auto;
  	 width:1100px;
  	 height: 80px;
  	 text-align: center;
 
  	 font-size: 13px;
  	 font-weight: bold;
  }
  #findcontents{
  	 width:500px;
  	 margin:0 auto;
  	 height:250px;
  	 border-color: #E8E7E7;
      border-style: solid;
      border-width: 1px;
  	
  	 font-size: 13px;
  	 font-weight: bold;
  }
  .ulwrap{
   	overflow:hidden;
  	margin-left: 160px;
  }
  .idli{
  	margin-top:30px;
  	margin-bottom: 30px;
  }
  .findbtn{
  	
  	margin-left: 150px;
  	width:200px;
  	height: 40px;
  	background: #262626;
  	border: 1px solid #d4d8d9;
    color: #fff;
  }
</style>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
	<div class="con"> 
		<div id="findheader">
   			고객님 아이디 찾기가 완료 되었습니다.
   		</div>
		<div id="findcontents">
   			<ul class="ulwrap">
   				<li class="idli">
   					<img alt="" src="../resources/images/idfind.gif">
   					<span style="margin-right: 32px;">이름</span>
   					<span style="margin-right: 32px;">${param.resultName}</span>
   				</li>
   				<li class="idli">
   					<img alt="" src="../resources/images/idfind.gif">
   					<span>이메일</span>
   					<span style="margin-right: 32px;">${param.resultEmail}</span>
   				</li>
   				
   				<li class="idli">
   					<img alt="" src="../resources/images/idfind.gif">
   					<span>아이디</span>
   					<span style="margin-right: 32px;">${param.resultId}</span>
   				</li>
   			</ul>
   					<button class="findbtn" type="button">로그인</button>
   		</div>	
	</div>
	
	
	
	<c:import url="../common/footer.jsp"></c:import>
	<script type="text/javascript">
		$(".findbtn").click(function(){
			location.href="./memberLogin";
		});
	</script>
	<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>