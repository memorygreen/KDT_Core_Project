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
		<h2>게시글내용</h2>
		<section>
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>순번</th>
							<th>판매자 아이디</th>
							<th>상품명</th>
							<th>가격</th>
							<th>상품 이미지</th>
							<th>생성일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty PostContent}">
							<c:set var="index" value="1" />
							<c:forEach items="${PostContent}" var="info">
								<tr>
									<td>${index}</td>
									<td>${info.seller_id}</td>
									<td>${info.prod_name}</td>
									<td>${info.prod_price}</td>
									<td>${info.prod_img_path}</td>
									<td>${info.created_at}</td>
									<td>${info.prod_status}</td>
								</tr>
								<c:set var="index" value="${index + 1}" />
							</c:forEach>
						</c:if>
						<c:if test="${empty PostContent}">
							<tr>
								<td colspan="7">게시글이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>

				</table>
			</div>
			<div class="panel-footer" class="btn btn-warning">PostContent.do</div>
	</section>
	</div>
</body>
</html>