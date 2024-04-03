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
            <h4>게시글 정보 수정</h4>
            <div class="panel-heading">
                <ul id="gnb_1dul">
                    <li><a href="UserInformation.do" class="gnb_1da">회원관리</a></li>
                    <li><a href="Postmanagement.do" class="gnb_1da">게시글관리</a></li>
                </ul>
            </div>
            <div class="panel-body">
                    <table class="table table">
                        <thead>
                            <tbody>
                            <h5>상품 등록일시 ${Modifying.created_at}</h5>
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
</body>
</html>