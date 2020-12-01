<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/bootStrap.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet"href="../resources/css/common/common.css">

</head>
<body>
<c:import url="../common/header.jsp"></c:import>

<div class="container">
<form action="./productUpdate"method="post" id="frm"enctype="multipart/form-data">
	<div class="form-group">
      <input type="hidden" class="form-control" id="num"  name="num"  value="${dto.num}">
    </div>
    <div class="form-group">
      <label for="name">상품명:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required="required" value="${dto.name}">
    </div>
    
     <div class="form-group">
      <label for="price">가격:</label>
      <input type="number" class="form-control" id="price" placeholder="Enter price" name="price"required="required"value="${dto.price}">
    </div>
    <div class="form-group">
      <label for="mainImg">메인이미지:</label>
      <input type="file" class="form-control" id="mainImg"  name="mainImg" required="required"  onchange="ImgUpload()">  
    </div>
    
    	<div class="form-group" style="width: 155px; height: 155px; ">
					<img alt="미리보기" src="" style="width: 150px; height: 150px; border: 1px solid #6e6e6e;" id="spo">
			</div>
    <div class="form-group">
      <label for="introduce">상품설명:</label>
     	<textarea class="form-control" rows="10" id="introduce" name="introduce" required="required" >${dto.introduce}</textarea>
     	 </div>	
     <div class="form-group">
      <label for="sale">할인률:</label>
      <input type="number" class="form-control" id="sale" placeholder="Enter sale" name="sale" value="${dto.sale}" min="0" max="100">
    </div>	
    
    <input type="submit" class="btn btn-primary" value="수정" id="btn">
    <input type="button" class="btn btn-info" value="취소" id="cancel">
    </form>
    </div>
    <c:import url="../common/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/common/common.js"></script>

<script type="text/javascript">
function ImgUpload(){
	var fileInput = document.getElementById("mainImg");
	var file =fileInput.files[0];
	
	var reader = new FileReader();
	reader.onload=function(e){
		$("#spo").attr("src",e.target.result);
	};
	reader.readAsDataURL(file);
}

$("#introduce").summernote({
	height:800, 
	
	callbacks:{
    	  //이미지를 올렸을때
         onImageUpload: function(files, editor) {
            var formData = new FormData(); //가상의 form태그 작성
            
            
                formData.append('file',files[0]); //파라미터 이름을 file로
           
        
            
            $.ajax({
               type:"POST",
               url:"./summernote/summernote",
               data:formData,
               enctype:"multipart/form-data",
               cache:false,
               contentType:false,
               processData: false,
               success: function(data) {
                 	data=data.trim();
                 	data="../resources/upload/product/"+data;
                 	
                 	$("#introduce").summernote('editor.insertImage',data);
               }
            });
         },//upload end
         onMediaDelete: function(files){
        	  var fileName =$(files[0]).attr("src");
        	  var a=fileName.split("/");
        	  fileName=a[a.length-1];
        	 $.ajax({
        		 type:"POST",
	             url:"./summernoteDelete",
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
$("#introduce").summernote('justifyCenter');
	$("#cancel").click(function(){
		location.href="./productSelect?num=${dto.num}";
	});
	
</script>
</body>
</html>