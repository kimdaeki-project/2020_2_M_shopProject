<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&display=swap');
   *{margin:0; padding:0; font-family: 'Arial', 'Nanum Gothic', sans-serif; list-style: none;}

   /* Section Nav*/
   #section{
      width: 700px;
      height: 100px;
      margin: 0px 0px 50px 200px;
     
   }
   .fix-bar{
      width: 600px;
      height: 100px;
      margin: 30px auto;
   }
   .fix-box{
      width: 300px;
      height: 100px;
      background-color: #f3f3f3;
      float: left;
   }
   .fix-cir{
      width: 70px;
      height: 70px;
      border-radius: 50px;
      background-color: #acacac;
      margin: 13px 0 0 70px;
      float: left;
   }
   .fix-img{
      margin: 17px 0 0 13px;
   }
   .fix-img2{
      margin: 13px 0 0 18px;
   }
   .fix-write{
      width: 100px;
      height: 40px;
      float: left;
      margin: 0 0 0 30px;
      padding: 28px 0 20px 0;
   }
   .strong-text{
      font-size: 14px;
   }
   .fix-strong{
      font-size: 20px;
   }
   .fix-span{
      font-size: 10px;
      color: #6d6d6d;
      margin: 0 0 0 5px;
   }
   .fix-span-won{
      font-size: 12px;
      margin: 0 0 0 3px;
   }

body{
 background-color: #f3f3f3;
}
.wrap{
	width:900px;
	height:500px;
	margin: 0px 0px 50px 105px;	
	text-align: center;
	background-color: white;
}
.todaydate{
	width: 300px;
	height: 50px;
	font-size: 16px;
	font-weight: bold;
	margin: 30px 0px 20px 0px;	
	letter-spacing:2px;
	text-align: center;
	line-height: 50px;
	color: #757575;
}
</style>
</head>

<body>
	<div class="todaydate"><p style="margin-left: 20px;">일일통계(${todayDate.todayDate}기준)</p></div>
	
	<div id="section">
      <div class="fix-bar">
         <div class="fix-box">
            <div class="fix-cir">
               <img class="fix-img" alt="" src="${pageContext.request.contextPath}/resources/images/cart.png" width="40">
            </div>
            <div class="fix-write">
               <strong class="strong-text">주문</strong><br>
               <strong class="fix-strong">${todayInfo.todayCount}건</strong>
            </div>
         </div>
         <div class="fix-box">
            <div class="fix-cir">
               <img class="fix-img2" alt="" src="${pageContext.request.contextPath}/resources/images/coin.png" width="40">
            </div>
            <div class="fix-write">
               <strong class="strong-text">결제</strong><br>
               <strong class="fix-strong">${todayInfo.todayTotal}원</strong>
            </div>
         </div>
      </div>
   </div>
	
	
	<div class="wrap"> 
	

<canvas id="myChart"></canvas> </div>
<!-- 부트스트랩 --> <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels:  ['오늘','1일전','2일전','3일전','4일전','5일전','6일전'],
        datasets: [{
            label: '주간 매출 통계',
            data: ['${list[0].dayPrice}','${list[1].dayPrice}','${list[2].dayPrice}','${list[3].dayPrice}','${list[4].dayPrice}','${list[5].dayPrice}','${list[6].dayPrice}'],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>

	
</body>
</html>