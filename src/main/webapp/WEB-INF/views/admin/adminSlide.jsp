<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<c:import url="../common/bootStrap.jsp"></c:import>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">





<style type="text/css">
.imgwrap{
	width:1155px;
	height: 200px;
	float: left;
	margin: 0px 0px 50px 10px;	
	border:  1px solid #d4d8d9;
	
}
.conwrap{
	width:200px;
	height: 180px;
	margin: 15px;
	border:  1px solid black;
	float: left;
	overflow: hidden;
}
.delwrap{
	width:200px;
	height: 30px;
	
	overflow: hidden;
}
.delbtn{
	width:200px;
	height: 30px;
	background-color: #6e6e6e;
    color: white;
   	border: none;
}
.textwrap{
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	margin-top: 10px;
}

.slide-upload{
      width: 500px;
      height: 210px;
      margin-top: 50px;
      margin-left: 30px;
    
   }
   .slide-file{
      display: none;
   }
   .file-upload-button{
      height: 33px;
      border-radius: 5px;
      background-color: #6e6e6e;
         color: white;
         margin: 0 0 0 0px;
         font-size: 12px;
         border: none;
   }
   .file-label-button{
      width: 70px;
      height: 33px;
      padding: 7px 8px;
      border-radius: 5px;
      font-size: 12px;
      background-color: #6e6e6e;
         color: white;
        cursor: pointer;
   }
   .upload-name { 
      display: inline-block; 
      padding: 5.5px 10px; 
      vertical-align: middle; 
      background-color: #ffffff; 
      border: 1px solid #6e6e6e; 
      border-bottom-color: #6e6e6e; 
      border-radius: .25em; 
      -webkit-appearance: none;
      -moz-appearance: none; 
      appearance: none; 
   }
	.imgspo{
		width: 155px;
		height: 155px;
		
	}
	
</style>
</head>
<body>
			
			 <div class="slide-upload" >
      <form action="./slideInsert" method="post" id="frm" name="frm" enctype="multipart/form-data">
      		
            <input type="file" id="mainImg" name="mainImg" required="required" class="slide-file" style="display: none;" onchange="ImgUpload()">
            <label for="mainImg" class="file-label-button">파일 선택</label>
            <input class="upload-name" value="파일선택" disabled="disabled" >
            
          <input type="button" value="등록" id="insert" class="file-upload-button">
      </form>
      <div class="imgspo">
      	<img alt="미리보기" src="" style="width: 150px; height: 150px;  border: 1px solid #6e6e6e; " id="spo" >
      </div>
   </div>

			
			
			 <div class="textwrap">
			 	<p style="font-size: 18px; font-weight: bold;">메인 슬라이드 이미지</p>
			 	<div></div>
			 	<button id="seqUp" style="  background-color: #6e6e6e;
         color: white;  border: none; width: 150px; height: 30px; margin-top: 20px;">변경</button>
         	<p style="font-size: 11px; color:#757575;  margin-top: 20px;">이미지를 드래그하여 슬라이드 순서를 변경하고 버튼을 눌러주세요!(왼쪽부터 1번째)</p>
			 </div>
			
			 <div class="imgwrap" id="sort">
			 	
			 	
			 	
			 </div>
			<div>
				
			</div>
</body>

	<script type="text/javascript">
 	var seqs=[];
 	var nums=[];
 	$("#seqUp").click(function(){
 		seqs=[];
		nums=[];
		$(".conwrap").each(function(){
			var seq=$(this).attr("id");
			var num=$(this).attr("title");		
			seqs.push(seq);
			nums.push(num);
		});
		
		$.ajax({
			url:"./slideSeqUpdate",
    		type:"POST",
    		dataType : "json",
			data: {seqs:seqs,nums:nums},
			 success:function(result){
    			 
    			 if(result>0){
    				 alert("변경 성공");
    				 
    			 }else{
    				 alert("변경 실패");
    			 }
    			 getList();
   	  			
   			 }
		});
	});
	
	
	
	 $(document).ready(function(){ 
         var fileTarget = $('.slide-file'); 
         fileTarget.on('change', function(){ 
            if(window.FileReader){  
               var filename = $(this)[0].files[0].name; 
            } else {  
               var filename = $(this).val().split('/').pop().split('\\').pop(); 
            } 
            $(this).siblings('.upload-name').val(filename); 
         }); 
      });

	function ImgUpload(){
		var fileInput = document.getElementById("mainImg");
		var file =fileInput.files[0];
		
		var reader = new FileReader();
		reader.onload=function(e){
			$("#spo").attr("src",e.target.result);
		};
		reader.readAsDataURL(file);
	}
	 
	getList();
	var count;
	function getList(){
		$.post("./adminSlide",{},function(data){
			$(".imgwrap").empty();
			$(".imgwrap").append(data);
			
		});
		
		
	}
	
	$(".imgwrap").on("click",".delbtn",function(){
			var num= $(this).val();
			var imgName= $(this).attr("id");
			$.post("./slideDelete",{
				num:num,
				imgName:imgName
			},function(data){
				data=data.trim();
				if(data>0){
					alert("삭제성공");
				}else{
					alert("삭제실패")				
				}
				getList();
			});
	});
	
	$("#insert").click(function(){
		if(count>4){
			alert("메인 슬라이드는 최대 5개까지 등록 가능합니다");
		}else{
			$(this).attr("type","submit");
			$(this).click();
		}
	});
	</script>
</html>