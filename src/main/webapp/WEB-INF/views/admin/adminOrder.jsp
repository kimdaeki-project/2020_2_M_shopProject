<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/bootStrap.jsp"></c:import>
<style type="text/css">
	.orderwrap{
		margin : 100px 100px;
		width: 900px;
		
	}
	.orderheader{
		border-bottom: 1px solid #e8e8e8;
		
	}
	.ordertable{
		border: 1px solid #e8e8e8;
		width:900px;
		border-collapse: collapse;
	}
	.orderdate{
		width:100px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.ordernum{
		width:350px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.orderprice{
		width:150px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.orderstatus{
		width:100px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.orderselect{
		width:100px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		font-size: 11px;
		background-color:#fbfafa;
		color:#757575;
	}
	.orderinfo{
		width:900px;
		height: 40px;
		text-align: center;
		font-size: 11px;
		line-height: 30px;
		color:#757575;
		font-weight: bold;
		border-bottom: 1px solid #e8e8e8;
	}
	.selectbtn{
		width: 60px;
		height: 30px;
		margin-left:20px;
		line-height:30px;
		background-color: #6e6e6e;
		color: #ffffff;
		border: 1px solid #e8e8e8;
		
	
	}
	.selectbtn a{
		color: #ffffff;
		text-decoration: none;
		cursor: pointer;
	}
	
	.pagerwrap{
		width: 800px;
		height: 50px;
		margin: 50px auto;
		
		text-align: center;
		line-height: 50px;
		font-size: 11px;
	}
	.c1{
		cursor: pointer;
		
	}
</style>
</head>
<body>

	<section id="sec">
	
	</section>
	
	<script type="text/javascript">
	getList();
		
	
	
	
	
	
	
		
		function getList(){
			
			$.ajax({
				url:"./adminOrder",
				type:"POST",
				data:{
				
				},
				success: function(data){
					$("#sec").empty();
					$("#sec").append(data);
				}
				
				
			});
		
		}
		
		
		</script>
		
		
		
	
</body>
</html>