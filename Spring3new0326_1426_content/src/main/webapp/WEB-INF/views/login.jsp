<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>





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

<!-- Css Styles -->
<link rel="stylesheet" href="resources/css/login.css">
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
</head>
<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>



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
		<div class="container">
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">

					<div class="header__logo">
						<a href="ProductList.do"><img
							src="resources/img/중고스쿨초록색로고누끼완.png" alt="경로를 다시 입력해주세요"></a>
					</div>

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

	<!--<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"> -->
	
	<style>
	
	.login_input{
	margin-top:4%;
	width:100%;
}

#login_btn{
	margin-top:4%;
	border-radius: 4px;
}

#join_btn{
	border-radius: 4px;
}



input {
    height: 50px;
    width: 95%;
    border-radius: 4px;
    margin-bottom: 0%;
    margin-top: 4%;
    border:0.5px solid lightgray;
    color: black;
    padding-left: 4%;
    font-family: FontAwesome, "Open Sans", Verdana, sans-serif;
    font-style: normal;
    font-weight: normal;
    text-decoration: inherit;
}

button {
    height: 47px;
    width: 100%;
    border-radius: 7px;
    border: none;
    margin-top: 3%;
    background: #d0d6cf;
    color: #000000;
    font-family: sans-serif;
    font-weight: 400;
    font-size: 11.5pt;
}

form {
    width: 100%;
    margin-top: 5%;
    margin-bottom: 10%;
    text-align: center;
}

input:focus {
    outline: none
}

.logo {
    color: white;
    font-family: sans-serif;
    font-size: 15pt;
    font-weight: 600;
    text-align: center;
    padding-top: 40px
}



.myform {
    background: #ffffffc9;
    border-radius: 1%;
    width: 20%;
    margin: auto;
    margin-top: 5%;
    height: 500px;
    /*border:0.5px solid lightgray; */
}

.myform {
    text-decoration: none;
    font-family: sans-serif;
    letter-spacing: .1em;
}

a {
    text-decoration: none;
    color: rgb(255, 255, 255);
    font-family: sans-serif;
    letter-spacing: .1em;
    
}

.line{
    width: 80%; 
    border-top: 1px solid lightgray;
    margin: auto;
    margin-top: 10%;
}

 ::-webkit-input-placeholder {
    /* Chrome/Opera/Safari */
     color: #cccccc;
   
}

.fa-cloud-upload {
    
}

.fafa{
    position: relative;
    bottom: 0%;
}

#kakao_btn{
    background-image: url(./img/kakaologin.png);
    background-position: center;
    margin-top: 2%;
}

#kakao_btn_space{
    margin: 5% 0%;
}

#join_btn{
    
    background: #44bd32;
}

#join_btn_space{
    margin: 10% 0%;
}




	</style>
	<div class="myform">

		<form action="login.do" method="post">
			<input class="login_input" type="text" name="user_id" class="form-control" placeholder="&#xf003;   아이디" /> 
			<input class="login_input"
				type="password" name="user_pw" class="form-control" placeholder="&#xf003;   비밀번호" />
			<button id="login_btn" type="submit">로그인</button>
			<div id="kakao_btn_space">
				<a href="javascript:kakaoLogin()"><img
		src="${pageContext.request.contextPath}/resources/board/kakao_login_medium_wide.png"></a>
			</div>
			<div class="line"></div>
			<div id="join_btn_space">
				<button id="join_btn" type="button" onclick="location.href='goJoin.do'">회원가입</button>
			</div>
		</form>
	</div>
	
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
								<img src="img/payment-item.png" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
	</footer>
	<!-- Footer Section End -->


	<!-- Js Plugins -->
	<script src="login.js"></script>
	<script src="/controller/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/controller/resources/js/bootstrap.min.js"></script>
	<script src="/controller/resources/js/jquery.nice-select.min.js"></script>
	<script src="/controller/resources/js/jquery-ui.min.js"></script>
	<script src="/controller/resources/js/jquery.slicknav.js"></script>
	<script src="/controller/resources/js/mixitup.min.js"></script>
	<script src="/controller/resources/js/owl.carousel.min.js"></script>
	<script src="/controller/resources/js/main.js"></script>

</body>
</html>