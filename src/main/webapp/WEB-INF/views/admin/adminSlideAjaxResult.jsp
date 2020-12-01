<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  			
 			 <c:forEach items="${list}" var="dto">
 			 
			 		<div class="conwrap" id="${dto.seq}" title="${dto.num}">
			 		<div class="delwrap">
			 			<button class="delbtn" value="${dto.num}" id="${dto.imgName}">삭제</button>
			 		</div>
			 		<div>
			 			<img alt="" src="../resources/upload/slide/${dto.imgName}" style="width: 200px;height: 150px;">
			 		</div>
			 	</div>
			 	
			 	</c:forEach>
			 	
			 	
			 	<input type="hidden" value="${count}" id="count">
			 	
			 	
			 	<script type="text/javascript">
			 	count=$("#count").val();
			 	$(function(){ $( "#sort" ).sortable({
			 		update : function (){
			 			$("#sort >div").each(function(index){
			 				$(this).attr("id",index+1);
			 				
			 			});
			 		}
			 	}); 
				
				});
			
			 	</script>