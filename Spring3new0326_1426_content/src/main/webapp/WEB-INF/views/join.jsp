<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join.do" method="post" >
		아이디<input type="text" name="user_id" id="temporaryId" class="form-control"><button type="button" id="checkDuplicate">중복확인</button><br>
		<div id="result"></div><br>
		비밀번호<input type="password" name="user_pw" class="form-control"><br>
		비밀번호 확인<input type="password"><br>
		휴대폰번호<input type="text" name="user_phone" placeholder= "010-1111-1111" class="form-control">
		<button>인증번호 발송</button><br>
		인증번호<input type="text">
		<!--  학교<input type="text" name="scname" class="form-control">
		학생 인증<input type="file" name="imgpath" class="form-control"> -->
		<button type="submit" id="joinButton">제출</button>
	</form>
	
	
</body>
</html>