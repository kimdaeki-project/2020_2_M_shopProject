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
 
  	 font-size: 18px;
  	 font-weight: bold;
  }
  #findcontents{
  	 width:1100px;
  	 height:250px;
  	
  	
  	 font-size: 13px;
  	 font-weight: bold;
  }
  .ulwrap{
   	overflow:hidden;
  	margin-left: 400px;
  }
  .idli{
  	margin-top:30px;
  	margin-bottom: 30px;
  }
  .findbtn{
  	margin-top:30px;
  	margin-left: 450px;
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
   			가입한 이메일로 아이디 찾기
   		</div>
   			
   		<div id="findcontents">
   			<ul class="ulwrap">
   				<li class="idli">
   					<img alt="" src="../resources/images/idfind.gif">
   					<span style="margin-right: 32px;">이름</span>
   					<input type="text" id="name" name="name">
   				</li>
   				<li class="idli">
   					<img alt="" src="../resources/images/idfind.gif">
   					<span>이메일</span>
   					<input type="text" id="email" name="email">
   				</li>
   			</ul>
   					<button class="findbtn" type="button">확인</button>
   		</div>
   		
   		<form action="./memberIdResult" method="post" id="frm">
   			<input type="hidden" name="resultName" id="resultName">
   			<input type="hidden" name="resultEmail" id="resultEmail">
   			<input type="hidden" name="resultId" id="resultId">
   			<input type="hidden" id="resultbtn">
   		</form>
	</div>

	
	
	
	<c:import url="../common/footer.jsp"></c:import>
	<script type="text/javascript">
	$("#resultbtn").click(function(){
		$("#frm").submit();
	});
	
	
		$(".findbtn").click(function(){
			var name=$("#name").val();
			var email=$("#email").val();
			
			if(name.length==0||email.length==0){
				alert("정보를 모두 입력해주세요");
			}else{
				$.post("./memberIdFind",{
					name:name,
					email:email
				},function(data){
					data=data.trim();
				 	if(data.length==0){
				 		alert("입력하신 정보와 일치하는 아이디가 없습니다");
				 	}else{
				 		$("#resultName").val(name);
				 		$("#resultEmail").val(email);
				 		$("#resultId").val(data);
				 		$("#resultbtn").click();
				 	}
				});
			}
			});
			
			
	</script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>