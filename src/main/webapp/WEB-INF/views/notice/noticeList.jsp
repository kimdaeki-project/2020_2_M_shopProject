<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Cabin&display=swap');
	*{margin:0; padding:0; font-family: 'Cabin', sans-serif, 'Arial', '돋움' ,'Nanum Gothic', sans-serif; list-style: none;}
	
	#section{
		width: 1300px;
		height: 700px;
		margin: 0 auto;
	}
	.menu{
		height: 40px;
		margin: 0 auto 60px;
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
		margin: 0 auto;
		border-collapse: collapse;
		font-size: 11px;
		color: #555555
	}
	.td{
		text-align: center;
	}
	tr{
		height: 40px;
		border: 1px solid #e3e3e3;
	}
	.title{
		background-color: #FBFAFA;
		border: 1px solid #e3e3e3;
	}
	.num{
		width: 100px;
		height: 23px;
		padding: 10px 0 10px 0;
	}
	.subject{
		width: 850px;
		height: 23px;
		padding: 10px 0 10px 0;
	}
	.name{
		width: 100px;
		height: 23px;
		padding: 10px 0 10px 0;
	}
	.date{
		width: 100px;
		height: 23px;
		padding: 10px 0 10px 0;
	}
	.page{
     	text-align: center;
     	font-size: 13px;
   }
   
   .page a{
     	color: #000;
     	margin-right: 20px;
      	text-decoration: none;
   }
	.page{
		margin: 30px 0 0 0;
	}
   .search_container{
      width: 1140px;
      height: 30px;
      margin: 20px auto;
   }
   .search-form{
      width: 290px;
      height: 30px;
      margin: 0 auto;
   }
   select{
      float: left;
      height: 25px;
      width: 60px;
      margin: 2px 3px 0 0;
      font-size: 11px;
      border: 1px solid #d5d5d5;
      
   }
   .write{
	  height: 50px;
	  width: 1150px;
	  margin: 0 auto;
   }
   .write-button{
	 	width: 50px;
		height: 35px;
		font-size: 11px;
		float: right;
		margin: 13px 0 0 10px;
		border: 1px solid #d4d8d9;
		background-color: white;
		text-align: center;
		line-height: 35px; 
   }
   .write-button:hover{
   		background-color: #d4d8d9;
		color: white;
   }
   #search_input{
      height: 26px;
      width: 150px;
      border: 1px solid #d5d5d5;
      font-size: 11px;
   }
   .search-button{
      width: 50px;
      height: 26px;
      margin: 2px 0 0 0;
      background-color: white;
      border: 1px solid #d5d5d5;
      font-size: 11px;
   }
	

</style>
<title>List</title>
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
			<tr class="title">
				<td class="num td">NO</td>
				<td class="subject td">SUBJECT</td>
				<td class="name td">NAME</td>
				<td class="date td">DATE</td>
			</tr>
			
			<c:forEach items="${list}" var="dto" varStatus="vs">
				<tr>
					<c:set var="num" value="${pager.totalCount - ((pager.curPage-1) * 20 ) - vs.index}"/>
	 				<td class="td">${num}</td>
	                <td><a href="./noticeSelect?num=${dto.num}">
	  					${dto.title}
	  					</a></td>
	            	<td class="td">${dto.writer}</td>
	  				<td class="td">${dto.regDate}</td>
  				</tr>
            </c:forEach>
		</table>
		
		<c:choose>
  				<c:when test="${member.auth==1}">
					<div class="write">
						<input type="button" id="write" class="write-button" value="글쓰기">
					</div>
				</c:when>
		</c:choose>
		
		<div class="page" >
   			<c:if test="${pager.beforeCheck}">
     			 <a href="./noticeList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"><</a>
     	 	</c:if>
     		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
        		<a href="./noticeList?curPage=${i}&kind=${pager.kind}&search=${pager.search}" id="${i}">${i}</a>
     		</c:forEach>
     		<c:if test="${pager.nextCheck}">
     			<a href="./noticeList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">></a>
     		</c:if>
  		</div>
		
		<div class="search_container">
		    <div class="row">
        <div class="col-sm-8">
           <form id="searchForm" action="./noticeList">
              <input type="hidden" name="curPage" id="curPage">
           </form>
        </div>
     </div>
     
     <form>
		<div class="search_container">
		         <div class="search-form">
		            <select id="kind" name="kind">
		               <option value="tt">제목</option>
		               <option value="wr">글쓴이</option>
		               <option value="con">내용</option>
		            </select>
		            <input  id="search_input" type="text" name="search" >
		                <button type="submit" class="search-button" >찾기</button>
		         </div>
			</div>
		</form>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
	
	<script type="text/javascript">
	$("#"+${pager.curPage}).css("color","red");
	var kind ='${pager.kind}';
	var search='${pager.search}';
	if(kind==''){
		$("#kind").val("tt");
	}else{
		$("#kind").val(kind);
	}
	$("#search_input").val(search);
	
	$("#write").click(function() {
		location.href="./noticeWrite";
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
