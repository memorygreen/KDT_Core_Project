<%@page import="java.util.List"%>
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
</head>
<body>
	<div class="container">
		<div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
			    <h2><a href="AdministratorList.do">Administrator</a></h2>
		<div>
				<a href="AdministratorList.do" class="header__top__right__link">
		            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-person" viewBox="0 0 16 16">
		                <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
		                <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z" />
		            </svg>
		            <span class="header__top__right__text">관리자페이지</span>
		        </a>
		        <c:choose>
		            <c:when test="${not empty sessionScope.info}">
		                <div class="header__top__right__auth">
		                    <a href="logout.do" class="header__top__right__auth__link"><i class="fa fa-user"></i>로그아웃</a>
		                </div>
		            </c:when>
		            <c:otherwise>
		                <div class="header__top__right__auth">
		                    <a href="goLogin.do" class="header__top__right__auth__link"><i class="fa fa-user"></i>로그인</a>
		                </div>
		            </c:otherwise>
		        </c:choose>
		      <a href="ProductList.do" class="header__top__right__link">
		            <span class="header__top__right__text">홈페이지</span>
		        </a>
		    </div>
		    </div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<ul id="gnb_1dul">
					<li><a href="UserInformation.do" class="gnb_1da">회원관리</a></li>
					<li><a href="Postmanagement.do" class="gnb_1da">게시글관리</a></li>
				</ul>
			</div>
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr class="info">
							<th>번호</th>
							<th>판매자 아이디</th>
							<th>상품 명</th>
							<th>상품 가격</th>
							<th>상품 사진</th>
							<th>상품 등록일시</th>
							<th>상품 상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="index" value="1" />
						<c:forEach items="${list}" var="product">
						    <tr>
						        <td>${index}</td>
						        <td>${product.seller_id}</td>
						        <td>${product.prod_name}</td>
						        <td>${product.prod_price}</td>
						        <td>${product.prod_img_path}</td>
						        <td>${product.created_at}</td>
						        <td>${product.prod_status}</td>
						        <td><button type="button" onclick="location.href='ModifyingPosts.do?prod_idx=${product.prod_idx}'" class="btn btn-info">수정</button></td>
						    </tr>
						    <c:set var="index" value="${index + 1}" />
						</c:forEach>
					</tbody>
				</table>
			</div>
				
			<div class="panel-footer">Postmanagement.do</div>
		</div>
	</div>
</body>
</html>