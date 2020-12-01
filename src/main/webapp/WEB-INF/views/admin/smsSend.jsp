<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/bootStrap.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&display=swap');
   *{margin:0; padding:0; font-family: 'Arial', 'Nanum Gothic', sans-serif; list-style: none;}

   /* Section Nav*/
   #section{
      width: 500px;
      height: 630px;
      margin: 0 auto;
   }
   .text-header{
      width: 500px;
      height: 60px;
      margin: 30px auto;
      border: 1px solid #00193b;
   }
   .text-title{
      width: 143px;
      height: 60px;
      margin: 0 auto;
      line-height: 60px;
      font-size: 25px;
      color: #595959;
      letter-spacing: 3px;
   }
   .text-contents{
      width: 500px;
      height: 500px;
      margin: 30px auto;
   }
   .text-num{
      width: 500px;
      height: 50px;
      margin: 20px 0 0 0;
   }
   .text-contents-num{
      width: 500px;
      height: 30px;
      border: 1px solid #00193b;
   }
   .text-contents-area{
      width: 500px;
      height: 350px;
      margin: 30px auto;
   }
   .text-contents-area > textarea{
      border: 1px solid #00193b;
   }
   .text-contents-send{
      width: 500px;
      height: 70px;
      margin: 0 auto;
   }
   .text-send{
      width: 500px;
      height: 50px;
      background-color: #00193b;
      margin: 5px 0 0 0;
      border: none;
      font-size: 20px;
      color: white;
   }
   .text-contents-p{
      margin: 0 0 5px 0;
   }
</style>

</head>
<body>
	  <!-- Section -->
   
   <div id="section">
      <div class="text-header">
         <div class="text-title">문자 보내기</div>
      </div>
      <div class="text-contents">
        
            <div class="text-num">
               <p class="text-contents-p">휴대폰 번호</p>
               <input type="text" class="text-contents-num" readonly="readonly" id="phone" value="${param.phone}">
            </div>
            <div class="text-contents-area">
               <p class="text-contents-p">내용</p>
               <textarea rows="10" cols="66" id="text"></textarea>
            </div>
            <div class="text-contents-send">
               <input type="button" class="text-send" value="전송" id="send">
            </div>
         
      </div>
   </div>
	
</body>
<script type="text/javascript">
	$("#send").click(function(){
		var phone=$("#phone").val();
		var text=$("#text").val();
		
		$.post("./smsSend",{
			phone:phone,
			text:text
		},function(data){
			data=data.trim();
			if(data>0){
				alert("전송성공");
				window.open('','_self').close();     
			}else{
				alert("전송실패");
				window.open('','_self').close();     
			}
		});
	});

</script>
</html>