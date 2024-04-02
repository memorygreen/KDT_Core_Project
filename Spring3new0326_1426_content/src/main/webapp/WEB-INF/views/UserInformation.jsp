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
							<th>아이디</th>
							<th>전화번호</th>
							<th>학교명</th>
							<th>활동 상태</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="index" value="1" />
						<c:forEach items="${list}" var="vo">
							<tr>
								<td>${index}</td>
								<td><a href="UserContent.do?user_id=${vo.user_id}">${vo.user_id}</a></td>
								<td>${vo.user_phone}</td>
								<td>${vo.user_sc_nm}</td>
								<td>${vo.user_status}</td>
								<td>${vo.joined_at}</td>
							</tr>
							<c:set var="index" value="${index + 1}" />
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="panel-footer">UserInformation.do</div>
		</div>
	</div>

</body>
</html>