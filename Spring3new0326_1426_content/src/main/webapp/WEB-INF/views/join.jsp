<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<form id="joinForm" action="join.do" method="post" >
		아이디<input type="text" name="user_id" id="temporaryId" class="form-control"><button type="button" id="checkDuplicate">중복확인</button><br>
		<div id="id_result"></div><br>
		비밀번호<input type="password" name="user_pw" class="form-control"><br>
		비밀번호 확인<input type="password" id="user_pw2"><br>
		<div id="pw_result"></div><br>
		휴대폰번호<input type="text" name="user_phone" placeholder= "010-1111-1111" class="form-control">
		<button type=button>인증번호 발송</button><br>
		인증번호<input type="text">
		<!--  학교<input type="text" name="scname" class="form-control">
		학생 인증<input type="file" name="imgpath" class="form-control"> -->
		<button type="submit" id="joinButton">제출</button>
	</form>
	
	<script type="text/javascript">
	
	// $(document).ready(function(){
	// $("#checkDuplicate").on("click", checkAndPop)
	
	 window.onload = function() {
	document.getElementById("checkDuplicate").addEventListener('click',checkAndPop);
	
	function checkAndPop () {
		
		let user_id = document.getElementById("temporaryId").value;
		console.log("checkAndPop 실행");
		$.ajax({
			url: "findDuplicate.do",
			type:"get",
			data: {
				user_id:user_id
				},
			success: function(info){
				
				console.log('info', info.user_id)
				if(info.user_id!=undefined){
					
					console.log(info);
					document.getElementById("id_result").innerText="이미 사용 중인 아이디입니다.";
					document.getElementById("joinButton").disabled=true;
					
					
				}else{
					
					
					document.getElementById("id_result").innerText="사용 가능한 아이디 입니다.";
					document.getElementById("joinButton").disabled=false;
				}
			},
			error: function(){alert("아이디 중복확인에 실패했습니다. 다시 시도해주세요.")}
		});
	}
	
	
	document.getElementById("joinForm").onsubmit = function(){
		let user_pw = document.getElementById("user_pw").value;
		let user_pw2 = document.getElementById("user_pw2").value;
		console.log(user_pw, user_pw2)
		if(user_pw!=user_pw2){
			document.getElementById("pw_result").innerText = "비밀번호가 일치하지 않습니다.";
			return false;
		}else{
			return true;
		}
	}
	}
	</script>
</body>
</html>