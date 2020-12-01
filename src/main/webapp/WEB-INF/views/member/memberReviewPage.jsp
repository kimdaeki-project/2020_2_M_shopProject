<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">
<title>Insert title here</title>
<style type="text/css">
   *{
      margin: 0;
      padding: 0;
      font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
      text-decoration: none;
   }
   
   .container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    padding-bottom: 31px;
}
   
   table{
      color: #353535;
      font-size: 12px;
      padding: 60px;
      line-height: 140%;
      width: 1140px;
      text-decoration: none;
      border: 1px solid #e8e8e8;

   }
   
   table tr{
      padding: 12px 0 10px;
      color: #353535;
      
   }
   
   table td{
      color: #353535;
      text-align: center;
      padding: 12px 0 10px;
      border-bottom: 1px solid #e8e8e8;
   }
   
   table a{
      color: #353535;
      text-decoration: none;
      cursor: pointer;
   }
   
   #index{
      background: #fbfafa;
   }

   .contents{
      padding-bottom: 10px;
      margin-bottom: 10px;
      border-bottom: 1px solid #dadada;
      width: 1140px;
   }
   
   .review_table{
      margin-top: 30px;
   }
</style>

</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<div class = "container">
<div class="contents">
   <span><b>REVIEW</b></span>
   <span style="padding-left: 5px;">|</span>
   <span style="padding-left: 5px; font-size: 13.5px;">내가 작성한 리뷰</span>
</div>

<table class="review_table">
   <tr id="index">
        <td>글번호</td>
        <td>리뷰 내용</td>
        <td>작성자</td>
        <td>별점</td>
     </tr>
   <tr>
      <c:forEach items="${list}" var="ar" varStatus="vs">
         <td style="width: 70px;">${ar.num}</td>
         <td style="text-align: left; padding-left: 20px;">${ar.contents}</td>
         <td style="width: 130px;">${ar.writer}</td>
         <td style="width: 130px;"><c:forEach var="a" begin="1" end="${ar.star}"><span style="color:red"><c:out value="★"/></span></c:forEach><c:forEach var="b" begin="${ar.star+1}" end="5"><span style="color:red"><c:out value="☆"/></span></c:forEach></td>
         <tr></tr>
      </c:forEach>

      <c:if test="${list.size()==0}">
         <td colspan="4">아직 작성한 리뷰가 없습니다.</td>
      </c:if>
   </tr>
</table>
</div>
<c:import url="../common/footer.jsp"></c:import>


<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>