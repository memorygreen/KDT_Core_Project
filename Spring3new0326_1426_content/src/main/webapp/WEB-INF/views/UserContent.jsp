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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>  
    <div class="container">
        <h2>회원정보수정</h2>
        <section>
        <div class="panel panel-default">
            <ul id="gnb_1dul">
                <li><a href="UserContent.do?user_id=${vo.user_id}" class="gnb_2da">회원정보수정</a></li>
                <li><a href="PostContent.do?user_id=${vo.user_id}" class="gnb_2da">게시글 내용</a></li>
			    <!-- 자영 임시 추가 -->
			  <!-- <li><a href="ProductContent.do?prod_idx=${prod.prod_idx}">${prod.prod_name}</a></li>-->
			    
            </ul>
        </div>
            <h5>기본정보</h5>
            <div class="panel panel-default">
                <form action="userInfoChange.do" method="POST">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="row">이름</th>
                                <td>${vo.user_nm}</td>
                                <th>아이디</th>
                                <td>${vo.user_id}</td>
                            </tr>
                            <tr>
                                <th>E-Mail</th>
                                <td><!-- <input type="text" name="email" value=""> --></td>
                                <th>전화번호</th>
                                <td><input type="text" name="user_phone" value="${vo.user_phone}" class="form-control"></td>
                            </tr>
                            <tr>
                                <th>활동 상태</th>
                                <td><select name="user_status">
				                        <option value="활동중" ${vo.user_status eq '활동중' ? 'selected' : ''}>활동중</option>
										<option value="활동중지" ${vo.user_status eq '활동중지' ? 'selected' : ''}>활동중지</option>
										<option value="승인대기" ${vo.user_status eq '승인대기' ? 'selected' : ''}>승인대기</option>
										<option value="탈퇴" ${vo.user_status eq '탈퇴' ? 'selected' : ''}>탈퇴</option>
									</select>
                                <th style="width:120px">가입일</th>
                                <td>${vo.joined_at}</td>
                            </tr>
                        </thead>
                    </table>
                    <!-- 회원상태 수정 기능 관련 -->
                    <input type="hidden" name="user_id" value="${vo.user_id}">
                    <button type="submit" class="btn btn-info">수정</button>
                    <a href="UserContent.do?user_id=${vo.user_id}" class="btn btn-danger">취소</a>
                </form>
                <div class="panel-footer" class="btn btn-warning">UserContent.do</div>
            </div>
        </section>
    </div>
</body>
</html>