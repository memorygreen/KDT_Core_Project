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
	<div><h1>회원 탈퇴 창</h1></div>

	<h1>회원 탈퇴를 하시겠습니까?</h1>
	<a href="memberOut.do" class="btn btn-info">예</a> 
	<a href="myPage.do" class="btn btn-danger">아니오(마이페이지로 이동)</a>
	
	
	
	<a href="ProductUpdateForm.do?idx=${prod.prod_idx}" class="btn btn-info">수정화면</a> 
	<a href="ProductDelete.do?idx=${prod.prod_idx}" class="btn btn-warning">삭제</a> 






</body>
</html>




