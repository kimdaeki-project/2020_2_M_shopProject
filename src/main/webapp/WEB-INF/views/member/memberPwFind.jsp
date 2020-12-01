<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"href="../resources/css/common/common.css">
<title>Insert title here</title>
<style type="text/css">
	*{
		 font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
	}
	

  .con{
      width:1100px;
      height:400px;
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
   			<p>가입한 이메일로 비밀번호 찾기 </p>
   			<div class="spinner-border text-muted"" id="load" style="display: none;"></div>
   			
   		</div>
   		
   		<div id="findcontents">
   			<ul class="ulwrap">
   				<li class="idli">
   					<img alt="" src="../resources/images/idfind.gif">
   					<span>아이디</span>
   					<input type="text" id="id" name="id">
   				</li>
   			
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
   		</div>
<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript">
	
$(".findbtn").click(function(){
	
	
	var name=$("#name").val();
	var email=$("#email").val();
	var id=$("#id").val();
	if(name.length==0||email.length==0||id.length==0){
		alert("정보를 모두 입력해주세요");
	}else{
		$("#load").css("display","inline-block");
		$.post("./memberPwFind",{
			id:id,
			name:name,
			email:email
		},function(data){
			$("#load").css("display","none");
			data=data.trim();
			console.log(data);
			if(data==1){
				alert("메일로 새로운 비밀번호를 보내드렸습니다");
				location.href="./memberLogin";
			}else{
				alert("입력한 정보와 일치하는 계정이 없습니다");
			}
		 
		 	
		});
	}
	
});

</script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>