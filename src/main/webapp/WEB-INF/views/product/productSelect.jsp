<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet"href="../resources/css/common/common.css">
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style type="text/css">

.headerWrap{
	font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
	width:1000px;
	height: 500px;
	
	margin: 50px auto;	
	
} 
.imgWrap{
	width:500px;
	height:500px;
	
	float: left;
}
.img{
	width:500px;
	height:500px;
}
.optionWrap{
	margin-left: 50px;
	width: 450px;
	height: 500px;
	
	float: left;
}
.ptitle{
	width: 450px;
	height: 50px;
	border: 1px solid #e1e1e1;
	
	text-align: center;
	line-height: 50px; 
}
.pPrice{
	width: 450px;
	height: 50px;
	margin-top: 30px;
	
	line-height: 50px; 
	text-align: right;
	font-size: 12px;
	color:#555555;
	font-weight: bold;
	
}

.pOption{
	width: 450px;
	border-bottom: 1px solid #e1e1e1;
	border-top: 1px solid #e1e1e1;
	height: 120px;
	
	
}
.coloroption{
width: 450px;
height: 40px;

line-height: 40px;
}
.sizeoption{
width: 450px;
height: 40px;

line-height: 40px;
}
.selector{
margin-left: 80px;
width:300px;
}
.totalprice{
width: 450px;
height: 40px;

line-height: 40px;
margin-top:20px;
margin-bottom: 20px;
text-align: right;
}
.buybtn{
width: 450px;
height: 50px;
background-color: #3B3B3B;
color:#ffffff;
}
.cartbtn{
width: 450px;
height: 40px;
margin-top:10px;
border: 1px solid #e1e1e1;
background-color: #ffffff;
}
.desc{
margin: 150px auto;
text-align: center;
}
#total{
	font-weight:bold;
	outline: none;
	text-align: right;
	width: 50px;
	height: 25px;
	line-height: 25px;
	border: 0px;
}
.authwrap{
	text-align: right;
	width: 1000px;
	margin: auto;
	height: 30px;
	line-height: 30px;
	
	
}
.authbtn{
background-color: #3B3B3B;
color:#ffffff;
border: 1px solid #e1e1e1;
}
#amount{
width: 40px;
height: 30px;
margin-left: 85px;
}
#color{
margin-left: 100px;
}
#sizing{
margin-left: 87px;
}

.reviewPage{
font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
text-decoration: none;   
padding-bottom: 30px;
height:600px;
margin-left: 150px;
margin-right: 150px;
}
.review_table{
font-family: "맑은 고딕", "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif;
}
.review_title {
text-align: center;
}

#review{
border: 1px solid #000;
padding: 4px 70px;
margin: 10px auto 10px;
letter-spacing: 1px;
background-color:black;
display: inline-block;
font-size: 11px;
}

#review_margin{
	height: 300px;
}

textarea{
   padding : 5px 13px;
}

#resize{
   resize: none;
   margin-bottom: 8px;
    padding: 15px 13px;
    border: 1px solid #dadada;
    position: relative;
}


.uploadform{
   width: 1140px;
   height: 35px;
}

#uploadLeft{
   width: 300px;
}

#fileAdd{
   width: 204px;
   height:35px;
}

.uploadCenter{
   width:165px;
   height: 35px;
   padding: 0px;
   float: left;
}

.review_select{
   float: left;
   width:793px;
   height:35px;
   line-height: 26px;
   color: #444;
}

option{
   color: #444;
}

.icon_camera{
    background-repeat: no-repeat;
    width: 38px;
    height: 27px;
}

.btn:hover{
      background: black;
    color: white;
   }

.review{
   border-radius: 0px;
    width: 228px;
   color: white;
   height: 35px;
    background: black;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
}

#check_icon{
   padding-bottom: 3px;
}

.table{
	margin-left:150px;
	width: 1100px;
}
.page{
      padding: 80px 0 0;
      text-align: center;
      margin-bottom: 25px;
 }
   
.page a{
      color: #313131;
      text-decoration: none;
}
.show{
	cursor: pointer;
	margin-left: 150px;
	color : #cccccc;
	cursor: pointer;
    font-weight: bold;
	font-size: 13px;
}
.show:hover{
	color : #cccccc;
	
}

#hide{
	width:900px;
	margin-left:150px;
	margin-bottom: 30px;
	padding-bottom: 5px;
   position: relative;
   background: #ffffff;
   border: 1px solid #a5a5a5;

}

.reply-input{
   width: 810px;
   height: 30px;
   border: 1px solid #a5a5a5;
   margin: 5px 0 0 15px;
}
.reply-button{
   width: 50px;
   height: 30px;
   background-color: white;
   border: 1px solid #a5a5a5;
   color: #808080;
   position: absolute;
   margin: 5px 0 0 5px;
}
.reply-button:hover{
   background-color: #808080;
   color: #ffffff;
   }
 .del{
	 width: 40px;
	 height:20px;
	 margin : auto;
	 text-align: center; 
   	font-size: 5px;
   	color:#7b7b7b;
   	border-radius: 0px;
   	background-color: white;
	border: 1px solid #5e5e5e;
   }
   
.del:hover{
     background-color: #5e5e5e;
     color: white;
}
.upd{
	 width: 40px;
	 height:20px;
	 margin : auto;
	 text-align: center; 
   	font-size: 5px;
   	color:#7b7b7b;
   	border-radius: 0px;
   	background-color: white;
	border: 1px solid #5e5e5e;
}
.upd:hover{
     background-color: #5e5e5e;
     color: white;

}
#hide:after, #hide:before {
   bottom: 100%;
   left: 3.5%;
   border: solid transparent;
   content: "";
   height: 0;
   width: 0;
   position: absolute;
   pointer-events: none;
}
#hide:after {
   border-bottom-color: #ffffff;
   border-width: 14px;
   margin-left: -12px;
}
#hide:before {
   border-bottom-color: #a5a5a5;
   border-width: 15px;
   margin-left: -15px;
}
#inputTypeText{
	border: 0px;
	margin-left: -15px;
}
#tr1{
  overflow-y: visible;
  font-size:12px;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

<c:if test="${member.auth eq 1}">
<div class="authwrap">
<button type="button" class="authbtn" id="update">상품수정</button> <button type="button" class="authbtn" id="delete">상품삭제</button>
</div>
</c:if>
<div class="headerWrap">
	<div class="imgWrap">
		<img alt="" src="../resources/upload/product/${dto.imgName}" class="img">
	</div>
	
	<div class="optionWrap">
		<div class="ptitle"><span>${dto.name}</span> </div>
		
		<div class="pPrice">판매가:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.finalPrice}</div>
		<form action="../order/directOrderPage" method="post" id="frm">
		<div class="pOption">
			<input type="hidden" value="${dto.num}" name="productNum" id="productNum">
			<div class="coloroption"><span>색상</span><select class="selector" id="color" name="color">
				
				<option>Black</option>
				<option>White</option>
				<option>Navy</option>
				<option>Beige</option>
			</select> </div>
			<div class="sizeoption">
			<span>사이즈</span><select class="selector" id="sizing" name="sizing">
				
				<option>S</option>
				<option>M</option>
				<option>L</option>
				<option>XL</option>
			</select>
			</div>
			<div class="coloroption"><span>수량&nbsp;&nbsp;&nbsp;</span> 
			<input type="number" value="1" min="1" max="10" id="amount" name="amount" style="text-align: center;">
			</div>
		</div>
		</form>
		<div class="totalprice"> <span style="font-weight: bold;">총상품금액: </span><input type="text" value="${dto.finalPrice}" readonly="readonly" id="total"></div>
		
		<div><button  class="buybtn" type="button" id="buybtn">BUY IT NOW</button> </div>
		<div><button  class="cartbtn" type="button" id="cartbtn">ADD TO CART</button></div>
		<div><button  class="cartbtn">WISH LIST</button> </div>
	</div>
</div>
<div class="desc">
${dto.introduce}
</div>


<div class="desc">
	<img alt="" src="../resources/images/productNotice.jpeg">
</div>

<div class="reviewPage">

   <div class="review_title">
      <span id="review" ><font color="white">REVIEW</font></span>
   </div>
   
   <div id="review_margin">
   
   <p><span class="review1 ex1" style="font-size: 14px">REVIEW |</span><span class="review1 ex2" style="font-size: 13px; color: gray">문의글 혹은 악의적인 비방글은 무통보 삭제된다는 점 유의해주세요^^</span></p>
   
<form id="frm" action="../review/reviewInsert" method="post" enctype="multipart/form-data"> 
	<input type="hidden" value="${dto.num}" name="pnum">
	<textarea id="resize" style="resize: none;" name="contents">글 후기 작성시 : 500원/<br>글+상품 사진 포토후기 : 800원/<br>글+크롭된 착용사진 포토후기 : 800원/<br>글+전신이 잘 보이는 착용사진 : 1000원/</textarea>
   <div class=uploadform>
         <div class=uploadCenter>
         <select name="star" id="star" class="review_select">
            <option value="1">&nbsp;★☆☆☆☆ 별로예요</option>
            <option value="2">&nbsp;★★☆☆☆ 그저 그래요</option>
            <option value="3">&nbsp;★★★☆☆ 보통 이에요</option>
            <option value="4">&nbsp;★★★★☆ 맘에 들어요</option>
            <option value="5" selected="selected">&nbsp;★★★★★ 아주 좋아요</option>
         </select>
         </div>
      <div>
      <button type="submit" style="float: right;" value="btn review" class="btn review"><img src="../resources/images/review.png" width="30px" id="check_icon">&nbsp;리뷰 등록하기</button>
      </div>
   </div>
  </form>
  </div>
  
</div>
<div id="review_table">
	<c:forEach items="${list}" var="dto">
	<table class="table table-hober" style="font-size: 14px;">
	  	<tr>	
	  		<td><c:forEach var="a" begin="1" end="${dto.star}"><span style="color:red"><c:out value="★"/></span></c:forEach><c:forEach var="b" begin="${dto.star+1}" end="5"><span style="color:red"><c:out value="☆"/></span></c:forEach>
	  		</td>
	  		<c:choose>
	  		<c:when test="${dto.writer ne 'admin1'}">
	  		<td rowspan="2" style= "text-align: center;	margin: 0 auto; width:200px; padding-top: 20px;"><p style="color:gray;">작성자</p>
			<p style="font-weight:bold;">
	  			 ${fn:substring(dto.writer,0,4)}*</p>
	  		</td>
	  		</c:when>
	  		<c:otherwise>
	  		<td rowspan="2" style= "text-align: center;	margin: 0 auto; width:200px; padding-top: 20px;"><p style="color:gray;">작성자</p>
			<p style="font-weight:bold;">
	  			 관리자</p>
	  		</td>
	  		</c:otherwise>
	  		</c:choose>
	  		
	  		
	  	</tr>
	  	<tr>
	  		<td class="td_2" style="border-top-color: white;">${dto.contents}</td>
	  	</tr>	
	  </table>
	  		<span id="text1"><a class="show" id="${dto.num}" style="text-decoration: none;" >댓글 보기</a></span><br>
			<div id="hide" style="display: none;" class="${dto.num}">
				
				<c:forEach items="${dto.replyDTOs}" var="req" >					  			
					<div>	
						<form id="frm1" action="../reply/setUpdate" method="post">
						<input type="hidden" value="${req.replyNum}" name="replyNum">
						<input type="hidden" value="${rpager.curPage}" name="curPage">
						<input type="hidden" value="${rpager.pnum}" name="pnum">
						<table style="width: 100%;">
							<tr id="tr1" style="border-bottom: #DDDDDD solid 1px;">
								<c:choose>
								<c:when test="${req.reWriter ne 'admin1'}">
								<td style=" width: 90px; padding: 10px 10px 0"><p style="font-weight: bold; font-size: 12px;">${req.reWriter}</p></td> 
								</c:when>
								<c:otherwise>
								<td style=" width: 90px; padding: 10px 10px 0"><p style="font-weight: bold; width:80px; font-size: 12px;">관리자</p></td>
								</c:otherwise>
								</c:choose>
								
								<c:choose>
								<c:when test="${member.id ne req.reWriter}">
								<td style=" width: 680px; padding: 10px 10px 0"><p style="font-size: 12px; text-align: left;">${req.reContents}</td>		
								</c:when>
								<c:otherwise>
								<td style=" width: 680px; padding: 10px 10px 0"><textarea id="inputTypeText" name="reContents" rows="3" style="width:700px; overflow-y:hidden; resize: none;">${req.reContents}</textarea></td>
								<td style="width: 47px;"><input type="submit" class="upd" id="${req.replyNum}" value="수정" style="margin-right: -5px;" ></td>
								<td style="width: 47px;"><input type="button" class="del" id="${req.replyNum}" value="삭제" style="margin-right: -5px" ></td>
								</c:otherwise>
								</c:choose>
							</tr>
					</table>
					</form>
				</div>
			</c:forEach>
			
				<form action="../reply/setReply" method="post">
					<input type="hidden" value="${rpager.curPage}" name="curPage">
					<input type="hidden" value="${rpager.pnum}" name="pnum">
					<input type="hidden" value="${dto.num}" name="rNum">
        		    <input type="text" class="reply-input" placeholder="댓글을 작성해 주세요 :)" style="margin-right: 3.5px;" required="required" name="reContents">
      			    <input type="submit" class="reply-button" value="등록">
        		</form>
        	</div>
			  	
		 </c:forEach>
	
	
  <div class="page">
  	<c:if test="${rpager.beforeCheck}">
  	<a href="./productSelect?num=${rpager.startNum-1}">[이전]</a>
  	</c:if>
  	<c:forEach begin="${rpager.startNum}" end="${rpager.lastNum}" var="i">
  		<a  title="${i}" href="./productSelect?num=${dto.num}&curPage=${i}">${i}</a>
  	</c:forEach>
  	
  	<c:if test="${rpager.nextCheck}">
  	<a href="./productSelect?num=${rpager.lastNum+1}">[다음]</a>
  	</c:if>
  </div>
</div>

<c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript">


$("#amount").click(function(){
	var t =$("#amount").val();
	var p=${dto.finalPrice};
	if(t>10){
		t=10;
	}else if(t<1){
		t=1;
	}
		
	$("#total").val(p*t);
});



$("#delete").click(function(){
	location.href="./productDelete?num=${dto.num}&pCode=${dto.pCode}&cCode=${dto.cCode}&imgName=${dto.imgName}";
});
$("#update").click(function(){
	location.href="./productUpdate?num=${dto.num}";
});
$("#buybtn").click(function(){
	if(${empty member}){
		alert("로그인후 이용가능합니다");
	}else{
		$("#frm").submit();
	}
	
});

$("#cartbtn").click(function(){
	
	if(${empty member}){
		alert("로그인후 이용가능합니다");
	}else{
		var productNum =$("#productNum").val();
		var color=$("#color").val();
		var sizing=$("#sizing").val();
		var amount=$("#amount").val();
		$.post("../cart/cartCheck",{
			productNum:productNum,
			color:color,
			sizing:sizing		
		},function(data){
			data=data.trim();
			if(data==0){
				$.post("../cart/cartInsert",{
					productNum :$("#productNum").val(),
					color:$("#color").val(),
					sizing:$("#sizing").val(),
					amount:$("#amount").val()
				},function(data){
					data=data.trim();
					if(data>0){
					var c=confirm("장바구니에 담았습니다 장바구니로 이동하시겠습니까?");
						if(c){
							location.href="../cart/cartList";
						}
					}else{
						alert("장바구니에 담지못했습니다");
					}
				});
			}else{
				var check=confirm("장바구니에 동일한 제품이있습니다 장바구니에 추가하시겠습니까?");				
				if(check){
					$.post("../cart/cartAmountUpdate",{productNum:productNum,
						color:color,
						sizing:sizing,
						amount:amount
					},function(data){
						data=data.trim();
						if(data>0){
							var c=confirm("장바구니에 담았습니다 장바구니로 이동하시겠습니까?");
							if(c){
								location.href="../cart/cartList";
							}
						}else{
							alert("장바구니에 담지못했습니다");
						}
					});	
				}
			}
		});
	}
	
	
			
	
	

});

$(document).ready(function() {
	
	  $("#inputTypeText").on("keyup", "textarea", function(e) {
	    $(this).css("height", "auto");$(document).ready(function() {
	    	  $("table").on("keyup", "textarea", function(e) {
	    		    $(this).css("height", "auto");
	    		    $(this).height(this.scrollHeight);
	    		  });
	    		  $("table").find("textarea").keyup();
	    		})
	    $(this).height(this.scrollHeight);
	  });
	  $("#inputTypeText").find("textarea").keyup();
	});
	
//댓글 삭제	
$(".del").click(function(){
	var replyNum= $(this).attr("id");
	
location.href="../reply/setDelete?replyNum="+replyNum+"&pnum="+${rpager.pnum}+"&curPage="+${rpager.curPage};

});
//댓글 펼치기 접기
$(".show").each(function(){
	$(this).click(function(){
		var a = $(this).attr("id");
		var b = $("."+a).css("display");
		if(b=='block'){
			$("."+a).css("display", "none");
			$(this).text("댓글 보기");
		}else{
			$("."+a).css("display", "block");
			$(this).text("댓글 접기");
		}
	});
});



//썸머노트
$('#resize').summernote({
      width: 1140,
      height:200,
      callbacks:{
          onImageUpload: function(files, editor) {
             var formData = new FormData(); //가상의 form태그 작성
             formData.append('file',files[0]); //파라미터 이름을 file로
             
             $.ajax({
                      data:formData,
                 type:"POST",
                      url:'../review/summernote',
                      enctype:'multipart/form-data',
                      cache:false,
                      contentType:false,
                      processData: false,
                      success: function(data) {
                      data=data.trim();
                      data="../resources/upload/review/"+data;
                      $('#resize').summernote('editor.insertImage', data);

                }
             })
          },//upload 끝
       
          onMediaDelete: function(){
                 var fileName =$(files[0]).attr("src");
                 var a=fileName.split("/");
                 fileName=a[a.length-1];
                $.ajax({
                   type:"POST",
                    url:"../review/summernoteDelete",
                    data:{
                       file:fileName
                    },
                    success:function(data){
                       if(data){
                          alert("삭제 성공");
                       }else{
                          alert("삭제 실패");
                       }
                    }
                });
     		 }
          
       }
    });
</script>
<script type="text/javascript" src="../resources/js/common/common.js"></script>
</body>
</html>