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
   
	.btn-write{
	  float:right;
   	  border: none;
	  background-color: #6e6e6e;
	  color: white;
   }
   
    .btn-cancel{
      float:right;
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
  <form id="frm" action="./qnaReply" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="num" value="${param.num}">
  <table>
  	<tr class="group" style="height:70px;">
  		<td class="leftrow">제목</td>
  		<td><input style="height: 30px; width: 180px;" id="title" name="title" required="required"></td>
  	</tr>
  	
  	<tr class="group" style="height:70px;">
  		<td class="leftrow">작성자</td>
  		<td><input readonly="readonly" style="height: 30px; width: 180px;" class="inputTypeText" value="${member.id}" id="writer" name="writer" required="required"></td>
  	</tr>
  	
  	<tr class="group">
  		<td colspan="2" style="padding-left: 0px;">
  			<textarea class="form-control"  rows="5" id="contents" name ="contents"></textarea>
  		</td>
  	</tr>
  	
  
  	
  </table>
    
	<input type="button" title="${dto.num}" value="취소" class="btn btn-cancel" id="cancel">
	<button type="submit" class="btn btn-write" id="write">등록</button>
    	
  </form>
  
</div>
<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript">
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
		}//upload 끝
	
		
		}
	});
	
$('#contents').summernote('code', '※이미 처리된 게시글의 답글은 확인이 어려울 수 있으니 재문의는 꼭 새 게시글 작성으로 부탁드립니다!<br><br>');

$("#cancel").click(function() {
    location.href="./qnaList?num=${dto.num}";
 });

</script>

</body>
</html>