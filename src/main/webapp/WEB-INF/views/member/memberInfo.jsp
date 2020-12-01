<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/bootStrap.jsp"></c:import>
<title>Insert title here</title>
<link rel="stylesheet"href="../resources/css/member/memberJoin.css">
<link rel="stylesheet"href="../resources/css/common/common.css">
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

<section style="margin-top: 100px; margin-bottom: 100px;">
<div class="container">
  
<form action="./memberInfo" method="post" id="frm">
   <h5 style="line-height: 0.2;"><b>기본정보</b></h5>
   <p style="text-align: right; font-size: 13px; color=#353535; line-height: 0.2; font-family: 돋움;" ><img src="../resources/images/ico_required.png"> 필수입력사항</p>
   <table border="1" class="table" bordercolor ="#e8e8e8" >
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;아이디 <img src="../resources/images/ico_required.png"></td>
         <td><input type="text" class="inputTypeText" id="id" name="id" value="${info.id}" readonly="readonly" required="required">
              <div id="idResult" class="result"></div>
           </td>
      </tr>
      
      <tr id="#idResult"></tr>
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;비밀번호 <img src="../resources/images/ico_required.png"></td>
         <td><input type="password" class="inputTypeText" id="pw" name="pw"> (영문 대/소문자/숫자 중 3가지 이상 조합, 8자~16자)
             <div id="pwResult" class="result"></div>
            </td>
      </tr>
      
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;비밀번호 확인 <img src="../resources/images/ico_required.png"></td>
         <td><input type="password" class="inputTypeText" id="pw2" name="pw2">
              <div id="pw2Result" class="result"></div>
            </td>
      </tr>
      
      <tr class="group">
         <td class="leftrow">&nbsp;&nbsp;이름 <img src="../resources/images/ico_required.png"></td>
         <td><input type="text" class="inputTypeText empty should" id="name" name="name" value="${info.name}" required="required"></td>
      </tr>
      
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;휴대전화 <img src="../resources/images/ico_required.png"></td>
         <td><input type="text" class="inputTypeText empty should" id="phone" name="phone" value="${info.phone}" required="required"></td>
      </tr>
      
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;이메일 <img src="../resources/images/ico_required.png"></td>
         <td><input type="email"  class="inputTypeText empty should" id="email" name="email" value="${info.email}" required="required">
         		
         	
         </td>
      </tr>
     
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;주소 <img src="../resources/images/ico_required.png"></td>
         <td>
            <input class="form-control should" placeholder="우편번호" name="addr1" id="addr1" type="text" value="${info.addr1}" required="required">
              <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
         
            <input class="form-control should" placeholder="도로명 주소" name="addr2" id="addr2" type="text" value="${info.addr2}" required="required"/>

            <input class="form-control should" placeholder="상세주소" name="addr3" id="addr3" type="text"  value="${info.addr3}" required="required"/>
         </td>
      </tr>
   </table>
   <div style="text-align: center;" >   
   <input type="button" value="수정" class="btn btn-join" id="update">  
   <input type="button" value="취소" class="btn btn-cancel" id="cancel">
  
   </div>
	<div style="text-align:right; margin-top: 50px;">
	<input type="button" value="회원탈퇴" class="btn btn-cancel" id="delete">
	</div>
</form>


</div>

</section>

<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript">
var pwCheck =false;
var pw2Check =false;
var shouldCheck=true;
$("#update").click(function(){
	should();
	if(pwCheck&&pw2Check&&shouldCheck){
		$("#frm").submit();
	}else if(!pwCheck){
		alert("해당 패스워드를 사용할 수 없습니다");
		$("#pw").focus();
	}else if(!pw2Check){
		alert("패스워드가 일치하지 않습니다");
		$("#pw2").focus();
	}else if(!shouldCheck){
		alert("필수 항목을 입력해주세요");
		$(".should").each(function(){
			if($(this).val().length==0){
				$(this).focus();
			}
	
		});
	}
	});
$("#cancel").click(function(){
	location.href="../";
});

$("#pw").blur(function(){
	var pwSize =$(this).val().length;
	 pwCheck =false;
	if(pwSize>16){
		  $("#pwResult").text("최대 16글자까지 가능합니다");
		  $("#pwResult").css("color","red");
	}
	else if(pwSize<8){
		  $("#pwResult").text("최소 8글자 이상이어야 합니다");
		  $("#pwResult").css("color","red");
	}else{
		var val=$(this).val();	
		 var upper =false;
		 var lower =false;
		 var num=false;
		for(var i=0; i<val.length;i++){
			var a = val.charAt(i);
			
			if(a>='A'&&a<='Z') {
				upper=true;
			}else if(a>='a'&&a<='z') {
				lower =true;
			}else if(a>=0&&a<=9){
				num =true;
			}
		}
		if(upper&&lower&&num){
			$("#pwResult").text("사용가능한 패스워드입니다");
			$("#pwResult").css("color","blue");
			pwCheck=true;
		}else{
			$("#pwResult").text("영문 대/소문자/숫자가 1개이상 포함되어야합니다");
			  $("#pwResult").css("color","red");
		}
	}
	
});
//비밀번호가 통과되고 비밀번호확인까지 일치하였는데 사용자가 비밀번호를 추가로 입력하거나 지우면 비밀번호가 일치하지않는다고 출력함
$("#pw").keyup(function(){
	var a=$("#pw2").val().length;
	if(a>0){
		pwEqual();
	}
});
//pw와pw2가 일치하는지 확인함
$("#pw2").keyup(pwEqual);

//pw와 pw2가 일치하는지 확인하는 함수
function pwEqual(){
	pw2Check=false;
	var pw = $("#pw").val();
	var pw2 = $("#pw2").val();
	if(pw==pw2){
		 $("#pw2Result").text("패스워드가 일치합니다");
		 $("#pw2Result").css("color","blue");
		 pw2Check=true;
	}else{
		 $("#pw2Result").text("패스워드가 일치하지 않습니다");
		 $("#pw2Result").css("color","red");
	}
}
function should(){
	 shouldCheck=true;
	$(".should").each(function(){
		var c =$(this).val().length;
		if(c<1){
			shouldCheck=false;
		}
	});
}

$("#delete").click(function(){
	 if(pwCheck&&pw2Check){
		
		 $.post("./memberDelete",{pw : $("#pw").val(),id : $("#id").val()},function(data){
			 data=data.trim();
			 if(data==0){
				 alert("패스워드가 일치하지 않습니다!");
			 }else{
				 alert("회원탈퇴되었습니다");
				 location.href="../";
			 }
		 });
	 }else if(!pwCheck){
			alert("해당 패스워드를 사용할 수 없습니다");
			$("#pw").focus();
		}else if(!pw2Check){
			alert("패스워드가 일치하지 않습니다");
			$("#pw2").focus();
		}
});
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../resources/js/address/address.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>