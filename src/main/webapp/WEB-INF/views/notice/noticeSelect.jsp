<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">
<style type="text/css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Cabin&display=swap');
	*{margin:0; padding:0; font-family: 'Cabin', sans-serif, 'Arial' ,'Nanum Gothic', sans-serif; list-style: none;}
	
	#section{
		width: 1300px;
		height: 1200px;
		margin: 0 auto;
	}
	.menu{
		height: 50px;
		margin: 30px auto;
		padding: 0 0 30px 0;
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
		height: 500px;
		margin: 0 auto;
		border-collapse: collapse;
/* 		overflow: hidden;
		height: auto; */
	}
	th{
		width: 150px;
		height: 35px;
		font-size: 11px;
		background-color: #fbfafa;
		border: 1px solid #e8e8e8; 
	}
	.td{
		width: 1000px;
		height: 35px;
		font-size: 11px;
		padding: 0 0 0 20px;
		border: 1px solid #e8e8e8; 
	}
	span{
		margin: 0 auto;
	}
	.contents{
		vertical-align: top;
		padding: 20px 0 0 0;
	}
	.tr{
		border: 1px solid #e8e8e8;
		width: 1000px;
		text-align: center;
	}
	.button{
		width: 1140px;
		height: 50px;
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
	.de{
		background-color: #d4d8d9;
		margin: 13px 0 0 10px;
	}
	.notice-list{
		width: 1150px;
		height: 70px;
		margin: 90px auto;
	}
	.prev-notice{
		width: 1140px;
		height: 30px;
		border: 1px solid #d4d8d9;
		line-height: 30px;
	}
	strong{
		font-size: 11px;
		padding: 10px 50px 10px 50px;
		border-right: 1px solid #d4d8d9;
	}
	.notice-title{
		padding: 0 0 0 20px;
		font-size: 13px;
	}
	.next-notice{
		width: 1140px;
		height: 30px;
		border-bottom: 1px solid #d4d8d9;
		border-left: 1px solid #d4d8d9;
		border-right: 1px solid #d4d8d9;
		line-height: 30px;
	}
	
</style>
<title>Select</title>
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
		
		<table>
			<tr>
				<th>제목</th>
				<td class="td"><p>${dto.title}</p></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td class="td"><p>${dto.writer}</p></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td class="td"><p>${dto.regDate}</p></td>
			</tr>
			<tr hidden="true">
				<th>PK</th>
				<td class="td"><p>${dto.num}</p></td>
			</tr>
			<tr class="tr">
			<td colspan="2" class="contents">${dto.contents}</td>
			</tr>
	
		</table>
		
		<div class="button">
			<input type="button" id="exit" class="button-b ch" value="목록">
			<c:choose>
	  				<c:when test="${member.auth==1}">
						<div class="write">
							<input type="button" id="del" class="button-b de" title="${dto.num}" value="삭제">
							<input type="button" id="update" class="button-b li" value="수정">
						</div>
					</c:when>
			</c:choose>
		</div>
		
	<%-- 	 <div class="notice-list">
			<ul>
				<li class="prev-notice">
				<strong>이전글</strong>
				<c:if test="${dto.prevNum != 0 }">
					<a id="prevNotice" class="notice-title" href="./noticeSelectPrev?num=${dto.prevNum}">${dto.prevTitle}</a>
				</c:if>
				</li>
				<li class="next-notice">
				<strong>다음글</strong>
				<c:if test="${dto.nextNum != 0 }">
					<a id="nextNotice" class="notice-title" href="./noticeSelectNext?num=${dto.nextNum}">${dto.nextTitle}</a>
				</c:if>
				</li>
			</ul>
		</div>  --%>
	</div>
	

	<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
	<script type="text/javascript">
	
	$("#exit").click(function() {
		location.href="./noticeList";
	});
	
	$("#update").click(function() {
		location.href="./noticeUpdate?num=${dto.num}";
	});
	
	$("#del").click(function() {
		//var num = $("#num").html();
		var num = $(this).attr("title");
		location.href="./noticeDelete?num="+num;
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
	
	// 이전글, 다음글 function
		

	</script>
	
</body>
</html>
