<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<c:import url="../common/bootStrap.jsp"></c:import>

<title>Insert title here</title>
<style type="text/css">
body{
 background-color: #f3f3f3;
}
.date{
margin: 50px 0px 0px 80px;	

}
.wrap{
	width:1000px;
	height:500px;
	margin: 50px 0px 50px 80px;	
	background-color: white;
	
	
}
#btn{
	width:60px;
	height:26px;
	border: 1px solid #d4d8d9;
	background-color: white;
	color:#757575;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="date"> 

		
		<input type="date" id="startDate" name="startDate"><span>~</span><input type="date" id="endDate" name="endDate">
		<button type="button" id="btn">보기</button>	
		
	</div>
		<div class="wrap">
			<p style="font-size: 18px; font-weight: bold; margin-left: 15px; color: #757575;">기간을 입력해주세요</p>
			
		</div>

	<script type="text/javascript">
		$("#startDate").val(new Date().toISOString().substring(0, 10));
		$("#endDate").val(new Date().toISOString().substring(0, 10));
		
		$("#btn").click(function(){
			
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			$.post("./adminProduct",{
				startDate: startDate,
				endDate: endDate
			},function(data){
				$(".wrap").empty();
				$(".wrap").append(data);
			});
		});
	</script>
</body>
</html>