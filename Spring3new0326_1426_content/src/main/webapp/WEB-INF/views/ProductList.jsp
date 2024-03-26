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
		<h2>ProductList.jsp</h2>
		
		<div class="panel panel-default">
			<div class="panel-heading">ProductList</div>
			<div class="panel-body">

				<table class="table table-hover">
					<thead>
						<tr class="warning">
							<th>번호</th>
							<th>상품이미지 미리보기</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>신고수</th>
							<th>거래상태</th>
							
						</tr>
					</thead>
					<tbody>
						
							<c:forEach items="${prod_list}" var="prod" varStatus="i">
								
								<tr>
									<td>${prod.prod_idx}</td>
									<td>
										<c:if test="${not empty prod.prod_img_path}">
		    							<img src="resources/board/${prod.prod_img_path}" width=50 height=100>
		    							<br>
		    							</c:if>
									</td>
									<td><a href="ProductContent.do?prod_idx=${prod.prod_idx}">${prod.prod_name}</a></td>
									<td>${prod.seller_id}</td>
									<td>${prod.created_at}</td>
									<td>${prod.prod_views}</td>
									<td>${prod.prod_rpt_cnt}</td>
									<td>${prod.prod_status}</td>
								</tr>
								
							</c:forEach>
						

					</tbody>
				</table>

				<a href="ProductForm.do">상품등록</a>




			</div>



			<div class="panel-footer" class="btn btn-warning">ProductList.jsp</div>
		</div>
	</div>

</body>
</html>




