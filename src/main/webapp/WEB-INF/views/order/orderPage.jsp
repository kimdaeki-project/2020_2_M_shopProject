<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../resources/js/address/address.js"></script>
<script type="text/javascript" src="../resources/js/address/address2.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../resources/css/common/common.css">
<!-- jQuery library -->


<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
.wrap{
	background-color:#fbfafa;
	margin: 50px auto;
	width:802px;
	border: 1px solid #d4d8d9;
	overflow: hidden;
}
	.formwrap {
	background-color: white;
	width: 800px;
	height: 400px;
	margin: 100px auto;
	border-top: 1px solid #d4d8d9;
	border-bottom: 1px solid #d4d8d9;
	overflow: hidden;
}

.title {
	width: 800px;
	height: 49px;
	border-bottom: 1px solid #d4d8d9;
	font-size: 18px;
	font-weight: bold;
	padding-left: 15px;
	line-height: 49px;
}

table input {
	border: 1px solid #d4d8d9;
	
}

.infotitle {
	color: #666666;
	padding-left: 15px;
	font-size: 16px;
}

.prowrap {
	background-color: white;
	width: 800px;
	margin: 100px auto;
	border-top: 1px solid #d4d8d9;
	border-bottom: 1px solid #d4d8d9;
}

.product {
	background-color: white;
	width: 800px;
	height: 150px;
	margin: 0 auto;
}

.proimg {
	width: 150px;
	height: 150px;
	float: left;
	line-height: 150px;
}

.proinfo {
	width: 500px;
	height: 150px;
	float: left;
	line-height: 30px;
	color: #666666;
	padding-top: 18px;
}

.delwrap {
	width: 150px;
	height: 150px;
	float: left;
	text-align: right;
	padding-top: 10px;
}

#delspan {
	border: 1px solid #757575;
	color:#757575;
	width: 30px;
	height: 30px;
	cursor: pointer;
}

.pointwrap {
	margin-top: 20px;
	margin-left: 20px;
}

#buy {
	width: 800px;
	height: 50px;
	background-color: #4a5164;
	color: white;
	text-align: center;
	line-height: 50px;
	font-size: 18px;
	font-weight: bold;
	margin: 50px auto 0px;
	cursor: pointer;
}

.input {
	display: none;
}
#pointinfo{
	color: #508bed;
	font-size: 11px;
}
</style>


</head>
<body>
	<c:import url="../common/header.jsp"></c:import>


	<div class="wrap"> 

	<div class="formwrap">
		<div class="title">주문자</div>
		<div>
			<table>
				<tr>
					<td class="infotitle"><span>주문자</span><img alt=""
						src="../resources/images/orderrequired.png"></td>
					<td><input type="text"
						style="width: 300px; height: 40px; margin-left: 50px; margin-top: 10px;"
						value="${userInfo.name}" id="orderName"></td>
				</tr>
				<tr>
					<td class="infotitle"><span>휴대전화</span><img alt=""
						src="../resources/images/orderrequired.png"></td>
					<td><input type="text"
						style="width: 300px; height: 40px; margin-left: 50px; margin-top: 10px;"
						value="${userInfo.phone}" id="orderPhone"></td>
				</tr>
				<tr>
					<td class="infotitle"><span>주소</span><img alt=""
						src="../resources/images/orderrequired.png"></td>
					<td><input type="text"
						style="width: 150px; height: 40px; margin-left: 50px; margin-top: 10px; margin-right: 20px;"
						value="${userInfo.addr1}" id="orderAddr1">
						<button
							style="background-color: white; width: 100px; height: 40px; border: 1px solid #d4d8d9;"
							onclick="execPostCode();" name="addr1">주소검색</button></td>

				</tr>
				<tr>
					<td class="infotitle"><span></span></td>
					<td><input type="text"
						style="width: 630px; height: 40px; margin-left: 50px; margin-top: 10px;"
						value="${userInfo.addr2}" id="orderAddr2" name="addr2"></td>
				</tr>
				<tr>
					<td class="infotitle"><span></span></td>
					<td><input type="text"
						style="width: 630px; height: 40px; margin-left: 50px; margin-top: 10px;"
						value="${userInfo.addr3}" id="orderAddr3"></td>
				</tr>
			</table>

		</div>
	</div>

	<div class="formwrap">
		<div class="title">배송지</div>
		<div>
			<table>
				<tr>
					<td class="infotitle"><input type="radio" name="dest"
						style="margin-top: 15px;" id="infobtn">주문자 정보</td>
					<td class="infotitle"><input type="radio" name="dest"
						style="margin-top: 15px;" id="newbtn">새로운 배송지
						<select id="sel" style="margin-left: 400px; width: 150px; text-align: center;" onchange="addr()">
							<option value="0">배송지목록</option>
							<c:forEach items="${addressList}" var="addr">
								<option label="${addr.takePerson}님의 배송지" id="${addr.takePhone}" class="${addr.takeAddr1}" title="${addr.takeAddr2}" value="${addr.takeAddr3}">${addr.takePerson}</option>
							</c:forEach>
						</select>
						</td>
					
				</tr>
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
	</div>



	<div class="prowrap">
		<div class="title">주문상품</div>
		<c:forEach items="${list}" var="dto">
			<section class="product">

				<div class="proimg">
					<img alt=""
						src="../resources/upload/product/${dto.productDTO.imgName}"
						style="height: 100px; width: 100px; margin-left: 10px;">
				</div>
				<div class="proinfo">

					<ul>
					<li style="display: none;"><input type="text"
							value="${dto.num}" class="cartNum"
							name="num"></li>
						<li style="display: none;"><input type="text"
							value="${dto.productNum}" class="input productNum"
							name="productNum"></li>
						<li style="color: #333333; font-weight: bold;">${dto.productDTO.name}</li>
						<li>[옵션: 색상:<input type="text" value="${dto.color}"
							name="color" class="input color">${dto.color} 사이즈:<input
							type="text" value="${dto.sizing}" name="sizing"
							class="input sizing">${dto.sizing}]</li>
						<li>수량: <input type="text" value="${dto.amount}"
							name="amount" class="input amount">${dto.amount}개</li>
						<li>상품구매금액: <input type="text"
							value="${dto.totalPrice}"
							style="border: none; outline: none;" readonly="readonly"
							class="price" name="price"></li>
					</ul>

				</div>
				<div class="delwrap">
					<span id="delspan" class="delbtn">X</span>
				</div>


			</section>
		</c:forEach>
	</div>

	<div class="formwrap">
		<div class="title">결제금액</div>
		<div class="pointwrap">
			<p style="font-size: 15px; font-weight: bold;">
				적립금(사용가능: <span style="color: #508bed; margin: 0px;">${member.point}</span>원)
			</p>
			<input type="number"
				style="width: 500px; height: 40px; border: 1px solid #d4d8d9;"
				id="pointinput" min="0" max="${member.point}" value="0">
			<button
				style="width: 100px; height: 40px; background-color: white; border: 1px solid #d4d8d9; margin-left: 10px; font-size: 13px; font-weight: bold;"
				id="allpoint">전액사용</button>
				<p id="pointinfo"></p>
		</div>
		<div class="pointwrap">

			<span style="font-size: 15px; font-weight: bold;">결제금액</span><input
				type="text" readonly="readonly"
				style="width: 300px; height: 40px; border: none; background-color: #eff1f4; outline: none; font-size: 15px; font-weight: bold; text-align: right;"
				id="total">
		</div>
	</div>



	<div id="buy">결제하기</div>

</div>

	<c:import url="../common/footer.jsp"></c:import>


	<script type="text/javascript">
	function addr(){
		if($("#sel option:selected").val()!=0){
			var takePerson  =$("#sel option:selected").text();	
			var takePhone  =$("#sel option:selected").attr("id");	
			var takeAddr1  =$("#sel option:selected").attr("class");	
			var takeAddr2  =$("#sel option:selected").attr("title");	
			var takeAddr3  =$("#sel option:selected").val();	
			$("#takePerson").val(takePerson);
			$("#takePhone").val(takePhone);
			$("#takeAddr1").val(takeAddr1);
			$("#takeAddr2").val(takeAddr2);
			$("#takeAddr3").val(takeAddr3);
		}
		
	}
	 function totalCal(){
         var t=0;
         $(".price").each(function(){
            t+=($(this).val()*1);            
         });
         total=t;
         $("#total").val(total);
         
      }
		 totalCal();
		
		
		  
		 
		$("#infobtn").click(function(){
				$("#takePerson").val($("#orderName").val());
				$("#takePhone").val($("#orderPhone").val());
				$("#takeAddr1").val($("#orderAddr1").val());
				$("#takeAddr2").val($("#orderAddr2").val());
				$("#takeAddr3").val($("#orderAddr3").val());
		});
		$("#newbtn").click(function(){
			$("#takePerson").val("");
			$("#takePhone").val("");
			$("#takeAddr1").val("");
			$("#takeAddr2").val("");
			$("#takeAddr3").val("");
	});
		
		$(".delbtn").click(function(){
			$(this).parents("section").remove();
			totalCal();
			$("#pointinput").val(0);
		});
		
		$("#pointinput").blur(function(){
			var t=$(this).val()*1;
			if(t>${member.point}){
				alert("보유하신 적립금보다 금액이 많습니다");
				$(this).val(0);
			}else if(t<0){
				alert("최소 0원부터 사용가능합니다");
				$(this).val(0);
			}else{
				
				var to =total*0.5;
				if(t>to){
					t=to;
					$("#pointinfo").html("적립금은 최대 구매액의 50%까지 사용 가능합니다");
					
				}else{
					$("#pointinfo").html("");				
				}
					var s=$("#pointinput").val(t);
					$("#total").val(total-t);
						
				
			}
		});
		
		$("#allpoint").click(function(){
			var p=${member.point};
			var t =total*0.5;
			if(p>t){
				p=t;
				$("#pointinfo").html("적립금은 최대 구매액의 50%까지 사용 가능합니다");
			
			}else{
				$("#pointinfo").html("");
			}
			$("#pointinput").val(p);
				
				
				
				$("#total").val(total-p);
			
			
			
		});
		
		 var total;
		 var color =[];
	     var sizing=[];
	     var productNum=[];
	     var amount=[];
	     var price=[]; 
	     var point;
	     var takePerson;
	     var cartNum=[];
	     
         function ajaxData(){
        	
 	    	$(".color").each(function(){
 	    		color.push($(this).val());
 	    	});
 	    	$(".productNum").each(function(){
 	    		productNum.push($(this).val());
 	    	});
 	    	$(".sizing").each(function(){
 	    		sizing.push($(this).val());
 	    	}); 
 	    	$(".price").each(function(){
 	    		price.push($(this).val());
 	    	}); 
 	    	$(".amount").each(function(){
 	    		amount.push($(this).val());
 	    	}); 
 	    	$(".cartNum").each(function(){
 	    		cartNum.push($(this).val());
 	    	}); 
 	    	point =$("#pointinput").val();
 	    	takePerson=$("#takePerson").val();
 	    	takePhone=$("#takePhone").val();
 	    	takeAddr1=$("#takeAddr1").val();
 	    	takeAddr2=$("#takeAddr2").val();
 	    	takeAddr3=$("#takeAddr3").val();
 	    	
         }
      
        $("#buy").click(function(){
        	var a = $("#takePerson").val().length;
        	var b = $("#takePhone").val().length;
        	var c = $("#takeAddr1").val().length;
        	var d = $("#takeAddr2").val().length;
        	var e = $("#takeAddr3").val().length;
        	if(a>0&&b>0&&c>0&&d>0&&e>0){
        		var IMP = window.IMP; 
            	IMP.init("imp96183071"); 

            	IMP.request_pay({
            	    pg : 'inicis', // version 1.1.0부터 지원.
            	    pay_method : 'card',
            	    merchant_uid : 'merchant_' + new Date().getTime(),
            	    name : '주문명:결제테스트',
            	    amount : Number($("#total").val()),
            	    buyer_email : 'iamport@siot.do',
            	    buyer_name : '구매자이름',
            	    buyer_tel : '010-1234-5678',
            	    buyer_addr : '서울특별시 강남구 삼성동',
            	    buyer_postcode : '123-456',
            	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
            	}, function(rsp) {
            	    if ( rsp.success ) {
            	    	ajaxData();
            	    	$.ajax({
            	    		url:"./orderInsert",
            	    		type:"POST",
            	    		dataType : "json",
            	    		data:{
            	    			color :color,
            	    			sizing:sizing,
            	    			amount:amount,
            	    			price:price,
            	    			productNum:productNum,
            	    			totalPrice:rsp.paid_amount,
            	    			num:rsp.imp_uid,
            	    			point :point,
            	    			takePerson:takePerson,
            	    			takePhone:takePhone,
            	    			takeAddr1:takeAddr1,
            	    			takeAddr2:takeAddr2,
            	    			takeAddr3:takeAddr3,
            	    			cartNum:cartNum
            	    			
            	    		},
            	    		 success:function(result){
            	    			 
            	    			 if(result>0){
            	    				 alert("결제가 완료되었습니다");
            	    				 location.href="../";
            	    			 }else{
            	    				 alert("결제실패하였습니다 다시 시도해주십시오");
            	    			 }
            	   				
            	   	  			
            	   			 }
            	    	});
            	        
            	    } else {
            	        var msg = '결제에 실패하였습니다.';
            	        msg += '에러내용 : ' + rsp.error_msg;
            	        alert(msg);
            	        
            	    }
            	    
            	});
            	
        	}else{
        		alert("주문정보를 모두입력해주세요");
        	}
        	
        });
      
         
       
	</script>

</body>

</html>