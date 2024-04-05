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

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<footer class="footer spad">
		<!-- Humberger Begin -->
		<div class="humberger__menu__overlay container">
			<div class="humberger__menu__wrapper"
				style="display: flex; justify-content: flex-end; align-items: center;">
				<div class="humberger__menu__logo" style="margin-right: auto;">
					<a href="AdministratorList.do"> <img
						src="resources/img/중고스쿨초록색로고누끼완.png"
						style="width: 100px; height: auto;"></a>
				</div>

				<!-- 반응형 웹 창 축소 시 활성화되는 메뉴-->
				<nav class="humberger__menu__nav mobile-menu">
					<ul
						style="display: flex; justify-content: flex-start; align-items: center; margin-left: auto; margin-top: 10px; margin-bottom: 10px;">
						<li style="margin-right: 20px;">
							<!-- 로그인상태면 로그아웃이 보이게하고, 로그아웃상태면 로그인이 보이게 하기 --> <c:choose>
								<c:when test="${not empty sessionScope.info}">
									<a href="logout.do"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                                <path
												d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
                            </svg> 로그아웃 <!--로그인 중이면 로그아웃으로 변하게 하는 기능 필요-->
									</a>
								</c:when>
								<c:otherwise>
									<a href="goLogin.do"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-unlock" viewBox="0 0 16 16">
                                <path
												d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2M3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1z" />
                            </svg> 로그인 <!--로그인 중이면 로그아웃으로 변하게 하는 기능 필요-->
									</a>
								</c:otherwise>
							</c:choose>
						</li>

						<li style="margin-right: 20px;"><c:if
								test="${not empty sessionScope.info}">
								<a href="AdministratorList.do"> <!-- 마이페이지로 이동하게 변경 필요 --> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-file-earmark-person"
										viewBox="0 0 16 16">
                            <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                            <path
											d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z" />
                        </svg> 관리자페이지
								</a>
							</c:if></li>

						<li class="active"><a href="ProductList.do"><svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
                         <path
										d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z" />
                         <path
										d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8m0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0M4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0m0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0" />
                       </svg>홈페이지</a></li>
					</ul>
				</nav>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<ul id="gnb_1dul">
						<a href="UserInformation.do" class="gnb_1da"
							style="margin-right: 10px;">회원관리</a>
						<a href="Postmanagement.do" class="gnb_1da">게시글 관리</a>
					</ul>
				</div>
			</div>
        <div>
            <h4>게시글 정보 수정</h4>
            <div class="panel panel-default">
                    <table class="table table">
                        <thead>
                            <tbody>
                            <tr>
                                <th>상품 명</th>
                                <td><input type="text" name="prod_name" value="${Modifying.prod_name}" class="form-control"></td>
                                <th>상품 가격</th>
                                <td><input type="text" name="prod_price" value="${Modifying.prod_price}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>상품 설명</th>
                                <td colspan="3"><textarea class="form-control" id="prod_desc" name="prod_desc" rows="7" cols="50">${Modifying.prod_desc}</textarea></td>
                            </tr>
                            <tr>
                                <th>상품 상태</th>
                                <td colspan="3">${Modifying.prod_status}</td>
	                            <td>상품 등록일시 ${Modifying.created_at}</td>
                            </tr>
                            
                            </tbody>
                        </thead>
                    </table>
	                   	<form action="Delete.do" method="POST" style="display: inline;">
		                    <input type="hidden" name="prod_idx" value="${Modifying.prod_idx}">
						    <button type="submit" class="btn btn-danger">삭제</button>
						</form>
	                    	<a href="ModifyingPosts.do?prod_idx=${Modifying.prod_idx}" class="btn btn-warning">취소</a>
				
			</div>
			<div class="panel-footer" class="btn btn-warning">ModifyingPosts.do</div>
		</div>
	</div>
		<!-- Js Plugins -->
			<script src="js/jquery-3.3.1.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/jquery.nice-select.min.js"></script>
			<script src="js/jquery-ui.min.js"></script>
			<script src="js/jquery.slicknav.js"></script>
			<script src="js/mixitup.min.js"></script>
			<script src="js/owl.carousel.min.js"></script>
			<script src="js/main.js"></script>
</body>
</html>