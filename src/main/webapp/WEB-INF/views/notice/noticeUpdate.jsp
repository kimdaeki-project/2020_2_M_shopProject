<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Cabin&display=swap');
	*{margin:0; padding:0; font-family: 'Cabin', sans-serif, 'Arial' ,'Nanum Gothic', sans-serif; list-style: none;}
	
#section{
		width: 1300px;
		height: 900px;
		margin: 0 auto;
	}
	.menu{
		height: 40px;
		margin: 0 auto;
		padding: 0 0 40px 0;
	}
	.menu-name{
		width: 150px;
		height: 40px;
		margin: 40px auto;
		line-height: 40px;
		text-align: center;
		border : 1px solid black;
		font-size: 12px;
	}
	table{
		width: 1140px;
		height: 80px;
		margin: 50px auto 0;
		border-collapse: collapse;
	}
	th{
		text-align: center;
	}
	tr{
		width: 150px;
		height: 15px;
		font-size: 11px;
		background-color: #fbfafa;
		border: 1px solid #e8e8e8; 
	}
	.td{
		width: 1000px;
		height: 15px;
		font-size: 11px;
		background-color: white;
		border: 1px solid #e8e8e8; 
	}
	.form-control{
		margin: 0 0 0 10px;
		height: 25px;
		width: 400px;
		border: 1px solid #e8e8e8; 
	}
	.title{
		width: 600px;
	}
	.form-group{
		width: 1140px;
		margin: 0 auto;
	}
	.button{
		width: 1140px;
		height: 50px;
		margin: 0 auto;
	}
	.button-b{
		width: 50px;
		height: 35px;
		font-size: 11px;
		float: right;
		margin: 13px 0 0 0;
		border: 1px solid #d4d8d9;
		text-align: center;
		line-height: 35px;
	}
	.button-b:hover{
		background-color: #d4d8d9;
		color: white;
	}
	.ch{
		margin: 13px 0 0 10px;
		background-color: #6e6e6e;
		color: white;	
	}
</style>
<title>Update</title>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>

	<!-- Section -->
	<div id="nav_pa">
		<div id="nav">
			<a href="https://pf.kakao.com/_FxhtqC" target="_blank"><img class="nav_img" alt="" src="${pageContext.request.contextPath}/resources/images/kakaoic.png" width="50px"></a>
			<a href="https://talk.naver.com/ct/wc0vxm" target="_blank"><img class="nav_img" alt="" src="${pageContext.request.contextPath}/resources/images/talkic.png" width="50px"></a>
			<img id="page_up" class="nav_arrow" alt="" src="${pageContext.request.contextPath}/resources/images/upic.png">
			<img id="page_down" class="nav_arrow" alt="" src="${pageContext.request.contextPath}/resources/images/downic.png">
		</div>
	</div>
	
	<div id="section">
		<div class="menu">
			<div class="menu-name">공지사항</div>
		</div>
    <form id="frm" action="./noticeUpdate" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>제목</th>
			<td class="td"><input class="title form-control" type="text" id="title" value="${dto.title}" name="title" required="required"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td class="td"><input class="form-control" type="text" id="writer" value="${dto.writer}" name="writer" required="required"></td>
		</tr>
	</table>
	
 	<div class="form-group">
      	<textarea class="form-control" rows="10" id="contents" name="contents">${dto.contents}</textarea>
    </div>
    
		<div class="button">
			<input type="hidden" id="num" name="num" value="${dto.num}">
			<input type="button" id="exit" class="button-b ch" value="취소">
			<button type="submit" class="button-b li">수정</button>
		</div>
	</form>
	
	</div>
	
	<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
	

	
	<script type="text/javascript">
	
	$("#exit").click(function() {
		location.href="./noticeSelect?num=${dto.num}";
	});
	
	var count=0;
 	
	$('#contents').summernote({
		height:500,
	 	callbacks:{
			 onImageUpload:function(files, editor, welEditable){
				 var formData = new FormData();	    //가상의 from 태그 작성
				 formData.append('file', files[0]); //파라미터 이름 file
			 
				 $.ajax({
				    data: formData,
				    type: "POST",
				    url: 'summernote',
				    enctype: 'multipart/form-data',
				    cache: false,
				    contentType: false,
				    processData: false,
					 success:function(data){
						 data = data.trim();
						 data="../resources/upload/notice/"+data;
						 $("#contents").summernote('editor.insertImage', data);
					 }
				 })
			 },//upload End
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


	// Page Up, Page Down
	$(document).ready(function() {		
		
		$('.sub_hover').hover(function() {
			$('.sub_menu',this).stop().slideDown(200);
		},
			function() {
				$('.sub_menu',this).stop().slideUp(200);
			});
		
		$(function(){
			$('#page_up').click(function() {
				$('body,html').animate({
					scrollTop: 0
				}, 300);
				return false;
			});
			
		var page = $(document).height();
			$('#page_down').click(function() {
				$('body,html').animate({
					scrollTop: page
				}, 300);
				return false;
			});
		});	
	
	// Header Fixed	
		var fix = $('#header_menu').offset();
			$(window).scroll(function() {
				if($(document).scrollTop()>fix.top){
					$('.fxMenu').addClass('fixed');
					$('.fxMenu').addClass('po_opa');
					$('.logo').css('height','3px');
					$('.fxMenu').css('height','121px');
					$('.fxMenu').css('z-index','100');
					
				}else{
					$('.fxMenu').removeClass('fixed');
					$('.fxMenu').removeClass('po_opa');
					$('.logo').css('height','27px');
					$('.fxMenu').css('height','144px');
				}
			});
	
	});

	</script>
	
</body>
</html>
