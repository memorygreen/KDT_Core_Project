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
		<h2><a href="AdministratorList.do">Administator</a></h2>
		
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