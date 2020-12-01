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
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
				border: 1px solid #e8e8e8;
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

<div class="search_title">
  <span id="search" ><font color="333333">문의게시판</font></span>
</div>

<form id="frm" action="./qnaUpdate" method="post" enctype="multipart/form-data">
  
<input type="hidden" name="num" value="${dto.num}">

<table>
	<tr>
		<td class="leftrow">제목</td>
		<td><input style="width:180px;" type="text" class="inputTypeText" id="title" name="title" value="${dto.title}" required="required"> 
    	</td>
	</tr>
	
	<tr>
		<td class="leftrow">작성자</td>
		<td><input type="text" style="width:180px;" class="inputTypeText" id="writer" readonly="readonly" name="writer" value="${dto.writer}" required="required">
    	</td>
	</tr>
	
	<tr>
		<td colspan="2" style="padding-left: 0px;">
		<textarea class="inputTypeText" rows="5" id="contents" name="contents">${dto.contents}</textarea>
    	</td>
	</tr>
	
</table>

    <div style="text-align: right;" >
		<button type="submit" class="btn btn-write" id="write">등록</button> 
		<input type="button" title="${dto.num}" value="취소" class="btn btn-cancel" id="cancel">
	</div>
  </form>
   
</div> 

<c:import url="../common/footer.jsp"></c:import>

<script type="text/javascript">
var count = 0;
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
	
	
$("#cancel").click(function() {
    location.href="./qnaList?num=${dto.num}";
});

</script>

</body>
</html>