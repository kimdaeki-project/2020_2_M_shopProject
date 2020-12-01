<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function emailCheck(val) {
	var obj = document.getElementById("email2");
	if(val == "email"){ //직접입력이면
		obj.value="";
		obj.readOnly=false;
		obj.focus();
	}else{
		obj.value=val;
		obj.readOnly=true;
	}
}

</script>
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 <style type="text/css">
 	*{
		margin: 0;
		padding: 0;
		font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
		text-decoration: none;
	}
 	
 	#f { 
 		display: none; 
 	} 
 	.del { 
 		color: red; 
 		font-weight: bold; 
 		cursor: pointer; 
 	} 
 	.panel-heading note-toolbar{
 		height: 30px;
 	}
 	
	.qna_title {
   	text-align: center;
   }
   
	#qna{
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
   
	select{
		height: 23px;
		border: 1px solid #d5d5d5;
   }
   
	.inputTypeText{
		border: 1px solid #d9d9d9;
		color: #202020;
   }
   
	.btn:hover{
   	  background-color: #D4D8D9;
   	  color: white;
   }
   
	.btn{
	  margin: 10px 0px 4px 1px;
	  text-align: center;
	  text-decoration: none;
	  font-size: 12px;
	  padding: 15px;
	  font-weight: normal;
	  border-radius: 2px;
	  letter-spacing: 0px;
   }
   
	.btn-write{
   	  border: none;
	  background-color: #6e6e6e;
	  color: white;
   }
   
   .btn-cancel{
   	  border: 1px solid #d4d8d9;
   	  background-color: white;
   }
	
 </style>

 </head> 
<body> 

<c:import url="../common/header.jsp"></c:import>


<div class="container">
<div class="qna_title">
  <span id="qna" ><font color="333333">문의게시판</font></span>
</div>
  <form id="frm" action="./qnaWrite" method="post" enctype="multipart/form-data">
  
  <table>
  	<tr class="group">
  		<td class="leftrow">제목</td>
  		<td><select id="title" name="title" style="width:395px;">
               <option>상품 문의</option>
               <option>배송 문의</option>
               <option>교환/환불 문의</option>
               <option>기타 문의</option>
               <option>배송전 취소/변경 문의</option>
            </select></td>
  	</tr>
  	
  	<tr class="group" style="height: 70px;">
  		<td class="leftrow">작성자</td>
  		<td><input style="height: 40px;" type="text" readonly="readonly" value="${member.id}" class="inputTypeText" id="writer" name="writer"></td>
  	</tr>
  	
  	<tr class="group">
  		<td class="leftrow">이메일</td>
  		<td><input type="text" class="inputTypeText" id="email1" name ="email1">@
  		 <input type="hidden" name="email" id="email" value="@">
  		<input type="text" class="inputTypeText" id="email2" readonly="readonly" name ="email2">
  		<select id="email3" class="inputTypeText" onchange="emailCheck(this.options[this.selectedIndex].value)">
  				<option value="">-이메일 선택-</option>
                <option value="naver.com">naver.com</option>
                <option value="daum.net">daum.net</option>
                <option value="gmail.com">gmail.com</option>
                <option value="nate.com">nate.com</option>
                <option value="hotmail.com">hotmail.com</option>
                <option value="empas.com">empas.com</option>
                <option value="email">직접입력</option>
        </select>
  		</td>
  	</tr>
  	
  	<tr class="group">
  		<td colspan="2" style="padding-left: 0px;">
  		<textarea class="form-control" rows="5" id="contents" name ="contents"></textarea>
  		</td>
  	</tr>
  	
  	<tr class="group" style="height: 70px;">
  		<td class="leftrow">비밀번호</td>
  		<td><input style="height: 40px;" type="number" class="inputTypeText" id="qnaPw" name="qnaPw" required="required">  (숫자, 4자리)</td>
  	</tr>
 	
  </table>

	<div style="text-align: right;" >
		<input type="button" class="btn btn-write" id="write" value="작성">
		<input type="button" value="취소" class="btn btn-cancel" id="cancel">
	</div>
</form>
  </div>
<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript">

var pwCheck =false;

$('#contents').summernote({
	height:400,
	callbacks:{
		onImageUpload: function(files, editor) {
			var formData = new FormData(); //가상의 form태그 작성
			formData.append('file',files[0]); //파라미터 이름을 file로
			
			$.ajax({
                 data:formData,
				 type:"POST",
                 url:'summernote',
                 enctype:'multipart/form-data',
                 cache:false,
                 contentType:false,
                 processData: false,
                 	success: function(data) {
                    data=data.trim();
                    data="../resources/upload/qna/"+data;
                    $("#contents").summernote('editor.insertImage', data);

				}
			})
		},//upload 끝
		 onMediaDelete: function(files){
       	  var fileName =$(files[0]).attr("src");
       	  var a=fileName.split("/");
       	  fileName=a[a.length-1];
       	 $.ajax({
       		 type:"POST",
	             url:"./summernoteDelete",
	             data:{
	            	 file:fileName
	             },
	             success:function(data){
	            	 if(data){
	            		 alert("삭제 성공");
	            	 }else{
	            		 alert("삭제 실패");
	            	 }
	             }
       	 });
       	 
        }
		
		}
	});
	
$('#contents').summernote('code', '※이미 처리된 게시글의 답글은 확인이 어려울 수 있으니 재문의는 꼭 새 게시글 작성으로 부탁드립니다!<br><br>주문번호:<br>성함:<br>연락처:<br>문의해주실 상품명:');


$("#write").click(function() {
	var pwNum = $("#qnaPw").val().length;
	var email1 = $("#email1").val().length;
	var email2 = $("#email2").val().length;
	var email_1 = $("#email1").val();
	var email_2 = $("#email").val();
	var email_3 = $("#email2").val();
	   
	   document.getElementById("email").value = email_1+email_2+email_3;
	//유효성 검사
	if(pwNum==4 && email1!=0 && email2!=0){ //숫자로 입력받은 pw가 4자리일때/email 작성되어있을 때만 submit
		$("#frm").submit();
	}else if(pwNum!=4){
		alert("해당 비밀번호는 사용할 수 없습니다.");
		$("#qnaPw").focus();
	}else if(email1==0){
		alert("이메일을 입력해주세요");
		$("#email").focus();
	}else if(email2==0){
		alert("이메일을 입력해주세요");
		$("#emai2").focus();
	}
	
 });
 
$("#cancel").click(function() {
	location.href="./qnaList";
});

</script>

</body>
</html>