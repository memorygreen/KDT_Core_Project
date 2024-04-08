<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<!-- 영표쌤이 추가해주심(240329 10:55 팀별 피드백) -->
	<style>
		  	@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
		
		*{
		font-family: 'Pretendard-Regular';}
	</style>



<!-- index.html에서 그대로 가져옴  -->
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="/controller/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="/controller/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet"
	href="/controller/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/controller/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="/controller/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet"
	href="/controller/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/controller/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/controller/resources/css/style.css"
	type="text/css">

<!-- 말풍선 css -->
	

</head>
<body>







	<!-- Js Plugins -->
	<script src="/controller/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/controller/resources/js/bootstrap.min.js"></script>
	<script src="/controller/resources/js/jquery.nice-select.min.js"></script>
	<script src="/controller/resources/js/jquery-ui.min.js"></script>
	<script src="/controller/resources/js/jquery.slicknav.js"></script>
	<script src="/controller/resources/js/mixitup.min.js"></script>
	<script src="/controller/resources/js/owl.carousel.min.js"></script>
	<script src="/controller/resources/js/main.js"></script>





<!-- /*////////*/*/*/*/ /*////////*/*/*임시로 만든 화면/*/ /*////////*/*/*/*/ /*////////*/*/*/*/ /*////////*/*/*/*/ -->
	<div><h1>마이페이지</h1></div>

	<!-- 자영 : 로그인한 회원의 id에 해당하는 내상품목록 화면으로 이동  -->
    <form action = "goMyProductList.do" method="post"> <!-- 자영 : post방식으로 가도 괜찮은걸까? -->
    	<input type="hidden" name="user_id" value="${sessionScope.info.user_id}">
		<button type="submit" class="btn" style="background-color: #44bd32; color: white; font-weight: bold;">내 상품 보기(임시)</button>
    </form>

	<!-- 자영 : 회원탈퇴 창으로 이동(임시) -->
	<form action = "goMemberOutForm.do" method="post"> 
    	<input type="hidden" name="user_id" value="${sessionScope.info.user_id}">
		<button type="submit" class="btn" style="background-color: #44bd32; color: white; font-weight: bold;">회원 탈퇴</button>
    </form>
	
	<!--자영:  마이페이지 - 임시로 학교인증 창으로 이동 -->
	<form action = "goSchoolCheck.do" method="post"> 
    	<input type="hidden" name="user_id" value="${sessionScope.info.user_id}"> <!-- 자영 : 임시로 넣음 지원씨한테 id값 넘겨야하는지 물어봐야함 -->
		<button type="submit" class="btn" style="background-color: #44bd32; color: white; font-weight: bold;">학교인증 페이지로 이동(임시)</button>
    </form>

</body>
</html>




