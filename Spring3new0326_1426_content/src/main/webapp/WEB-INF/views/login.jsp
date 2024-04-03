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
<a href="javascript:kakaoLogin()"><img
		src="${pageContext.request.contextPath}/resources/board/kakao_login_medium_wide.png"></a>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		window.Kakao.init("724fae357dc77c6df9a18c9fc030d033")
		
		function kakaoLogin(){
			window.Kakao.Auth.login({
				success: function(authObj){
				console.log("로그인 성공")
				
			    Kakao.Auth.authorize({
				      redirectUri: 'http://localhost:8081/controller/ProductList.do',
				    });
				
				}
				});
			}
		
		function getCookie(name) {
		    var parts = document.cookie.split(name + '=');
		    if (parts.length === 2) { return parts[1].split(';')[0]; }
		  }
		
	</script>
	<button type="button" onclick="location.href='goJoin.do'">회원가입</button>
</body>
</html>