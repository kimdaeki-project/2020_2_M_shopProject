<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../resources/js/address/address2.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">

<title>Insert title here</title>
<style type="text/css">
	.wrap{
		margin: 50px auto;
		width: 1000px;
		height: 400px; 
		border:1px solid #e8e8e8;
		padding-top: 70px;
	}
	.infotitle {
	color: #666666;
	padding-left: 15px;
	font-size: 16px;
	}
	table {
	margin-left:80px;
	
	}
	.btnwrap{
		margin: 50px auto;
		width: 1000px;
		height: 40px; 
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
	<div class="wrap">
	<table>
		<tr>
					<td class="infotitle"><span>받는사람</span><img alt=""
						src="../resources/images/orderrequired.png"></td>
					<td><input type="text"
						style="width: 300px; height: 40px; margin-left: 50px; margin-top: 10px;"
						id="takePerson"></td>
				</tr>
				<tr>
					<td class="infotitle"><span>휴대전화</span><img alt=""
						src="../resources/images/orderrequired.png"></td>
					<td><input type="text"
						style="width: 300px; height: 40px; margin-left: 50px; margin-top: 10px;"
						id="takePhone"></td>
				</tr>
				<tr>
					<td class="infotitle"><span>주소</span><img alt=""
						src="../resources/images/orderrequired.png"></td>
					<td><input type="text" id="takeAddr1"
						style="width: 150px; height: 40px; margin-left: 50px; margin-top: 10px; margin-right: 20px;"
						name="orderAddr2">
						<button
							style="width: 100px; height: 40px; background-color: white; border: 1px solid #d4d8d9;"
							onclick="execPostCode2();">주소검색</button></td>

				</tr>
				<tr>
					<td class="infotitle"><span></span></td>
					<td><input type="text" id="takeAddr2"
						style="width: 630px; height: 40px; margin-left: 50px; margin-top: 10px;"
						name="orderAddr2"></td>
				</tr>
				<tr>
					<td class="infotitle"><span></span></td>
					<td><input type="text" id="takeAddr3"
						style="width: 630px; height: 40px; margin-left: 50px; margin-top: 10px;">
					</td>
				</tr>
	</table>
	</div>
	<div class="btnwrap">
		<button class="writebtn" id="write" type="button">배송지등록</button>
		<button class="writebtn" id="cancel" style="margin-left: 10px;" type="button" >취소</button>
	</div>
	
		
	
	<c:import url="../common/footer.jsp"></c:import>
	
	<script type="text/javascript">
		
	$("#write").click(function(){
		
		var takePerson =$("#takePerson").val();
		var takePhone =$("#takePhone").val();
		var takeAddr1 =$("#takeAddr1").val();
		var takeAddr2 =$("#takeAddr2").val();
		var takeAddr3 =$("#takeAddr3").val();
		if(takePerson.length>0&&takePhone.length>0&&takeAddr1.length>0&&takeAddr2.length>0&&takeAddr3.length>0){
			$.post("./memberAddressInsert",{
				takePerson:takePerson,
				takePhone:takePhone,
				takeAddr1:takeAddr1,
				takeAddr2:takeAddr2,
				takeAddr3:takeAddr3				
			},function(data){
				data=data.trim();
				if(data==0){
					alert("이미 등록된 배송지 정보입니다");
				}
					else{
				
					alert("배송지정보를 등록하였습니다");
					location.href="./memberAddress";
				}
			});
		}else{
			alert("배송지 정보를 모두 입력해주세요");
		}
		
	});
	
		
		$("#cancel").click(function(){
			
			location.href="./memberAddress";
		});
		
	</script>
	
</body>
</html>