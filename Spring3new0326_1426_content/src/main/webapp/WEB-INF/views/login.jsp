<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login.do" method="post">
		아이디<input type="text" name="user_id" class="form-control"><br>
		비밀번호<input type="password" name="user_pw" class="form-control"><br>
		<button type="submit">로그인</button>
	</form>

	<button type="button" onclick="location.href='goJoin.do'">회원가입</button>
</body>
</html>