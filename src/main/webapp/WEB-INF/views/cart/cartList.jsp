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
<style type="text/css">


.tablewrap{
 width: 1100px;
 
 margin: 0px auto 250px;
 
 
}
table{
width: 1100px;
font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;	

}
.theader{
width:1100px;
height:35px;
text-align: center;
background-color: #FBFAFA;
color: #757575;
font-size: 11px;
border-spacing: 0;
border: 1px solid #e9e9e9;
border-collapse: collapse;
}
.theader td{
border: 1px solid #e9e9e9;
}
.box{
width: 30px;
height:35px;
}
.img{
width:100px;
height:35px;
}
.info{
width: 400px;
height:35px;
}
.price{
width:150px;
height:35px;
}
.amount{
width: 90px;
height:35px;
}
.total{
width:150px;
height:35px;
}
.up{
width:90px;
height:35px;
}
.del{
width:90px;
height:35px;
}
.tbody{
width:1100px;
height: 100px;
border-spacing: 0;
border-collapse: collapse;
border-left: 1px solid #e9e9e9;
border-right: 1px solid #e9e9e9;
border-bottom: 1px solid #e9e9e9;
}
.boxcon{
 text-align: center;
 width: 30px;
 height: 100px;
}
.imgcon{
 text-align: center;
 width: 100px;
 height: 100px;
}
.infocon{
width: 400px;
height:100px;
}
.infocondiv{
width: 400px;
height: 50px;
line-height: 50px;
padding-left: 10px; 
font-size: 11px;
color: #757575;
}
.pricecon{
width: 150px;
height:100px;
text-align: center;
color: #757575;
}
.amountcon{
width: 90px;
height:100px;
text-align: center;
}
.totalcon{
width: 150px;
height:100px;
text-align: center;
color: #757575;
}
.upcon{
width: 90px;
height:100px;
text-align: center;
}
.delcon{
width: 90px;
height:100px;
text-align: center;
}
.btncon{
width: 60px;
height: 25px;
background-color: #6e6e6e;
color: #ffffff;
border: 1px solid #d4d8d9;
}
.empty{
width: 1100px;
height: 100px;
text-align: center;
line-height: 100px;
font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;	
font-size: 12px;
color: #757575;
font-weight: bold;

}
.tfoot{
	width:1100px;
	height: 60px;
	line-height:60px;
	text-align:right;
	
	background-color: #FBFAFA;
	color: #757575;
	border: 1px solid #d4d8d9;
}
.orderwrap{
	margin : 50px auto;
	
	
	text-align: center;
	
}
.orderbtn{
	width:100px;
	height:40px;
	border: 1px solid #d4d8d9;
}
.alldelwrap{
	width: 1100px;
	height: 30px;
	text-align: right;
	margin: 50px auto 20px;
	
}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

<section>
<div class="alldelwrap">
	<button id="alldel" style="width: 120px; height: 30px; background-color: #ffffff;
color: #757575; border: 1px solid #d4d8d9;">장바구니 비우기</button>
</div>
<div class="tablewrap">
	<form action="" method="post" id="frm" onsubmit="return false">
	<table>
	
	<thead>
		<tr class="theader"> 
			<td class="box"><input type="checkbox" id="allcheck"></td>
			<td class="img">이미지</td>
			<td class="info">상품정보</td>
			<td class="price">판매가</td>
			<td class="amount">수량</td>			
			<td class="total">합계</td>
			<td class="up">변경</td>
			<td class="del">삭제</td>
			
		</tr>
   </thead>

	<tbody id="ajaxResult">
		
		
		
	
		
	</tbody>
	
	
	</table>
	</form>
	<div class="orderwrap"><button id="allorder" class="orderbtn" style="background-color: #6e6e6e;
color: #ffffff; margin-left: 60px;">전체상품주문</button>
	<button  id="choiceorder"  class="orderbtn" style="background-color: #ffffff;
color: #757575; margin-left: 10px;">선택상품주문</button></div>
	
	
</div>	
	



</section>


<c:import url="../common/footer.jsp"></c:import>


<script type="text/javascript">
getList();

function getList(){
	$.ajax({
		url:"./cartList",
		type:"POST",
		success: function(data){
			$("#ajaxResult").empty();
			$("#ajaxResult").append(data);
		}
		
		
	});
	

	
	

}

$("#ajaxResult").on("click",".delete",function(){
	 	$.post("./cartDelete",{num:$(this).val()},function(data){
	 		alert(data);
	 		getList();
	 	});
	 	
});
$("#ajaxResult").on("click",".update",function(){
		var num=$(this).val();
 	$.post("./cartUpdate",{
 		num:num,
 		amount:$("#"+num).val()
 		},function(data){
 			alert(data);
	 		getList();
 	});
 		
 	});	 

$("#allcheck").click(function(){
	var t = $(this).prop("checked");
	$(".check").each(function(){
		$(this).prop("checked",t);
	});
})
$("#allorder").click(function(){
	$(".check").each(function(){
		$(this).prop("checked",true);
	});
	check();
		
	
});
$("#choiceorder").click(function(){	
	check();
	
});

$("#alldel").click(function(){
	$.post("./cartAllDelete",{},function(data){
		 data=data.trim();
		 if(data>=0){
			 alert("장바구니를 비웠습니다");
			 getList();
		 }
	});
});

function check(){
	var cnt=0;
	$(".check").each(function(){
		if($(this).prop("checked")){
			$(this).attr("name","arr");
			cnt++;
		}
	});
	if(cnt>0){
		$("#frm").attr("action","../order/cartOrderPage");
		$("#frm").prop("onsubmit","return true");
		$("#frm").submit();
	}else{
		alert("선택된 상품이 없습니다");
	}
		
}
</script>
</body>
</html>