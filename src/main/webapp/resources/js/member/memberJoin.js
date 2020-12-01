/**
 * 
 */
var pwCheck =false;
var pw2Check =false;
var idCheck =false;
var shouldCheck=true;
var mailSend;
var mailCheck=false;
$("#join").click(function(){
	//먼저 필수입력사항 이름 전화번호 이메일  주소3개 태그들의 값의 길이를 should함수를통해 반복문으로 조사함 하나라도 길이가0(입력되지않았다면) shouldCheck가 false가됨
	should();
	//필수 체크박스항목2개가 체크되었는지 확인함
	var must1=$("#must1").prop("checked");
	var must2=$("#must2").prop("checked");
	
	
	//전부다 인증완료되면 컨트롤러로 서브밋함
	if(pwCheck&&pw2Check&&idCheck&&shouldCheck&&must1&&must2&&mailCheck){
		
		$("#frm").submit();
	}else if(!idCheck){
		alert("해당 ID를 사용할 수 없습니다");
		$("#id").focus();
	}else if(!pwCheck){
		alert("해당 패스워드를 사용할 수 없습니다");
		$("#pw").focus();
	}else if(!pw2Check){
		alert("패스워드가 일치하지 않습니다");
		$("#pw2").focus();
	}else if(!mailCheck){
		alert("인증번호를 확인해주세요");
		$("#emailCheck").focus();
	}else if(!shouldCheck){
		alert("필수 항목을 입력해주세요");
		$(".should").each(function(){
			if($(this).val().length==0){
				$(this).focus();
			}
		});
	}else if(!must1||!must2){
		alert("필수 체크항목을 체크해주세요");
		
	}
	
	
});

//id를 검증함  먼저 4~16글자인지 확인후 통과하면 ajax로 디비에 같은아이디가 있는지 확인함 없으면인증완료
$("#id").blur(function(){
	idCheck=false;
	var idSize =$(this).val().length;
	if(idSize>16){
		 $("#idResult").text("최대 16글자까지 가능합니다");
		  $("#idResult").css("color","red");
	}
	else if(idSize<4){
		$("#idResult").text("최소 4글자 이상이어야 합니다");
		  $("#idResult").css("color","red");
	}else{
		var val=$(this).val();	
		 
		 var lower =false;
		 var num=false;
		 for(var i=0; i<val.length;i++){
				var a = val.charAt(i);
				
				if(a>='a'&&a<='z') {
					lower =true;
				}else if(a>=0&&a<=9){
					num =true;
				}
			}
		if(lower&&num){
			 $.post("./memberIdCheck",{id: $(this).val()},function(data){
					
					data=data.trim();
						
					
						if(data==1){
							  $("#idResult").text("사용가능한 아이디입니다");
							  $("#idResult").css("color","blue");
							  idCheck=true;
						  }else{
							  $("#idResult").text("중복된 아이디입니다");
							  $("#idResult").css("color","red");
							 
						  }
					
					
					  
				 }); 
		}else{
			$("#idResult").text("영문 소문자/숫자가 1개이상 포함되어야합니다");
			  $("#idResult").css("color","red");
		}
		
		
		
	}
	 
});

//pw 유효성 검사
//입력하고 포커스아웃하면 글자수를 확인하여 통과하면  charAt으로 대문자 소문자가 1개씩 들어가있는지확인함
$("#pw").blur(function(){
	var pwSize =$(this).val().length;
	 pwCheck =false;
	if(pwSize>16){
		  $("#pwResult").text("최대 16글자까지 가능합니다");
		  $("#pwResult").css("color","red");
	}
	else if(pwSize<8){
		  $("#pwResult").text("최소 8글자 이상이어야 합니다");
		  $("#pwResult").css("color","red");
	}else{
		var val=$(this).val();	
		 var upper =false;
		 var lower =false;
		 var num=false;
		for(var i=0; i<val.length;i++){
			var a = val.charAt(i);
			
			if(a>='A'&&a<='Z') {
				upper=true;
			}else if(a>='a'&&a<='z') {
				lower =true;
			}else if(a>=0&&a<=9){
				num =true;
			}
		}
		if(upper&&lower&&num){
			$("#pwResult").text("사용가능한 패스워드입니다");
			$("#pwResult").css("color","blue");
			pwCheck=true;
		}else{
			$("#pwResult").text("영문 대/소문자/숫자가 1개이상 포함되어야합니다");
			  $("#pwResult").css("color","red");
		}
	}
	
});
//비밀번호가 통과되고 비밀번호확인까지 일치하였는데 사용자가 비밀번호를 추가로 입력하거나 지우면 비밀번호가 일치하지않는다고 출력함
$("#pw").keyup(function(){
	var a=$("#pw2").val().length;
	if(a>0){
		pwEqual();
	}
});
//pw와pw2가 일치하는지 확인함
$("#pw2").keyup(pwEqual);

//pw와 pw2가 일치하는지 확인하는 함수
function pwEqual(){
	pw2Check=false;
	var pw = $("#pw").val();
	var pw2 = $("#pw2").val();
	if(pw==pw2){
		 $("#pw2Result").text("비밀번호가 일치합니다");
		 $("#pw2Result").css("color","blue");
		 pw2Check=true;
	}else{
		 $("#pw2Result").text("비밀번호가 일치하지 않습니다");
		 $("#pw2Result").css("color","red");
	}
}

//필수항목태그들을 반복문을 통해 비어있는태그가있으면 check를 false로함
function should(){
	 shouldCheck=true;
	$(".should").each(function(){
		var c =$(this).val().length;
		if(c<1){
			shouldCheck=false;
		}
	});
}


var checkall = document.getElementById("checkall");
var ch = document.getElementsByClassName("ch");

//전체동의
checkall.addEventListener('click', function() {
   for(var i=0;i<ch.length;i++){
      ch[i].checked = checkall.checked;
   }
});

//
   for(var i=0;i<ch.length;i++) {
      ch[i].addEventListener('click', function() {
         //-----------------------------------------
         var result = true;
         for(var j=0; j<ch.length; j++) {
            if(!ch[j].checked) {
               result = false;
            }
         }
         
         checkall.checked=result;
      });
   }
   
	function CheckEmail(str){                                          
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

     if(!reg_email.test(str)) {                            
          return false;         
     }                            
     else {                       
          return true;         
     }                            
}                                


	//이메일 보내기
	$("#mailSend").click(function(){
		mailCheck=false;
		var cMail= CheckEmail($("#email").val());
		if(!cMail){
			alert("이메일 형식이 아닙니다");
		}else{
			alert("메일로 인증번호가 전송되었습니다");
		$.post("./memberMailCheck",{email :$("#email").val()},function(data){
			data=data.trim();
			mailSend=data;
		});	
		
		}
		
	});
	$("#mailConfirm").click(function(){
		mailCheck=false;
		var a = $("#emailCheck").val();
		if(a==mailSend){
			mailCheck=true;
			alert("확인되었습니다");
		}else{
			alert("인증번호가 일치하지 않습니다");
		}
	});
	
	
	
	$("#cancel").click(function() {
		   location.href="../";
		});