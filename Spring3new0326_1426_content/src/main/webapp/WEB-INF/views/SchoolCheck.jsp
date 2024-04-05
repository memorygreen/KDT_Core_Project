<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>
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
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

* {
	font-family: 'Pretendard-Regular';
}
</style>

<!-- index.html에서 그대로 가져옴  -->
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/controller/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">


<!--  카카오 app키 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=724fae357dc77c6df9a18c9fc030d033"></script>

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

<!------------------------------------  회색 고정 최상단 부분 -------------------------------------------->

	<!--반응형 메뉴바 -->
	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="ProductList.do"><img
				src="resources/img/중고스쿨초록색로고누끼완.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<p>${info.user_id}님환영합니다</p>
			<!-- <h1>${sessionScope.info.user_id} 세션으로 테스트</h1> -->

			<!-- 반응형 메뉴 바 내 위젯 주석처리
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
            -->
		</div>

		<!-- 반응형 메뉴바 내 위젯 주석처리
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>-->

		<!-- 반응형 웹 창 축소 시 활성화되는 메뉴-->
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li>
					<!-- 로그인상태면 로그아웃이 보이게하고, 로그아웃상태면 로그인이 보이게 하기 --> <c:choose>
						<c:when test="${not empty sessionScope.info}">
							<a href="logout.do"> <svg xmlns="http://www.w3.org/2000/svg"
									width="16" height="16" fill="currentColor" class="bi bi-lock"
									viewBox="0 0 16 16">
		                        <path
										d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1" />
		                    </svg> 로그아웃 <!--로그인 중이면 로그아웃으로 변하게 하는 기능 필요-->
							</a>
						</c:when>
						<c:otherwise>
							<a href="goLogin.do"> <svg xmlns="http://www.w3.org/2000/svg"
									width="16" height="16" fill="currentColor" class="bi bi-unlock"
									viewBox="0 0 16 16">
							   <path
										d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2M3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1z" />
							</svg> 로그인 <!--로그인 중이면 로그아웃으로 변하게 하는 기능 필요-->
							</a>
						</c:otherwise>
					</c:choose>
				</li>

				<li><c:if test="${not empty sessionScope.info}">
						<a href="myPage.do"> <!-- 마이페이지로 이동하게 변경 필요 --> <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-file-earmark-person"
								viewBox="0 0 16 16">
	                        <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
	                        <path
									d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z" />
	                    </svg> 마이페이지
						</a>
					</c:if></li>

				<li><a href="#"> <svg xmlns="http://www.w3.org/2000/svg"
							width="16" height="16" fill="currentColor"
							class="bi bi-brightness-high" viewBox="0 0 16 16">
                        <path
								d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6m0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8M8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0m0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13m8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5M3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8m10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0m-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0m9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707M4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708" />
                    </svg>다크모드
				</a> <!--<ul class="header__menu__dropdown">
                    <li><a href="./shop-details.html">Shop Details</a></li>
                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                    <li><a href="./checkout.html">Check Out</a></li>
                    <li><a href="./blog-details.html">Blog Details</a></li>
                </ul>--></li>
				<li class="active"><a href="ProductList.do"><svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
                        <path
								d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z" />
                        <path
								d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8m0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0M4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0m0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0" />
                      </svg>상품목록</a></li>
				<!--
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
                -->
			</ul>
		</nav>



		<div id="mobile-menu-wrap"></div>
		<!-- 반응형 메뉴바 내 하단 이모티콘 주석처리
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        -->
		<div class="humberger__menu__contact">
			<!--
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
            -->
		</div>
	</div>
	<!-- Humberger End -->
	<!--반응형 메뉴바 끝-->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">

						<!-- 상단 좌측 이메일 삭제
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>-->

					</div>

					<!-- 최상단 고정 메뉴바 우측  -->
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">

							<div class="header__top__right__social">
								<!--  
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>-->

								<!-- 다크모드 -->
								<a href="#"> <svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" fill="currentColor"
										class="bi bi-brightness-high" viewBox="0 0 16 16">
                                        <path
											d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6m0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8M8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0m0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13m8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5M3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8m10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0m-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0m9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707M4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708" />
                                      </svg>다크모드
								</a>
							</div>

							<!-- 로그인 했을 때에만 마이페이지 보이게 하기  -->
							<c:if test="${not empty sessionScope.info}">
								<div class="header__top__right__language">
									<!-- 마이페이지 -->
									<!-- 로그인 전이면 안 보이게 하는 조건문 추가 필요 -->
									<a href="myPage.do"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-house-fill"
											viewBox="0 0 16 16">
		 										<path
												d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z" />
		  										<path
												d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z" />
											</svg> 마이페이지
									</a>

									<!--언어선택 리스트 주석처리
	                                <img src="img/language.png" alt="">
	                                <div>English</div>
	                                <span class="arrow_carrot-down"></span>
	                                  
	                                <ul>
	                                    <li><a href="#">Spanis</a></li>
	                                    <li><a href="#">English</a></li>
	                                </ul>-->

								</div>

							</c:if>
							<!-- 로그인 상태면 로그아웃으로 보이게, 로그아웃상태면 로그인으로 보이게 -->
							<c:choose>
								<c:when test="${not empty sessionScope.info}">
									<div class="header__top__right__auth">
										<a href="logout.do"><i class="fa fa-user"></i>로그아웃</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="header__top__right__auth">
										<a href="goLogin.do"> <i class="fa fa-user"></i>로그인
										</a>
									</div>
								</c:otherwise>
							</c:choose>



						</div>
					</div>
					<!-- 최상단 고정 메뉴바 우측 끝 -->


				</div>
			</div>
		</div>
		
		<!--------------------------------------  회색 고정 최상단 부분 끝 ----------------------------------------->
		
		
		
		<!-- -----------------------------------로고 시작------------------------------------------- --> 
		
		<div class="container">
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">

					<div class="header__logo">
						<a href="ProductList.do"><img
							src="resources/img/중고스쿨초록색로고누끼완.png" alt="경로를 다시 입력해주세요"></a>
					</div>
<!-- -----------------------------------------로고 끝 ---------------------------------------------------->
					<!--상단 네비게이션바 삭제
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html">Home</a></li>
                            <li><a href="./shop-grid.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>-->
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>

							<!-- 상단 하트모양  지우기 -->
							<!-- 
                             <li>
                            	<a href="#"> 
                            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
 										<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
  										<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z"/>
									</svg> 마이페이지
								</a>
							</li>-->
							<!--상단 장바구니 모양 지우기(?)-->
							<!-- 
                            <li><a href="goLogin.do">
	                            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
	 									<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
									</svg> 로그인
								</a>
							</li>
							 -->

							<!--  관리자 페이지 보여줘야하나? -->

						</ul>

						<!--가격 없애기
                        <div class="header__cart__price">item: <span>$150.00</span></div>-->
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->
<!-- ---------------------------학교 정보 시작-------------------------------- -->
<!--  학교 정보 스타일 적용 -->


	<div id="blank_space"></div>

	<style>
	#blank_space {
	height: 20%;
	width: 100%;
}

#schoolInfo {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: auto;
	margin: 0 auto;
}

.nice-select {
	display: inline-block;
	float: none;
	padding-bottom: 10px;
	padding-top: 2px;
}

.site-btn {
	margin-top: 10px;
}

#footerBeginSpace {
	width: auto;
	height: 20%;
}
#blank_space {
	height: 20%;
	width: 100%;
}

#SchoolSelect {
	display: flex;
	margin: 0 auto;
	align-items: center;
	width: auto;
	margin: 0 auto;
	padding-top: 50px;
	font-size: 20px;
}

#guide1{
	display: inline-block;
    width: 100px;
    height: 50px;
    padding-top: 10px;
}

#schoolType{
	display: flex;
	float:none;
    width: auto;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    font-size:20px;
}

#schoolList{
	font-size:20px;
	margin-left: 10px;
}

.form-control{
	width:auto;
}

.nice-select {
	display: flex;
	float: none;
	padding-bottom: 10px;
	padding-top: 2px;
}

.site-btn {
	margin-top: 10px;
}

#uploadID{
	display:flex;
	font-size: 20px;
	margin-top:50px;
}

#guide2{
	display: inline-block;
    width: 130px;
    height: 50px;
}

#uploadBtn{
	width:auto;
}
#footerBeginSpace {
	width: auto;
	height: 20%;
}
</style>

<!-- 학교정보 입력 부분 -->
	<div class="contact__form__title">
		<h2>학교정보 업로드</h2>
	</div>

	<form id="schoolInfo" action="UpdateSchoolInfo.do" method="POST"
		enctype="multipart/form-data">
		<!-- Map Begin -->


		<div id="map" style="width: 1470px; height: 700px;"></div>
		<br>
		<!-- Map End -->



		
		
		<div id="SchoolSelect">
		<span id="guide1">학교선택</span>
			<select id="schoolType">
				<option value="">학교 유형을 선택하세요</option>
				<option value="middle">중학교</option>
				<option value="high">고등학교</option>

			</select> <select id="schoolList" type="text" name="user_sc_nm"
				class="form-control">
				<option value="">먼저 학교 유형을 선택하세요</option>
			</select>
			
		</div>
		<div id="uploadID">
			<span id="guide2">학생증 업로드</span><input type="file" name="user_sc_img" class="form-control">
		</div>
		<div id="btn_space"></div>
		<button id="uploadBtn" type="submit" class="site-btn">제출</button>
		
		<!--  학교정보 js 이벤트 -->
		<script>
			window.onload = function() {

				// 학교 타입 선택 시 option 생성
				document.getElementById("schoolType").addEventListener(
						"change", function(e) {
							// $('#schoolType').niceSelect().on('change', function(e) {
							let arrType = getSchoolList().obj;
							let schoolList = $("#schoolList");
							schoolList.empty(); // 전에 생성된 옵션 비우기
							schoolList.append($('<option>', {
								value : "",
								text : "학교를 선택하세요"
							})); 
							
							// 중학교 선택시 중학교들 옵션 생성
							if (e.target.value === "middle") {
								arrType.middle.forEach(function(school) {
									schoolList.append($('<option>', {
										value : school.value,
										text : school.name
									}));
								});
								// 고등학교 선택 시 고등학교들 옵션 생성
							} else if (e.target.value === "high") {
								arrType.high.forEach(function(school) {
									schoolList.append($('<option>', {
										value : school.value,
										text : school.name
									}));
								});
							}
						});
				
				// 학교목록들
				function getSchoolList() {
					var obj = {
						middle : [ {
							name : '조선대학교부속중학교',
							value : '조선대학교부속중학교'
						}, {
							name : '살레시오여자중학교',
							value : '살레시오여자중학교'
						}, {
							name : '조선대학교여자중학교',
							value : '조선대학교여자중학교'
						} ],
						high : [ {
							name : '전남여자고등학교',
							value : '전남여자고등학교'
						}, {
							name : '살레시오여자고등학교',
							value : '살레시오여자고등학교'
						}, {
							name : '조선대학교여자고등학교',
							value : '조선대학교여자고등학교'
						} ]
					}
					return {
						obj : obj
					};
				}
				
				// 카카오 지도
				
				latitude = 33.450701
				longitude = 126.570667

				//지도 생성
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center : new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
					level : 5
				//지도의 레벨(확대, 축소 정도)
				}

				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

				// 지도 업데이트
				document
						.getElementById("schoolType")
						.addEventListener(
								"change",
								function(e) {
									if (e.target.value === "middle") {
										// 중학교 위치로 업데이트
										// setCenter(35.145303,126.929504)
										setCenter(35.149789, 126.919961);
										// 노란색 마커를 표시할 위치와 title 객체 배열입니다 
										var positions = [
												{
													title : '조선대학교부속중학교',
													latlng : new kakao.maps.LatLng(
															35.143772,
															126.927952)
												},
												{
													title : '조선대학교여자중학교',
													latlng : new kakao.maps.LatLng(
															35.145134,
															126.931544)
												},
												{
													title : '살레시오여자중학교',
													latlng : new kakao.maps.LatLng(
															35.146319,
															126.929679)
												} ];

										// 마커 이미지의 이미지 주소입니다
										var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

										for (var i = 0; i < positions.length; i++) {

											// 마커 이미지의 이미지 크기 입니다
											var imageSize = new kakao.maps.Size(
													24, 35);

											// 마커 이미지를 생성합니다    
											var markerImage = new kakao.maps.MarkerImage(
													imageSrc, imageSize);

											// 마커를 생성합니다
											var marker = new kakao.maps.Marker(
													{
														map : map, // 마커를 표시할 지도
														position : positions[i].latlng, // 마커를 표시할 위치
														title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
														image : markerImage
													// 마커 이미지 
													});
										}

										// 파란색 마커
										// 마커가 표시될 위치입니다 
										var markerPosition = new kakao.maps.LatLng(
												35.149789, 126.919961);

										// 마커를 생성합니다
										var marker = new kakao.maps.Marker({
											position : markerPosition
										});

										// 마커가 지도 위에 표시되도록 설정합니다
										marker.setMap(map);

									} else if (e.target.value === "high") {

										//setCenter(35.149838, 126.92582); 
										setCenter(35.149789, 126.919961); // 고등학교 위치로 업데이트

										// 마커를 표시할 위치와 title 객체 배열입니다 
										var positions = [
												{
													title : '살레시오여자고등학교',
													latlng : new kakao.maps.LatLng(
															35.146943,
															126.929784)
												},
												{
													title : '조선대학교여자고등학교',
													latlng : new kakao.maps.LatLng(
															35.146454,
															126.932433)
												},
												{
													title : '전남여자고등학교',
													latlng : new kakao.maps.LatLng(
															35.151362,
															126.920602)
												} ];

										// 마커 이미지의 이미지 주소입니다
										var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

										for (var i = 0; i < positions.length; i++) {

											// 마커 이미지의 이미지 크기 입니다
											var imageSize = new kakao.maps.Size(
													24, 35);

											// 마커 이미지를 생성합니다    
											var markerImage = new kakao.maps.MarkerImage(
													imageSrc, imageSize);

											// 마커를 생성합니다
											var marker = new kakao.maps.Marker(
													{
														map : map, // 마커를 표시할 지도
														position : positions[i].latlng, // 마커를 표시할 위치
														title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
														image : markerImage
													// 마커 이미지 
													});
										}

										// 파란색 마커
										// 마커가 표시될 위치입니다 
										var markerPosition = new kakao.maps.LatLng(
												35.149789, 126.919961);

										// 마커를 생성합니다
										var marker = new kakao.maps.Marker({
											position : markerPosition
										});

										// 마커가 지도 위에 표시되도록 설정합니다
										marker.setMap(map);

									}

								});

				function setCenter(lat, lang) {
					// 이동할 위도 경도 위치를 생성합니다 
					var moveLatLon = new kakao.maps.LatLng(lat, lang);

					// 지도 중심을 이동 시킵니다
					map.setCenter(moveLatLon);
				}

				function DeleteMarkers() {
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null);
					}
				}

			}
		</script>



	</form>
<!-- --------------------------------학교정보 끝 --------------------------------------------->
	
	
	
	
	<!-- 문의하기 부분 삭제-->
	<!--
    <!-- Contact Form Begin 
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>Leave Message</h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your name">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your Email">
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea placeholder="Your message"></textarea>
                        <button type="submit" class="site-btn">SEND MESSAGE</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->
	
	
	<!----------------------------- 마지막 하단 반복되는 부분 --------------------------------------------->

	<div id="footerBeginSpace"></div>

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="ProductList.do"><img
								src="resources/img/중고스쿨초록색로고누끼완.png" alt=""></a>
						</div>
						<!-- 하단 회사정보 삭제
                    <ul>
                        <li>Address: 60-49 Road 11378 New York</li>
                        <li>Phone: +65 11.188.888</li>
                        <li>Email: hello@colorlib.com</li>
                    </ul>
                    -->
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">



					<!-- footer 이용약관 청소년보호정책 등 -->

					<div class="footer__widget">

						<!--
                    <h6>Useful Links</h6>-->

						<!-- 
                    <ul>
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                        
                        <!-- 하단 삭제
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        -->
						</ul>


						<ul>
							<!--
                        <li><a href="#">청소년 보호정책</a></li>
                        <li><a href="#">회사 정보</a></li>
                     -->
							<!--
                        <li><a href="#">Who We Are</a></li>
                        <li><a href="#">Our Services</a></li>
                        
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Innovation</a></li>
                        <li><a href="#">Testimonials</a></li>
                         
                    </ul>
                   
                </div>
            </div>


            <!-- 하단 구독메일 삭제
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Join Our Newsletter Now</h6>
                    <p>Get E-mail updates about our latest shop and special offers.</p>
                    <form action="#">
                        <input type="text" placeholder="Enter your mail">
                        <button type="submit" class="site-btn">Subscribe</button>
                    </form>

                    <!-- 우측 하단 위젯 버튼 삭제
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                    
                </div>
                -->
					</div>

				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="footer__copyright">
							<div class="footer__copyright__text">
								<p>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									Copyright &copy;
									<script>
										document
												.write(new Date().getFullYear());
									</script>
									All rights reserved | This template is made with <i
										class="fa fa-heart" aria-hidden="true"></i> by <a
										href="https://colorlib.com" target="_blank">Colorlib</a>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</p>
							</div>
							<div class="footer__copyright__payment">
								<!--<img src="img/payment-item.png" alt=""> -->
							</div>
						</div>
					</div>
				</div>
			</div>
	</footer>
	<!-- Footer Section End -->
<!----------------------------- 마지막 하단 반복되는 부분 끝 --------------------------------------------->

	<!-- Js Plugins -->
	<script src="/controller/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/controller/resources/js/bootstrap.min.js"></script>
	<!--  <script src="/controller/resources/js/jquery.nice-select.min.js"></script>-->
	<script src="/controller/resources/js/jquery-ui.min.js"></script>
	<script src="/controller/resources/js/jquery.slicknav.js"></script>
	<script src="/controller/resources/js/mixitup.min.js"></script>
	<script src="/controller/resources/js/owl.carousel.min.js"></script>
	<script src="/controller/resources/js/main.js"></script>



</body>
</html>