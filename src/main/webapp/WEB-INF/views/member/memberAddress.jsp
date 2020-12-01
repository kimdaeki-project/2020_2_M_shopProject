<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/bootStrap.jsp"></c:import>
<title>Insert title here</title>
<link rel="stylesheet"href="../resources/css/common/common.css">
<style type="text/css">
.addrwrap {
	margin: 150px auto;
	width: 950px;
}

.addrtable {
	border: 1px solid #e8e8e8;
	width: 950px;
	border-collapse: collapse;
}

.addrheader {
	border-bottom: 1px solid #e8e8e8;
}
.addrfix{
width: 50px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	font-size: 11px;
	background-color: #fbfafa;
	color: #757575;
}
.addrperson {
	width: 200px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	font-size: 11px;
	background-color: #fbfafa;
	color: #757575;
}

.addrphone {
	width: 200px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	font-size: 11px;
	background-color: #fbfafa;
	color: #757575;
}

.addr {
	width: 300px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	font-size: 11px;
	background-color: #fbfafa;
	color: #757575;
}

.addrdelete {
	width: 100px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	font-size: 11px;
	background-color: #fbfafa;
	color: #757575;
}

.addrinfo {
	width: 950px;
	height: 40px;
	text-align: center;
	font-size: 11px;
	line-height: 30px;
	color: #757575;
	font-weight: bold;
	border-bottom: 1px solid #e8e8e8;
}

.selectbtn {
	width: 60px;
	height: 30px;
	margin-left: 10px;
	line-height: 30px;
	background-color: #6e6e6e;
	color: #ffffff;
	border: 1px solid #e8e8e8;
}

.writewrap {
	margin: 0px auto;
	width: 950px;
	height: 100px;
	
	text-align: right;
}
.writebtn{
	width: 100px;
	height: 40px;
	text-align: center;
	background-color: #6e6e6e;
	color: #ffffff;
	border: none;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
		<div class="addrwrap">
			
		
		</div>
		<div class="writewrap">
			<button class="writebtn">배송지등록</button>
		</div>
	
	<c:import url="../common/footer.jsp"></c:import>
	<script type="text/javascript">
	var count;
	 getList();
	function getList(){
		$.post("./memberAddress",{},function(data){
			$(".addrwrap").empty();
			$(".addrwrap").append(data);
		});
		
		
	}
		
	$(".addrwrap").on("click",".delbtn",function(){
		var num =$(this).attr("id");
		$.post("./memberAddressDelete",{
			num:num
		},function(data){
			data=data.trim();
			if(data>0){
				alert("삭제성공");
				
			}else{
				alert("삭제실패");
			}
			getList();
		});
		
	});
	
	$(".addrwrap").on("click",".upbtn",function(){
			var num=$(this).val();
			location.href="./memberAddressUpdate?num="+num;
		
	});
	
	$(".addrwrap").on("click",".fix",function(){
			var checked=$(this).prop("checked");
			if(checked){
				$(this).val(1);
			}else{
				$(this).val(0);
			}
			$.post("./memberAddressFixUpdate",{
				num:$(this).attr("name"),
				fix:$(this).val()			
			},function(data){
				data=data.trim();
				if(data>0){
					alert("수정 성공");
				}else{
					alert("수정 실패");
				}
			});
	      
	});

	$(".writebtn").click(function(){
		if(count>=5){
			alert("배송지 정보는 최대 5개까지 등록가능합니다");
		}else{
			location.href="./memberAddressInsert";
		}
		
	});
	</script>
	<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>