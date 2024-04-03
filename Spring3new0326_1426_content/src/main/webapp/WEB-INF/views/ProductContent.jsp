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
                <!-- 로그인상태면 로그아웃이 보이게하고, 로그아웃상태면 로그인이 보이게 하기 -->
                <c:choose>
					<c:when test="${not empty sessionScope.info}">
						<a href="logout.do"> 
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
		                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
		                    </svg> 로그아웃 <!--로그인 중이면 로그아웃으로 변하게 하는 기능 필요-->
	                    </a>
					</c:when>
					<c:otherwise>
						<a href="goLogin.do"> 
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-unlock" viewBox="0 0 16 16">
							   <path d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2M3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1z"/>
							</svg> 로그인 <!--로그인 중이면 로그아웃으로 변하게 하는 기능 필요-->
	                    </a>
					</c:otherwise>
				</c:choose>
                </li>

                <li>
                
                    <!-- 반응형웹 -->
					<!-- 마이페이지 또는 관리자 페이지 -->
					 <c:choose>
					    <c:when test="${not empty sessionScope.info and sessionScope.info.user_role eq 'A'}">
					       
			                <!-- 관리자 페이지로 이동하는 링크 -->
			                <a href="AdministratorList.do">
			                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-person" viewBox="0 0 16 16">
			                        <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
			                        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z"/>
			                    </svg>
			                    관리자페이지
			                </a>
			            </c:when>
		         	    <c:when test="${not empty sessionScope.info and sessionScope.info.user_role eq 'u'}">
			                <!-- 마이페이지로 이동하는 링크 -->
			                <a href="myPage.do"> 
			                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-person" viewBox="0 0 16 16">
			                        <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
			                        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z"/>
			                    </svg>
			                    마이페이지
			                </a>
			            </c:when>
					</c:choose>
                </li>
                               
                <li><a href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brightness-high" viewBox="0 0 16 16">
                        <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6m0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8M8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0m0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13m8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5M3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8m10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0m-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0m9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707M4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708"/>
                    </svg>다크모드
                </a>
                <!--<ul class="header__menu__dropdown">
                    <li><a href="./shop-details.html">Shop Details</a></li>
                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                    <li><a href="./checkout.html">Check Out</a></li>
                    <li><a href="./blog-details.html">Blog Details</a></li>
                </ul>-->
                </li>
                <li class="active">
                    <a href="ProductList.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
                        <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"/>
                        <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8m0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0M4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0m0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0"/>
                      </svg>상품목록</a>
                </li>
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
					<div class="col-lg-6">


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
                        <div class="header__top__right">
                        	<c:if test="${not empty sessionScope.info}">
                        	<div class="header__top__right__social">
                        	
                        		<span fonr-size="20px">${sessionScope.info.user_id}님 환영합니다</span>
                        	</div>
                        	</c:if>
                        	
                        	
                            <div class="header__top__right__social">
                                <!--  
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>-->
                                
                                <!-- 다크모드 -->
                                <a href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brightness-high" viewBox="0 0 16 16">
                                        <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6m0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8M8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0m0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13m8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5M3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8m10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0m-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0m9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707M4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708"/>
                                      </svg>다크모드
                                </a>
                            </div>
                            
                            <!-- 로그인 했을 때에만 마이페이지 보이게 하기  -->
                            
                           <c:choose>
							    <c:when test="${not empty sessionScope.info and sessionScope.info.user_role eq 'A'}">
							       <div class="header__top__right__language">
					                <!-- 관리자 페이지로 이동하는 링크 -->
					                <a href="AdministratorList.do">
					                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-person" viewBox="0 0 16 16">
					                        <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
					                        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z"/>
					                    </svg>
					                    관리자페이지
					                </a>
					                </div>
					            </c:when>
				         	    <c:when test="${not empty sessionScope.info and sessionScope.info.user_role eq 'u'}">
					                <!-- 마이페이지로 이동하는 링크 -->
					                <div class="header__top__right__language">
					                <a href="myPage.do"> 
					                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-person" viewBox="0 0 16 16">
					                        <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
					                        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z"/>
					                    </svg>
					                    마이페이지
					                </a>
					                </div>
					            </c:when>
							</c:choose>
							
                            
                            <!-- 로그인 상태면 로그아웃으로 보이게, 로그아웃상태면 로그인으로 보이게 -->
                            <c:choose>
								<c:when test="${not empty sessionScope.info}">
									<div class="header__top__right__auth">
                                		<a href="logout.do"><i class="fa fa-user"></i>로그아웃</a>
                          		  	</div>
								</c:when>
								<c:otherwise>
									<div class="header__top__right__auth">
                                		<a href="goLogin.do">
                                		<i class="fa fa-user"></i>로그인</a>
                          		  	</div>
								</c:otherwise>
							</c:choose>
                            
                            
                            
                        </div>
                    </div><!-- 최상단 고정 메뉴바 우측 끝 -->
                    
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">

					<!-- 상단 로고 -->
					<div class="header__logo">
						<a href="ProductList.do"><img
							src="resources/img/중고스쿨초록색로고누끼완.png" alt=""></a>
					</div>
					<!-- 검색창 상단 카테고리-
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./index.html">Home</a></li>
                            <li class="active"><a href="./shop-grid.html">Shop</a></li>
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
                    -->
				</div>


				<!-- 우측 상단 이모티콘 삭제(찜하기 장바구니모양)
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
                -->

			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->















	<!-- 검색창 있는 쪽 -->
	<!-- Hero Section Begin -->

	<section class="hero hero-normal">
		<div class="container">
			<div class="row">

				<div class="col-lg-3">
					<!-- 카테고리 없애기(검색창을 가운데에 두기 위해 div 태그 공간 남기고 주석처리만)
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
                    </div>-->
				</div>

				<!-- 검색창 -->
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<!--검색결과창으로 이동하게 해야할 것 같아요-->
								<div class="hero__search__categories">
									All Categories
									 <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="구매하고 싶은 물건을 검색해보세요!">
								<button type="submit" class="site-btn">검색</button>
							</form>
						</div>

						<!-- 우측 상단 전화번호 나오는 곳 
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                        -->
					</div>
				</div>
				<!-- 검색창 끝나는 부분-->
			</div>
		</div>
	</section>
	<!-- Hero Section End -->






	<!-- Breadcrumb Section Begin -->
	<!--
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            
            <div class="row">
                
                <div class="col-lg-12 text-center">
                    
                    
                    <div class="breadcrumb__text">
                        <h2>Vegetable’s Package</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <a href="./index.html">Vegetables</a>
                            <span>Vegetable’s Package</span>
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
        </div>
    </section>
    -->
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">

						<!-- 상품 사진 -->
						<div class="product__details__pic__item">

							<img class="product__details__pic__item--large"
								src="resources/img/saveimg/${prod.prod_img_path}" alt="">
						</div>

						<!--메인 사진 아래 여러 장 사진
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="img/product/details/product-details-2.jpg"
                                src="img/product/details/thumb-1.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-3.jpg"
                                src="img/product/details/thumb-2.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-5.jpg"
                                src="img/product/details/thumb-3.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-4.jpg"
                                src="img/product/details/thumb-4.jpg" alt="">
                        </div>
                         -->
					</div>
				</div>

				<!--상품 정보-->
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${prod.prod_name}</h3>
						<!-- 상품명(상품 제목) -->
						<h5 style="font-weight: bold;
						          display: inline-block;
						          padding: 5px 10px;
						          background-color: ${prod.prod_status == '거래완료' ? '#FF3F34' : '#44bd32'};
						          color: white;
						          border: none;
						          border-radius: 5px;
						          cursor: ${prod.prod_status == '거래완료' ? 'auto' : 'pointer'};">
						  ${prod.prod_status}
						</h5>
						<h6>판매자id : ${prod.seller_id}</h6>
						<!-- 임시 확인용 -->
						<h6>작성자 닉네임 : </h6>
						<!-- 작성자 닉네임(user에서 가져와야함) -->

						<!-- <h5>판매상태 : ${prod.prod_status}</h5> -->
						
						
						
						
						<!-- 로그인한 회원이 판매자와 일치할 경우 '거래완료'버튼 활성화 -->
						<c:choose>
							<c:when test="${prod.seller_id==info.user_id}">
								<form action="productStatusChange.do">
									<input type="hidden" name="prod_idx" value="${prod.prod_idx}">
									<button type="submit" class="btn btn-danger">거래 완료</button>
								</form>
							</c:when>
						</c:choose>

						<!-- 리뷰 별점 평점
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
						-->

						<!--상품 설명-->
						<div class="product__details__price">${prod.prod_price}원</div>
						<!-- 상품 가격 -->
						<p>${fn:replace(prod.prod_desc, ln, "<br/>")}</p>
						<!-- 상품 설명 -->

						<!-- 장바구니 추가하는 기능(우리는 안 써서 주석처리)
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <<input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">ADD TO CARD</a>
                         -->


						<!--하트 이모티콘 삭제
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        -->
						<ul>
							<li><b>상품등록시간</b> <span>${prod.created_at}</span></li>
							<!-- 현재시간과 등록시간 비교해서 몇초전으로 표기 가능 -->
							<li><b>조회수</b> <span>${prod.prod_views}</span></li>
							<li><b>신고수</b> <span>${prod.prod_rpt_cnt}</span></li>

							<!-- 공유 하는 내용 
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                            -->
						</ul>
					</div>
				</div>


				<!--  댓글창 나오는 리스트 -->
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="#"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">댓글보기</a>
							</li>
							<!-- 
							 <li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab" aria-selected="false">Information</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(1)</span></a>
							</li>
							-->
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>댓글</h6>

									<!-- db에서 가져온 댓글 내용 -->
									<!-- 댓글 내용 반복해서 가져오기  -->
									<c:forEach items="${reply_list}" var="reply">
										<!-- 조건 -->
										<!-- 로그인한 회원과 댓글작성자 일치하면 작성자에 (나) 라고 표시하기 -->
										<c:choose>
											<c:when
												test="${reply.reply_writer_id==sessionScope.info.user_id}">
												<!-- 내가 쓴 댓글 -->
												<div style="margin-bottom: 20px; overflow: hidden;">
												    <div style="position: relative; max-width: 70%; margin-bottom: 10px; padding: 10px; border-radius: 10px; background-color: #44bd32; float: right; color: #ffffff;">
												        <div style="font-weight: bold; margin-bottom: 5px; font-size: 13px;">${reply.reply_writer_id} (나)</div>
												        <div style="font-size: 12px; color: #F1FFEF;">${reply.replied_at}</div>
												        <p style="color: #F1FFEF; font-size: 12px;">${reply.reply_content}</p>
												    </div>
												</div>

												
											</c:when>
			
											<c:when test="${prod.seller_id==reply.reply_writer_id}">
												<!-- 판매자가 쓴 댓글 -->
												
													<div style="margin-bottom: 20px; overflow: hidden;">
														<div
															style="position: relative; max-width: 70%; margin-bottom: 10px; padding: 10px; border-radius: 10px; background-color: #f0f0f0;">
															<div style="font-weight: bold; margin-bottom: 5px;">${reply.reply_writer_id} (판매자)</div>
															<!-- 댓글 작성자 -->
															<div style="font-size: 12px; color: #666;">${reply.replied_at}</div>
															<!-- 댓글 작성일시 -->
															<p>${reply.reply_content}</p>
															<!-- 댓글 내용 -->
														</div>
													</div>
											</c:when>
			
											<c:otherwise>
												<!-- 남이 쓴 댓글  -->
													<div style="margin-bottom: 20px; overflow: hidden;">
														<div
															style="position: relative; max-width: 70%; margin-bottom: 10px; padding: 10px; border-radius: 10px; background-color: #f0f0f0;">
															<div style="font-weight: bold; margin-bottom: 5px;">${reply.reply_writer_id}</div>
															<!-- 댓글 작성자 -->
															<div style="font-size: 12px; color: #666;">${reply.replied_at}</div>
															<!-- 댓글 작성일시 -->
															<p>${reply.reply_content}</p>
															<!-- 댓글 내용 -->
														</div>
													</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
							<!-- 말풍선 넣는 공간 끝-->


							<!-- db에서 가져온 댓글 내용 끝 -->


							<!-- 댓글기능(240313) -->

							<form action="replyInsert.do" method="post">
								<input type="hidden" name="prod_idx" value="${prod.prod_idx}">


								<table style="width: 100%">

									<tr id="view">
										<td style="padding: 5px" width="10%">작성자</td>
										<td style="padding: 5px" width="89%">댓글내용</td>
										<td style="padding: 5px" width="1%"></td>
									</tr>
									<!--  댓글 작성하는 곳 -->
									<tr>
										<td style="padding: 5px"  width="10%">
											<!-- 댓글작성자 id(로그인한 회원id) --> <input type="text"
											name="user_id" class="form-control"
											value="${sessionScope.info.user_id}" readonly>

										</td>

										<td style="padding: 5px" width="89%">
											<!-- 댓글 내용 --> <!-- 댓글내용 작성 부분 --> <!-- 로그인 한 회원만 댓글 작성 가능하도록  -->
											<c:choose>
												<c:when test="${not empty sessionScope.info.user_id}">
													<input type="text" name="reply_content"
														class="form-control">
												</c:when>
												<c:otherwise>
													<input type="text" name="reply_content"
														class="form-control" value="로그인 한 회원만 댓글작성이 가능합니다"
														readonly>
												</c:otherwise>
											</c:choose>

										</td>


										<td style="padding: 5px" width="1%">
											<button type="submit" class="btn" style="background-color: #44bd32; color: white; font-weight: bold;">댓글작성</button>
											
										</td>
										<td style="padding: 5px"></td>
									</tr>
									<tr><td colspan="3"></td></tr>
									<tr >
										<td colspan="3" align="center">
										<a href="ProductUpdateForm.do?idx=${prod.prod_idx}" class="btn btn-info">수정화면</a> 
										<a href="ProductDelete.do?idx=${prod.prod_idx}" class="btn btn-danger">삭제</a> 
										<a href="ProductList.do" class="btn btn-warning">상품 목록</a>
										</td>
									</tr>
								</table>
							</form>


						</div>
						<!-- 댓글보기 끝 -->
						
						
						
						
					</div>
					
					
					
					
					<!--  
					
					<div class="tab-pane" id="tabs-2" role="tabpanel">
						<div class="product__details__tab__desc">
							<h6>Products Infomation</h6>



							<p>Vestibulum ac diam sit amet quam vehicula elementum sed
								sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin
								eget tortor risus. Vivamus suscipit tortor eget felis porttitor
								volutpat. Vestibulum ac diam sit amet quam vehicula elementum
								sed sit amet dui. Donec rutrum congue leo eget malesuada.
								Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur
								arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
								sapien massa, convallis a pellentesque nec, egestas non nisi.
								Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
								dui. Vestibulum ante ipsum primis in faucibus orci luctus et
								ultrices posuere cubilia Curae; Donec velit neque, auctor sit
								amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor
								risus.</p>
							<p>Praesent sapien massa, convallis a pellentesque nec,
								egestas non nisi. Lorem ipsum dolor sit amet, consectetur
								adipiscing elit. Mauris blandit aliquet elit, eget tincidunt
								nibh pulvinar a. Cras ultricies ligula sed magna dictum porta.
								Cras ultricies ligula sed magna dictum porta. Sed porttitor
								lectus nibh. Mauris blandit aliquet elit, eget tincidunt nibh
								pulvinar a.</p>
						</div>
					</div>
					
					
					<div class="tab-pane" id="tabs-3" role="tabpanel">
						<div class="product__details__tab__desc">
							<h6>Products Infomation</h6>
							<p>Vestibulum ac diam sit amet quam vehicula elementum sed
								sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin
								eget tortor risus. Vivamus suscipit tortor eget felis porttitor
								volutpat. Vestibulum ac diam sit amet quam vehicula elementum
								sed sit amet dui. Donec rutrum congue leo eget malesuada.
								Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur
								arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
								sapien massa, convallis a pellentesque nec, egestas non nisi.
								Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
								dui. Vestibulum ante ipsum primis in faucibus orci luctus et
								ultrices posuere cubilia Curae; Donec velit neque, auctor sit
								amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor
								risus.</p>
						</div>
					</div>
					 -->
					
				</div>
			</div>
		</div>
		</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- 연관 상품 추천 -->
	<!-- Related Product Section Begin -->
	<!--
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-7.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    -->




















	<!-- Related Product Section End -->
	<!-- 마지막 하단 반복되는 부분 -->
	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<!-- 하단 로고 -->
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
                           
                        </ul>
                        
                        
                        <ul>
                            <li><a href="#">청소년 보호정책</a></li>
                            <li><a href="#">회사 정보</a></li> -->

						<!--
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                             -->
						<!--
                        </ul>-->

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
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
					<div class="footer__copyright__payment">
						<!--카드 그림
                                <img src="img/payment-item.png" alt="">-->

					</div>
				</div>
			</div>
		</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
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




