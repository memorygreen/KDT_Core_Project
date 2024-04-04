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
						<a href="UserInformation.do" class="gnb_1da">회원관리</a>
						<a href="Postmanagement.do" class="gnb_1da">게시글 관리</a>
					</ul>
				</div>
			</div>			
			<div class="panel-body">
					<div class="Member_vbx">
					<section>
					<dl>
						<h3>전체상품통계</h3>
						<dt>전체상품현환</dt>
                        	<dd>
                                <p>총상품수</p>
								<c:set var="sellerIdCount" value="0" />
									<c:forEach items="${list}" var="info">
									    <c:if test="${not empty info.prod_idx}">
									        <c:set var="sellerIdCount" value="${sellerIdCount + 1}" />
									    </c:if>   
								</c:forEach>
								<p>${sellerIdCount}</p>
                        	</dd>
                     </dl>
                     <dl>
						    <dt>상품상태현환</dt>
					    <c:if test="${not empty list}">
					        <c:set var="completeCount" value="0" />
					        <c:set var="inProgressCount" value="0" />
					        <c:forEach items="${list}" var="info">
					            <c:if test="${info.prod_status eq '거래완료'}">
					                <c:set var="completeCount" value="${completeCount + 1}" />
					            </c:if>
					            <c:if test="${info.prod_status eq '판매중'}">
					                <c:set var="inProgressCount" value="${inProgressCount + 1}" />
					            </c:if>
					        </c:forEach>
					    </c:if>
					    <dd>
					        <p>거래완료</p>
					        <p>${completeCount}</p>
					    </dd>
					    <dd>
					        <p>판매중</p>
					        <p>${inProgressCount}</p>
					    </dd>
                     </dl>
                     
                      <dl>
                      		<h3>전체 회원수 확인</h3>
						    <dt>회원현환</dt>
					    <c:if test="${not empty vo}">
					        <c:set var="MemberNumber" value="0" />
					        <c:set var="inP" value="0" />
					        <c:forEach items="${vo}" var="inf">
					            <c:if test="${not empty inf.user_id}">
					                <c:set var="MemberNumber" value="${MemberNumber + 1}" />
					            </c:if>
					            <c:if test="${inf.joined_at eq inf.joined_at}">
					                <c:set var="inP" value="${inP + 1}" />
					            </c:if>
					        </c:forEach>
					    </c:if>
					    <dd>
					        <p>회원수</p>
					        <p>${MemberNumber}</p>
					    </dd>
					    <dd>
					        <p>오늘가입자</p>
					        <p>${inP}</p>
					    </dd>
                     </dl>		
					</section>		
					
					<section>
						<h3>최근 상품내역</h3>
						<table>
							<thead>
								<tr>
									<td>판매자아이디</td>
									<td>상품명</td>
									<td>상품가격</td>
									<td>상품 등록일시</td>
									<td>상품 상태</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="info" varStatus="loop">
								<c:if test="${loop.index < 5}">
								    <tr>
								        <td>${info.seller_id}</td>
								        <td>${info.prod_name}</td>
								        <td>${info.prod_price}</td>
								        <td>${info.created_at}</td>
								        <td>${info.prod_status}</td>
								    </tr>
								    </c:if>
								</c:forEach>
							</tbody>							
						</table>
					</section>
					<section>
						<h3>최근 가입자</h3>
						<table>
							<thead>
								<tr>
									<td>이름</td>
									<td>아이디</td>
									<td>전화번호</td>
									<td>활동상대</td>
									<td>가입날자</td>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${vo}" var="inf">
								   <tr>
								        <td>${inf.user_nm}</td>
								        <td>${inf.user_id}</td>
								        <td>${inf.user_phone}</td>
								        <td>${inf.user_status}</td>
								        <td>${inf.joined_at}</td>
								    </tr>
							</c:forEach>
							</tbody>
						</table>
					</section>
					</div>
				<div class="panel-footer" class="btn btn-warning">AdministratorList.do</div>
			</div>
		</div>
</body>
</html>