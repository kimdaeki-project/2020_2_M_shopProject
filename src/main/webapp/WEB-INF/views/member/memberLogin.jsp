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
   h3{
      text-align: center;
      font-weight:bold;
      padding-bottom: 10px;
   }
   .container{
      width:1100px;
      height:380px;
      border-color: #E8E7E7;
      border-style: solid;
      border-width: 1px;
      padding-bottom: 30px;
      padding-top: 30px;

   }

   
   .form-control{
      width:300px;
      height:35px;
      margin-bottom: 1px;
   }
   #con_margin{
      padding: 10px 350px;
   
   }
   .btn-default{
      width:95px;
      height:70px;
      background-color: #3A4050;
      color: white;
   }
   .btn-default:hover{
      background-color: #3A4050;
      color: white;
   }

   
   td{
      border-width: 3px;
      border-color: white;
      border-style: solid;
   }
   
   #text{
      color: gray;
      font-size: 12px;
   }
   
   .join{
      background-color: #8C8C8C;
      color : white;
      width:95px;
      height:35px;
      font-size:14px;
      border-color: white;
   }
   .join:hover{
      background-color: #8C8C8C;
   }
   
   #text_1{
      font-size:12px;
      color: gray;
   }
   #kakao-login-btn{
      height:30px;
   }
   .ul1{
   		
      font-size: 12px;
   }
   .li1{
   	
      float:left;
      list-style-type: none;
     	margin-right: 10px;
     }
</style>

</head>
<body>
<c:import url="../common/header.jsp"></c:import>



<div class="container" style="margin-top: 100px; margin-bottom: 100px;">
   <h3>회원로그인</h3>
   <form action="./memberLogin" method="post">
      <div id="con_margin">
         <table>
            <tr>
               <td>
             <input type="text" class="form-control" id="id" placeholder="Enter Id" name="id" value="${cookie.remember.value}" required="required"> 
             </td>
             <td id="d1" rowspan="2">
             <button type="submit" class="btn btn-default">로그인</button>
            </td>
         </tr>
         <tr>
            <td>   
             <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw" required="required">
            </td>
         </tr>    
        
      <tr>
      <td>
       <div class="checkbox" id="text_1">
         <label><input id=idSaveCheck type="checkbox" name="remember" checked="checked">아이디 저장 </label>
         <img src="../resources/images/loginIcon.gif"> 보안접속
       </div>
       </td>
       
       </tr>
          <tr>
               <td>
                  <a id="kakao-login-btn"></a>
               <a href="http://developers.kakao.com/logout"></a>
               </td>
         
         </tr>
               <tr>
             <td colspan="2">
                <ul class="ul1">
                   <li class="li1">
                   <img alt="" src="../resources/images/find.png">
                   <a href="./memberIdFind">아이디 찾기</a>
                   </li>
                   <li class="li1">
                    <img alt="" src="../resources/images/find.png"><a href="./memberPwFind">비밀번호 찾기</a></li>
                </ul>
             </td>
          </tr>
          <tr class="line">   
             <td colspan="2"><hr>
             </td>
          </tr>
          <tr class="line">
             <td id="text">회원가입을 하시면 다양하고 특별한혜택이 준비되어<br>있습니다.</td>
             <td><a href="./memberJoin"><button type="button" class="btn btn-default join">회원가입</button></a></td>
          </tr>
           
          
       </table>
       
       
   </div>
  </form>
</div>


<c:import url="../common/footer.jsp"></c:import>


<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>