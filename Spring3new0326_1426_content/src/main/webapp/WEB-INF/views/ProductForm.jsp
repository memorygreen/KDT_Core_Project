<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zxx">

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

	<!--반응형 메뉴바-->
	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="ProductList.do"><img src="img/중고스쿨초록색로고누끼완.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<p>님 환영합니다</p>
		</div>
		<!-- 반응형 메뉴바 내  위젯 주석처리
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                
                <span class="arrow_carrot-down"></span>
                
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



	<!--움직이는 상단바 주석
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
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
                <a href="#"><i class="fa fa-user"></i> </a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
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
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>-->
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6" id="col_change1">


						<div class="header__top__left">
							<!--
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                            -->
						</div>
					</div>



					<!-- 최상단 고정 메뉴바 우측  -->
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right" id="welcome_space">
							<div class="header__top__right__social">
								<c:if test="${not empty sessionScope.info}">
									<span font-size="20px" id="welcome">${sessionScope.info.user_id}님
										환영합니다</span>
								</c:if>

							</div>
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

							<style>
#welcome_space {
	width: 200%;
}

#welcome {
	white-space: nowrap;
	width: 300%;
}

#col_change1 {
	margin-left: -35%;
}
</style>

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
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">

					<!-- 상단 로고-->
					<div class="header__logo">
						<a href="ProductList.do"><img src="img/중고스쿨초록색로고누끼완.png"
							alt=""></a>
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
				<!--<div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <!--상단 하트모양  지우기 
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>-->
				<!--상단 장바구니 모양 지우기(?)
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>-->

				<!--가격 없애기
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>-->

			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">

				<div class="col-lg-3">
					<!--좌측 카테고리 삭제
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                    -->
				</div>

				<!--검색창-->
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									All Categories <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="필요한 상품을 검색해보세요">
								<button type="submit" class="site-btn">검색</button>
							</form>
						</div>
						<!--상단 전화번호 없애기
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>-->
					</div>

					<!--메인 가운데 광고 삭제
                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">수정했어요</a>
                        </div>
                    </div>-->
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<!--상품 나열 주석 처리 
        <section class="categories">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>테스트용입니다 과연 나올까</h2>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            
                <div class="row">
                 
                <div class="categories__slider owl-carousel">
                  
                    <div class="col-lg-3">
                
                        <div class="categories__item set-bg" data-setbg="img/categories/가방4.jpg">
                            <h5><a href="#">db에서 상품제목 가져와야해요1</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        
                        <div class="categories__item set-bg" data-setbg="img/categories/가방105.jpg">
                            <h5><a href="#">db에서 상품제목 가져와야해요2</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/가방132.jpg">
                            <h5><a href="#">db에서 상품제목 가져와야해요3</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/가방137.jpg">
                            <h5><a href="#">db에서 상품제목 가져와야해요4</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/가방164.jpg">
                            <h5><a href="#">db에서 상품제목 가져와야해요5</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section-->
	<!-- Categories Section End -->

	<!-- Featured Section Begin -->


	<div class="panel panel-default">
		<div class="container">
			<!-- 자영 생성(240325) -->
			<h2 style="font-size: xx-large;">ProductForm - 상품등록 작성 화면</h2>
			<div class="panel panel-default">
				<div class="panel-heading"
					style="color: #333333; background-color: #F5f5f5; padding: 10px 15px;">내
					물건 팔기</div>
				<div class="panel-body" style="color: #333333; padding: 15px;">

					<form action="ProductInsert.do" method="post"
						enctype="multipart/form-data">
						<table class="table">
							<tbody>
								<tr>
									<td>사진 파일</td>
									<td><input type="file" name="prod_img_path"
										class="form-control"></td>
								</tr>

								<tr>
									<td>상품명</td>
									<td><input type="text" name="prod_name"
										class="form-control"></td>
								</tr>

								<tr>
									<td>상품가격</td>
									<!-- 자영:가격이라서 number타입으로 적었어요 -->
									<td><input type="number" name="prod_price"
										class="form-control"></td>
								</tr>


								<tr>
									<td>상품에 대한 자세한 설명</td>
									<td><textarea name="prod_desc" rows="7"
											class="form-control"></textarea></td>

								</tr>



								<tr>
									<td colspan="2" align="center">
										<button type="reset" class="btn btn-danger">글작성 취소</button>
										<button type="submit" class="btn btn-warning">글작성 완료</button>

									</td>
								</tr>
							</tbody>

						</table>

					</form>

					<div class="panel-footer"
						style="color: #333333; background-color: #F5f5f5; padding: 10px 15px;">ProductForm</div>

				</div>







				<!--다은 상품등록화면 만든거 주석처리
    <style>
        
        table{
            
            margin-left:auto; 
            margin-right:auto;
            
        }
    

        #myproduct_title::after{
            background-color: rgba(240, 248, 255, 0);

        #tds{
            text-align: left;
        }
        }
        </style>
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div id="widraw_title" class="section-title">
                        <h2 id=myproduct_title style="font-size: x-large;">내 상품 등록</h2>
                       

                        <form id="form1" name="form1" enctype="multipart/form-data" method="post">
                               <table border="2" cellspacing="10">
                                
                                <tr>
                                    <td id="tds" style="font-weight: bold;" text-align:left;>상품명</td>
                                    <td style="text-align: left;"><input type="text"  name="productName" id="productName" ></td>
                                </tr>
                                <tr>
                                    <td id="tds2" style="font-weight: bold;">가격</td>
                                    <td style="text-align: left;"><input type="text" name="productPrice" id="=productPrice"></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">상품설명</td>
                                    <td><textarea rows="6" cols="60" name="productDesc" id="productDesc" placeholder="설명을 입력하세요"></textarea></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">상품이미지</td>
                                    <td style="text-align: left;"><input type="file" name="productPhoto" id="productPhoto"></td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="button" value="등록" id="addBtn">
                                        <input type="button" value="목록" id="listBtn">
                                    </td>
                                </tr>
                            </table>
                        </form>-->

				<!--탈퇴하기 기능 주석 처리
                        <svg xmlns="<svg xmlns="http://www.w3.org/2000/svg" width="30" height="40" color="red" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                          </svg>
                          
                        <p>정말 탈퇴하시겠습니까?</p>
                            
                        <p>탈퇴 버튼 선택 시, 계정은 삭제되며 복구되지 않습니다.</p>
                    
                        <style>
                                                       
                    
                            button {
                            
                              background-color: gray;
                              border: none;
                              border-radius:10px;
                              color: black;
                              padding: 8px;
                              min-height: 15px;
                              min-width: 20px;
                              text-align: center;
                              text-decoration: none;
                              display: inline-block;
                              font-size: 13px;
                              font-weight: bolder;
                              margin: 4px 2px;
                              cursor: pointer;
                              height: 20%;
                                  }
                    
                            .submit{
                                height: 10%;
                            }
                            #widraw_title ::after{
                                position: absolute;
                                left: 0;
                                bottom: -15px;
                                right: 0;
                                height: 4px;
                                width: 80px;
                                background: #7ead3900;
                                content: "";
                                margin: 0 auto; 
                            }
                           
                            </style>
                    
                        <body>
                    
                            <div class="submit">
                                <button type="submit">완료</button>   
                                <button type="submit" class="button-blue">취소</button>
                            </div>
                        </body>
                    
                    </div>
                    <div class="featured__controls">
                        <!--상품목록 삭제
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".oranges">Oranges</li>
                            <li data-filter=".fresh-meat">Fresh Meat</li>
                            <li data-filter=".vegetables">Vegetables</li>
                            <li data-filter=".fastfood">Fastfood</li>
                        </ul>
                    </div>
                </div>
            </div>-->

				<!--상품목록 시작 주석처리
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명1</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명2</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명3</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명4</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명5</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명6</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-7.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명7</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-8.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명8</h6>
                        </div>
                    </div>
                </div>
            </div>-->
				<!--상품목록 끝-->

				<!--상품목록 시작 주석 처리
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명9</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명10</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명11</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명12</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명13</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명14</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-7.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명15</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-8.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                            <h6>학교명16</h6>
                        </div>
                    </div>
                </div>
            </div>-->
				<!--상품목록 끝-->

			</div>
			</section>
			<!-- Featured Section End -->

			<!-- Banner Begin -->
			<div class="banner">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="banner__pic">
								<!--<img src="img/banner/banner-1.jpg" alt="">-->
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="banner__pic">
								<!--<img src="img/banner/banner-2.jpg" alt="">-->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Banner End -->

			<!-- Latest Product Section Begin 주석처리
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>조회순</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>최저가순</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                        
                                        
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>가까운 학교순</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>-->
			<!-- Latest Product Section End -->

			<!-- Blog Section Begin -->
			<section class="from-blog spad">
				<div class="container">
					<div class="row">
						<!--<div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>From The Blog</h2>
                    </div>
                </div>-->
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="blog__item">
								<!--<div class="blog__item__pic">
                            <img src="img/blog/blog-1.jpg" alt="">
                        </div>-->
								<!--<div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>-->
							</div>
						</div>
						<!--<div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>-->
						<div class="col-lg-4 col-md-4 col-sm-6">
							<!--<div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-3.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Visit the clean farm in the US</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>-->
						</div>
					</div>
				</div>
			</section>
			<!-- Blog Section End -->

			<!-- Footer Section Begin -->
			<footer class="footer spad">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="footer__about">
								<div class="footer__about__logo">
									<a href="./index.html"><img src="img/중고스쿨초록색로고누끼완.png"
										alt=""></a>
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
								<ul>
									<li><a href="#">이용약관</a></li>
									<li><a href="#">개인정보처리방침</a></li>

									<!-- 하단 삭제
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Our Sitemap</a></li>
                            -->
								</ul>


								<ul>
									<li><a href="#">청소년 보호정책</a></li>
									<li><a href="#">회사 정보</a></li>

									<!--
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                             -->
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
		<!-- Js Plugins -->
		<script src="/controller/resources/js/jquery-3.3.1.min.js"></script>
		<script src="/controller/resources/js/bootstrap.min.js"></script>
		<script src="/controller/resources/js/jquery.nice-select.min.js"></script>
		<script src="/controller/resources/js/jquery-ui.min.js"></script>
		<script src="/controller/resources/js/jquery.slicknav.js"></script>
		<script src="/controller/resources/js/mixitup.min.js"></script>
		<script src="/controller/resources/js/owl.carousel.min.js"></script>
		<script src="/controller/resources/js/main.js"></script>

		<script>
			//폼 제출 시 욕설 체크 후 폼 제품 (자영 2024.04.04 17:30)
			var isError = '<c:if test = "${not empty param.error}">true</c:if>';
			if (isError === 'true') {
				alert("욕설/비속어가 포함되어있습니다! 바른 말을 사용하여 다시 작성해주세요!")
			}
		</script>
</body>

</html>