<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<title>Insert title here</title>

<style type="text/css">
   *{
		margin: 0;
		padding: 0;
		font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
		text-decoration: none;
   }
   
   #subject{
   		cursor: pointer;
   }
   
   .search_container{
      width: 1140px;
      height: 80px;
      margin: 0 auto;
   }
   .search-form{
      width:25%;
      height: 60px;
      margin: 0 auto;
   }
   select{
      float: left;
      height: 22px;
      margin: 0 3px 0 0;
      font-size: 11px;
      border: 1px solid #d5d5d5;
      
   }
   #search_input{
      float:left;
      height: 22px;
      width: 150px;
      border: 1px solid #d5d5d5;
      font-size: 11px;
   }
   
   .search-button{
   	  float:left;
      width: 49px;
      height: 22px;
      background-color: white;
      border: 1px solid #d5d5d5;
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
		border: 1px solid #e8e8e8;
		color: #353535;
		font-size: 11px;
		padding: 60px;
		line-height: 14
		0%;

	}
	
	.table td{
	height: 30px;
	}
	
	#index {
		letter-spacing: 0.5px;
		padding: 12px 0 10px;
		border-right: 0px solid #e3e3e3;
		background: #fbfafa;
		font-weight: normal;
		text-align: center;
	}
	
	.subject{
		text-decoration: none;
		cursor: pointer;
		color: #555555;
	}
	
	.page{
		padding: 80px 0 0;
		text-align: center;
		margin-bottom: 25px;
	}
	
	.page a{
		color: #313131;
		text-decoration: none;
	}
	
	.btn_write a {
	float: right;
    margin: 0 0px 4px 1px;
    clear: both;
    background: #fff;
    border: 1px solid #d4d8d9;
    color: #757575;
    font-family: '맑은 고딕','돋움' sans-serif;
    letter-spacing: 0px;
    padding: 15px;
    text-align: right;
    font-size: 11px;
    border-radius: 2px;
    font-weight: normal;
}

</style>



</head>
<body>
<c:import url="../common/header.jsp"></c:import>

<div class="container">
<div class="qna_title">
  <span id="qna" ><font color="333333">문의게시판</font></span>
</div>
     <div class="row">
        <div class="col-sm-8">
           <form id="searchForm" action="./qnaList">
              <input type="hidden" name="curPage" id="curPage">
              <input type="hidden" id="${member.auth}" class="admin">
           </form>
        </div>
     </div>
  
  <table class="table" style="width: 1140px;">
     <tr id="index">
        <td>NO</td>
        <td>SUBJECT</td>
        <td>NAME</td>
        <td>DATE</td>
        
     </tr>
     
     <c:forEach items="${list}" var="dto" varStatus="vs">
      <tr>
      	<c:set var="num" value="${pager.totalCount - ((pager.curPage-1) * 20) - vs.index}"/>
        <td style="text-align: center;" width="80px">${num}</td>
        
        <td width="860px"><a  title="${dto.num}" class="subject">
        <c:catch>
        <c:forEach begin="1" end="${dto.depth}"><img src="../resources/images/ico_re.gif"> </c:forEach>
		</c:catch>
		<img src="../resources/images/ico_lock.gif"> ${dto.title}</a></td>
		
        <td style="text-align: center;" width="100px">${fn:substring(dto.writer,0,1)}****</td>
        
        <td style="text-align: center;" width="100px">${dto.regDate}</td>
        
       
      </tr>
    </c:forEach>
  
  </table>

<div>
<c:if test="${member.id!=null}">
	<span class="btn_write">
	<a href="./qnaWrite" >글쓰기</a>
	</span>
</c:if>
</div>
 
  <div class="page" >
   <c:if test="${pager.beforeCheck}">
      <a href="./${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"><</a>
      </c:if>
     <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
        <a href="./${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}" id="${i}">${i}</a>
     </c:forEach>
     <c:if test="${pager.nextCheck}">
     <a href="./${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">></a>
     </c:if>
  </div>

<form>
<div class="search_container">
         <div class="search-form">
            <select id="kind" name="kind">
               <option value="tt">제목</option>
               <option value="con">내용</option>
               <option value="wr">글쓴이</option>
            </select>
				<input id="search_input" type="text" name="search">
                <button type="submit" class="search-button">찾기</button>
         </div>
</div>
</form>
</div>
<c:import url="../common/footer.jsp"></c:import>
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

	$(".subject").click(function(){
		var checkPw;
		var adminId = $(".admin").attr('id');
		var num = $(this).attr('title');
		
		if(adminId==1){
			
			$.post("./pwCheck",{num:num},function(data){
				data=data.trim();
				data;
				location.href ="./qnaSelect?num="+num+"&qnaPw="+data;
			});
			
		}else{
		var pw = prompt('비밀번호 숫자 4자리를 입력하세요.','');
		$.post("./pwCheck",{num:num},function(data){
			data=data.trim();
			checkPw=data;
			if(pw == checkPw){
				location.href ="./qnaSelect?num="+num+"&qnaPw="+checkPw;
			}else{
				alert("비밀글 비밀번호가 틀립니다.");
				location.href="./qnaList";
			}
		});
		
	  }
	});
	
</script>

</body>
</html>