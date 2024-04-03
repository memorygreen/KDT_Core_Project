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

	<header>
		<div class="container">
			<h2><a href="AdministratorList.do">Administator</a></h2>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<ul id="gnb_1dul">
						<a href="UserInformation.do" class="gnb_1da">회원관리</a>
						<a href="Postmanagement.do" class="gnb_1da">게시글 관리</a>
					</ul>
				</div>
			</div>
			</div>
	</header>		
		<div>	
			<div>
				<div class="panel-body">
					<h1>감자</h1>
				</div>
				<div class="panel-footer" class="btn btn-warning">AdministratorList.do</div>
			</div>
		</div>
</body>
</html>