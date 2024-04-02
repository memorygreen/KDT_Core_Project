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
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/controller/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/controller/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/controller/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/controller/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/controller/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/controller/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/controller/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/controller/resources/css/style.css" type="text/css">
	
	
	
	
	
	
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
            <a href="ProductList.do"><img src="resources/img/중고스쿨초록색로고누끼완.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <p>${info.user_id}님 환영합니다</p>
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
                
                    <c:if test="${not empty sessionScope.info}">
	                	<a href="myPage.do">  <!-- 마이페이지로 이동하게 변경 필요 -->
	                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-person" viewBox="0 0 16 16">
	                        <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
	                        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z"/>
	                    </svg>
	                    마이페이지
	                    </a>
					</c:if>
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
    <!-- Humberger End --> <!--반응형 메뉴바 끝-->

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
                                <a href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brightness-high" viewBox="0 0 16 16">
                                        <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6m0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8M8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0m0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13m8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5M3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8m10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0m-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0m9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707M4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708"/>
                                      </svg>다크모드
                                </a>
                            </div>
                            
                            <!-- 로그인 했을 때에만 마이페이지 보이게 하기  -->
                            <c:if test="${not empty sessionScope.info}">
	                            <div class="header__top__right__language">
	                            	<!-- 마이페이지 -->
	                            	<!-- 로그인 전이면 안 보이게 하는 조건문 추가 필요 -->
		                            <a href="myPage.do"> 
		                            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
		 										<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
		  										<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z"/>
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
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    
                </div>
                <div class="col-lg-6">

                    <div class="header__logo">
                        <a href="ProductList.do"><img src="resources/img/중고스쿨초록색로고누끼완.png" alt="경로를 다시 입력해주세요"></a>
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
	
	
	
	<!-- 방금올라온 상품 목록(움직이는 부분) 시작 -->
    <!-- Hero Section Begin -->
    <section class="hero">
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
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="구매하고 싶은 물건을 검색해보세요!">
                                <button type="submit" class="site-btn">SEARCH</button>
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
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>방금올라온 상품</h2> <!-- 자영: 시간순으로 할 수 있도록 구현해야함 (0327) -->
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    
                    <!-- 여기 -->
                    
                    <c:forEach items="${prod_list}" var="prod" varStatus="i" begin="0" end="4">
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="resources/img/saveimg/${prod.prod_img_path}">
  								<h5><a href="ProductContent.do?prod_idx=${prod.prod_idx}">${prod.prod_name}</a></h5>
	                        </div>
	                    </div>
                    </c:forEach>
                    <!-- 2-5번째 
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/가방105.jpg">
                            <h5><a href="#">db에서 상품제목 가져와야해요2</a></h5>
                        </div>
                    </div>
                    
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/가방132.jpg">
                            <h5><a href="#">db에서 상품제목 가져와야해요3</a></h5>
                        </div>
                    </div>
                    
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/가방137.jpg">
                            <h5><a href="#">db에서 상품제목 가져와야해요4</a></h5>
                        </div>
                    </div>
                    
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/가방164.jpg">
                            <h5><a href="#">db에서 상품제목 가져와야해요5</a></h5>
                        </div>
                    </div>
                    -->
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End --> <!-- 방금올라온 상품 목록(움직이는 부분) 끝 -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>상품 목록</h2>
                        
                        </br>
                        </br>
                        </br>
                        
                        <!--자영: 로그인한 회원에게만 상품등록 버튼이 보이게 하기 -->
                        <c:if test="${not empty sessionScope.info  and sessionScope.info.user_status eq '활동중'}">
	                        <form action = "ProductForm.do">
	                    		<button type="submit" class="btn" style="background-color: #44bd32; color: white; font-weight: bold;">상품등록 버튼(임시)</button>
	                        </form>
						</c:if>
						
						
						</br>
                        
                    </div>
                    <div class="featured__controls">
                        <!--상품목록(카테고리?) 삭제
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".oranges">Oranges</li>
                            <li data-filter=".fresh-meat">Fresh Meat</li>
                            <li data-filter=".vegetables">Vegetables</li>
                            <li data-filter=".fastfood">Fastfood</li>
                        </ul>-->
                    </div>
                </div>
            </div>

            <!--상품목록 시작-->


			<div class="row featured__filter">
			
				<!--  반복문 가져오기 
				<c:forEach items="${prod_list}" var="prod" varStatus="i">

				<tr>
					<td>${prod.prod_idx}</td>
					<td><c:if test="${not empty prod.prod_img_path}">
							<img src="resources/board/${prod.prod_img_path}" width=50
								height=100>
							<br>
						</c:if></td>
					<td></td>
				</tr>

				</c:forEach>-->
				
				
				<!--  상품 1개씩 반복 -->
				<c:forEach items="${prod_list}" var="prod" varStatus="i">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                    	
                    	<!-- 이미지 및 아이콘 나오는 부분 div -->
                    	<!-- <img src="resources/board/${prod.prod_img_path}" width=50 height=100> --><!-- 원래경로 -->
                        <!-- <div class="featured__item__pic set-bg" data-setbg="resources/img/featured/feature-1.jpg"> -->
                        <div class="featured__item__pic set-bg" data-setbg="resources/img/saveimg/${prod.prod_img_path}">
                        	<c:if test="${not empty prod.prod_img_path}">
							
							</c:if></td>
						
						
							<!-- 찜하기, 리트윗, 쇼핑카드  -->
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        
                        <!--  상품 목록 -->
                        <!-- 상품 사진 아래 정보 나오는 부분 div -->
                        <div class="featured__item__text">
	                        <h6 style="font-weight: bold; display: inline-block; padding: 5px 10px; 
								    background-color: ${prod.prod_status == '거래완료' ? '#FF3F34' : '#44bd32'}; 
								    color: white; border: none; border-radius: 5px; cursor: pointer; pointer-events: none;">
								    ${prod.prod_status}
								</h6> <!-- 상품 판매 상태(거래완료일 때에는 빨간색으로 표시 (삼항연산자 사용) -->
                            <h6><a href="ProductContent.do?prod_idx=${prod.prod_idx}">${prod.prod_name}</a></h6>
                            <h5>${prod.prod_price}원</h5>
                            <span style="font-size: 15px;">학교명</span> <!-- session에 있는 값 가져와야하나? -->
                            </br>
                            <span style="font-size: 13px;">${fn:split(prod.created_at, " ")[0]}</span> <!-- 상품 게시 일자 -->
                            </br>
                            <span style="font-size: 13px;">조회수 ${prod.prod_views}</span>
                            </br>
                        </div>
                    </div>
                </div>
                </c:forEach>  <!--  상품 1개 끝 -->
                
               
                
                <!-- 상품2~8번 주석처리
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
                        <div class="featured__item__pic set-bg" data-setbg="controller/resources/img/featured/feature-3.jpg">
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
            </div>
             상품2~8번 주석처리 -->
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
	
	
	
	<!-- 자영"순위별 보기 3개 시작-->
    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            
            <!-- 자영:조회순 보기-->
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>조회수순</h4>
                        <div class="latest-product__slider owl-carousel">
                        	<!-- 1~3번째 (0번 ~2번 인덱스)반복 -->
                            <div class="latest-prdouct__slider__item">
                                <c:forEach items="${prod_views_list}" var="prod_views" begin="0" end="2" varStatus="i">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><a href="ProductContent.do?prod_idx=${prod_views.prod_idx}">${prod_views.prod_name}</a></h6> 
                                        <span>${prod_views.prod_price}</span> 
                                    </div>
                                </a>
                                </c:forEach>
                                
                            </div>
                            <!-- 4~6번째 (3번 ~5번 인덱스)반복 -->
                            <div class="latest-prdouct__slider__item">
                            	<c:forEach items="${prod_views_list}" var="prod_views" begin="3" end="5" varStatus="i">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><a href="ProductContent.do?prod_idx=${prod_views.prod_idx}">${prod_views.prod_name}</a></h6> 
                                        <span>${prod_views.prod_price}</span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div> <!-- 조회수순 보기 끝-->
                
                
                <!-- 자영: 최저가순 보기-->
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>최저가순</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <c:forEach items="${prod_lowest_price_list}" var="prod_lowest" begin="0" end="2" varStatus="i">
                                <!-- 1~3번째 (0번 ~2번 인덱스)반복 -->
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><a href="ProductContent.do?prod_idx=${prod_lowest.prod_idx}">${prod_lowest.prod_name}</a></h6> <!-- 첫번째 상품 제목 -->
                                        <span>${prod_lowest.prod_price}</span> <!-- 첫번째 상품 가격 -->
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                            
                            <div class="latest-prdouct__slider__item">
                               	<c:forEach items="${prod_lowest_price_list}" var="prod_lowest" begin="3" end="5" varStatus="i">
                                <!-- 4~6번째 (3번 ~5번 인덱스)반복 -->
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><a href="ProductContent.do?prod_idx=${prod_lowest.prod_idx}">${prod_lowest.prod_name}</a></h6> <!-- 첫번째 상품 제목 -->
                                        <span>${prod_lowest.prod_price}</span> <!-- 첫번째 상품 가격 -->
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>   <!-- 최저가순 보기 끝 -->
                
                <!--  댓글많은 순 보기-->
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>댓글 많은 순 </h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                
                                <c:forEach items="${prod_reply_list}" var="prod_reply" begin="0" end="2" varStatus="i">
                                <!-- 4~6번째 (3번 ~5번 인덱스)반복 -->
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><a href="ProductContent.do?prod_idx=${prod_reply.prod_idx}">${prod_reply.prod_name}</a></h6> <!-- 첫번째 상품 제목 -->
                                        <span>${prod_reply.prod_price}</span> <!-- 첫번째 상품 가격 -->
                                    </div>
                                </a>
                                </c:forEach>
                                
                                
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <c:forEach items="${prod_reply_list}" var="prod_reply" begin="3" end="5" varStatus="i">
                                <!-- 4~6번째 (3번 ~5번 인덱스)반복 -->
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><a href="ProductContent.do?prod_idx=${prod_reply.prod_idx}">${prod_reply.prod_name}</a></h6> <!-- 첫번째 상품 제목 -->
                                        <span>${prod_reply.prod_price}</span> <!-- 첫번째 상품 가격 -->
                                    </div>
                                </a>
                                </c:forEach>
                                
                            </div>
                        </div>
                    </div>
                </div> <!-- 가까운 학교순 보기 끝 --> 
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->
    <!-- 순위별 보기 3개 끝 -->
    

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
                            <a href="ProductList.do"><img src="resources/img/중고스쿨초록색로고누끼완.png" alt=""></a>
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
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
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




