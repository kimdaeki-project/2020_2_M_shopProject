<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/bootStrap.jsp"></c:import>
<title>Insert title here</title>
<link rel="stylesheet"href="../resources/css/member/memberJoin.css">
<link rel="stylesheet"href="../resources/css/common/common.css">




</head>
<body>
<c:import url="../common/header.jsp"></c:import>


<section style="margin-top: 100px; margin-bottom: 100px;">
<div class="container">
  
<form action="./memberJoin" method="post" id="frm">
   <h5 style="line-height: 0.2;"><b>기본정보</b></h5>
   <p style="text-align: right; font-size: 13px; color=#353535; line-height: 0.2; font-family: 돋움;" ><img src="../resources/images/ico_required.png"> 필수입력사항</p>
   <table border="1" class="table" bordercolor ="#e8e8e8" >
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;아이디 <img src="../resources/images/ico_required.png"></td>
         <td><input type="text" class="inputTypeText" id="id" name="id"> (영문소문자/숫자, 4~16자)
              <div id="idResult" class="result"></div>
           </td>
      </tr>
      
      <tr id="#idResult"></tr>
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;비밀번호 <img src="../resources/images/ico_required.png"></td>
         <td><input type="password" class="inputTypeText" id="pw" name="pw"> (영문 대/소문자/숫자 중 3가지 이상 조합, 8자~16자)
             <div id="pwResult" class="result"></div>
            </td>
      </tr>
      
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;비밀번호 확인 <img src="../resources/images/ico_required.png"></td>
         <td><input type="password" class="inputTypeText" id="pw2" name="pw2">
              <div id="pw2Result" class="result"></div>
            </td>
      </tr>
      
      <tr class="group">
         <td class="leftrow">&nbsp;&nbsp;이름 <img src="../resources/images/ico_required.png"></td>
         <td><input type="text" class="inputTypeText empty should" id="name" name="name"></td>
      </tr>
      
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;휴대전화 <img src="../resources/images/ico_required.png"></td>
         <td><input type="text" class="inputTypeText empty should" id="phone" name="phone"></td>
      </tr>
      
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;이메일 <img src="../resources/images/ico_required.png"></td>
         <td><input type="email"  class="inputTypeText empty should" id="email" name="email">
         		
         		<button id="mailSend" class="authbtn" type="button">인증번호받기</button>
         </td>
      </tr>
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;인증번호 <img src="../resources/images/ico_required.png"></td>
         <td><input type="text"  class="inputTypeText empty should" id="emailCheck" name="emailCheck">
         		
         		<button id="mailConfirm" class="authbtn" type="button">인증번호확인</button>
         </td>
      </tr>
      <tr class="group">
         <td  class="leftrow">&nbsp;&nbsp;주소 <img src="../resources/images/ico_required.png"></td>
         <td>
            <input class="form-control should" placeholder="우편번호" name="addr1" id="addr1" type="text">
              <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
         
            <input class="form-control should" placeholder="도로명 주소" name="addr2" id="addr2" type="text"/>

            <input class="form-control should" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
         </td>
      </tr>
   </table>
</form>
<div class="tab">
   <p style="line-height: 0.2;"><b>이용약관동의</b><p style="text-align: right; font-size: 13px; color=#353535; line-height: 0.2; font-family: 돋움;"><input id="checkall" type="checkbox"> 전체 동의</p></p>
      <div class="agree">
   <p><textarea rows="5" style="width:100%" readonly="readonly">제1조(목적)
이 약관은 데일리쥬 회사(전자상거래 사업자)가 운영하는 데일리쥬 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</textarea></p>
   <p class="que">[필수]이용약관에 동의하십니까? <input type="checkbox" class="ch" id="must1"> 동의함</p>
   </div>
   
   <div class="agree">
     <p><b>개인정보 수집 및 이용 동의</b></p>
   <p><textarea rows="5" style="width:100%" readonly="readonly" > ** 본 양식은 쇼핑몰 운영에 도움을 드리고자 샘플로 제공되는 서식으로 쇼핑몰 운영형태에 따른 수정이 필요합니다. 쇼핑몰에 적용하시기 전, 쇼핑몰 운영 사항 등을 확인하시고 적절한 내용을 반영하여 사용하시기 바랍니다. **
1. 개인정보 수집목적 및 이용목적

가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산

콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스</textarea></p>
   <p class="que">[필수]이용약관에 동의하십니까? <input type="checkbox" class="ch" id="must2"> 동의함</p>
   </div>
   
   <div class="agree">
   <p><b>개인정보 제3차 제공 동의(선택)</b></p>
   <p><textarea rows="5" style="width:100%" readonly="readonly">아래 내용의 동의 여부는 회원가입에 영향을 미치지 않습니다. 단, 동의 거부시 서비스 이용에 제한이 있을 수 있습니다.

위탁받는 자(수탁업체) : ㈜스냅컴퍼니(알림전송수탁업체 : ㈜엠티에스컴퍼니)
- 위탁업무의 내용 : 고객 개인정보(이름, 아이디, 휴대전화번호)를 통해 신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 및 참여기회</textarea></p>
   <p class="que">이용약관에 동의하십니까? <input type="checkbox" class="ch"> 동의함</p>
   </div>
   
   <div class="agree">
   <p><b>개인정보 취급 위탁 동의(선택)</b></p>
   <p><textarea rows="5" style="width:100%" readonly="readonly">개인정보취급방침

‘데일리쥬’(이하 “회사”라 함)는 이용자들의 개인정보보호를 매우 중요시하며, "정보통신망 이용촉진 및 정보보호에 관한 법률”을 준수하고 있습니다. 회사는 개인정보취급방침을 통하여 고객님이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
   </textarea></p>
   <p class="que">이용약관에 동의하십니까? <input type="checkbox" class="ch"> 동의함</p>
   </div>
   
 <div style="text-align: center;" >   
   <input type="button" value="회원가입" class="btn btn-join" id="join">  
   <input type="button" value="회원가입취소" class="btn btn-cancel" id="cancel">
   </div>
</div>
</div>
</section>

<c:import url="../common/footer.jsp"></c:import>


<script type="text/javascript" src="../resources/js/member/memberJoin.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../resources/js/address/address.js"></script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>



</body>
</html>