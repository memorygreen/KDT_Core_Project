<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
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

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
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
		                            <a id="myPage" href="myPage.do"> 
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
        
        <!--------------------------------------  회색 고정 최상단 부분 끝 ----------------------------------------->
      
      
      
      
        
       <!-- -----------------------------------로고 시작------------------------------------------- --> 
        
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    
                </div>
                <div class="col-lg-6">

                    <div class="header__logo">
                        <a href="ProductList.do"><img src="resources/img/중고스쿨초록색로고누끼완.png" alt="경로를 다시 입력해주세요"></a>
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

<!------------------------------ 검색창 시작------------------------------------------------->

				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<!--검색결과창으로 이동하게 해야할 것 같아요-->
								<div class="hero__search__categories">
									All Categories <span class="arrow_carrot-down"></span>
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
				
				
<!------------------------------------------- 검색창 끝--------------------------------------------------->
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin 
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2></h2>
                        <div class="breadcrumb__option">
                            <a></a>
                            <span></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section-->
	>
	<!-- Breadcrumb Section End -->
<!-- -----------------------------------------회원가입 시작 부분----------------------------------------------->
<!-- 회원가입 style 적용 -->
<style>
button {
	background-color: green;
	border: none;
	color: white;
	padding: 10px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	cursor: pointer;
	height: 35%;
}

#change_row {
	display: grid;
	grid-template-rows: 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr;
}

#idInput {
	max-width: 65%;
}

#checkDuplicate {
	width: 100px;
	padding: 10px 10px;
	margin-left: 20px;
}

#id_result{
	font-size: 15px;
}

#pw_result{
	font-size: 15px;
}

#flex1 {
	display: flex;
}

.col-lg-6 {
	max-width: 70%;
}

#joinButton{
	height:40px;
	width:70px;
}

#submitSpace{
	height:100%;
}

.footer{
	width:1500px;
	
	
}
</style>


<!-- 회원가입 입력부분 -->
	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
			<div id="check_form" class="checkout__form">
				<h4>회원가입</h4>
				<form id="joinForm" action="join.do" method="post">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div id=change_row class="row">
								<div id=idInput class="col-lg-6">
									<div class="checkout__input">

										<p>
											아이디<span>*</span>
										</p>
										<div id="flex1">
											<input input type="text" name="user_id" id="temporaryId"
			class="form-control">
											<button type="button"
												id="checkDuplicate">중복확인</button>
										</div>
										<div id="id_result"></div>
									</div>
								</div>

								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Password<span>*</span>
										</p>
										<input type="password" name="user_pw" id="user_pw" class="form-control">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Password 확인<span>*</span>
										</p>
										<input type="password" id="user_pw2">
										<div id="pw_result"></div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											이름<span>*</span>
										</p>
										<input type="text" name="user_nm" id="temporaryId"
			class="form-control">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Phone<span>*</span>
										</p>
										<input type="text" name="user_phone"
											placeholder="010 - 1111 - 1111" class="form-control">
									</div>
								</div>

								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											생년월일<span>*</span>
										</p>
										<input type="date" name="user_birthdate" id="birthday"
											class="form-control">
									</div>
								</div>

								<div class="checkout__input__checkbox">
									<label for="acc"> 개인정보 수집에 동의하십니까? <input
										type="checkbox" id="acc"> <span class="checkmark"></span>
									</label>
								</div>
								<div>
								<p>- 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 서비스 이용을 위해 필요한 최소한의 개인정보를
									수집합니다.</p>
								<p>- 회원가입 시 필수항목으로 아이디, 비밀번호, 이름, 휴대전화번호, 이메일주소, 학교인증, 학생증
									인증실 정보를 함께 수집합니다.</p>
								<p>- 중고스쿨은(모바일 웹/앱 포함) 회원관리, 서비스 개발·제공 및 향상, 안전한 인터넷 이용환경 구축
									등의 목적으로만 개인정보를 이용합니다.</p>
								<p>- 중고스쿨은 원칙적으로 이용자 동의 없이 개인정보를 외부에 제공하지 않습니다.</p>
								</div>

								<div id="submitSpace" class="submit">
									<button type="submit" id="joinButton">제출</button>
								</div>

</div>
</div>
</div>
</form>
</div>
</div>
</section>

<!--    회원가입 js 이벤트들 -->
<script type="text/javascript">

		window.onload = function() {
			
			
			// 아이디 중복확인 체크
			document.getElementById("checkDuplicate").addEventListener('click',checkAndPop);
			
			// 중복아이디 받아와 및 사용가능여부 띄워주는 함수
			function checkAndPop() {

				let user_id = document.getElementById("temporaryId").value;
				console.log("checkAndPop 실행");
				$
						.ajax({
							url : "findDuplicate.do",
							type : "get",
							data : {
								user_id : user_id
							},
							success : function(info) {

								console.log('info', info.user_id)
								// 중복 아이디가 있을때
								if (info.user_id != undefined) {

									console.log(info);
									document.getElementById("id_result").innerText = "이미 사용 중인 아이디입니다.";
									// let isIdOk = false;
									document.getElementById("joinButton").disabled = true;
								
								// 중복 아이디가 없을 떄
								} else {

									document.getElementById("id_result").innerText = "사용 가능한 아이디 입니다.";
									// isIdOk = true;
									document.getElementById("joinButton").disabled=false;
								}
							},
							error : function() {
								alert("아이디 중복확인에 실패했습니다. 다시 시도해주세요.")
							}
						});
			}
			
			
			// 비밀번호랑 나이 체크, 제출 제한
			
			document.getElementById("joinForm").addEventListener('submit',function(e) {
				
				let user_pw = document.getElementById("user_pw").value;
				let user_pw2 = document.getElementById("user_pw2").value;
				console.log(user_pw, user_pw2)

				let dob = document.getElementById('birthday').value; // 생일 입력값 가져오기
				let birthday = new Date(dob);
				let age = calculateAge(birthday);

				// 비밀번호 체크 및 제한
				if (user_pw != user_pw2) {

					e.preventDefault();

					document.getElementById("pw_result").innerText = "비밀번호가 일치하지 않습니다.";
					
				}else{
					document.getElementById("pw_result").innerText = "";
				}
				

				// 나이 체크 및 제한
				if (age >= 19) {

					e.preventDefault();
					alert('19세 이상은 회원가입이 불가합니다.');
					
				}

							});
			
			

			// 나이체크에서 사용되는 나이계산 함수
			function calculateAge(birthday) {
				let diffMs = Date.now() - birthday.getTime(); // 생일과 현재 사이의 시간 차이(ms)
				var ageDt = new Date(diffMs);
				return Math.abs(ageDt.getUTCFullYear() - 1970); // 나이 계산
			}
			
			// 나이계산함수 잘 작동하는지 테스트
			// var birthday = new Date(2000, 2, 26);
			// var age = calculateAge(birthday);
			// console.log("Calculated Age:", age);
			


		}
	</script>






								<!-- Checkout Section End -->
<!-- --------------------------------회원가입 끝 --------------------------------------------------->

								<!-- Related Product Section End -->
<!----------------------------- 마지막 하단 반복되는 부분 --------------------------------------------->
								
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
        </div>
        
    </footer>
    <!-- Footer Section End -->
<!----------------------------- 마지막 하단 반복되는 부분 끝 --------------------------------------------->
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