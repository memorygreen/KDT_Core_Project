<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
 
<% pageContext.setAttribute("ln", "\n"); %>
<div class="container">
  <h2>Spring version 1.</h2>
  <div class="panel panel-default">
    <div class="panel-heading">ProductContent</div>
    <div class="panel-body">
    	<table class="table">
    		<tbody>
    			<tr>
	    			<td>제목</td>
	    			<td>${prod.prod_name}</td>
	    				
    			</tr>
    			<tr>
	    			<td>작성자</td>
	    				<td>${prod.seller_id} </td>
    			</tr>
    			<tr>
	    			<td>상품 사진</td>
	    			<td> 
	    				<c:if test="${not empty prod.prod_img_path}">
	    				<img src="resources/board/${prod.prod_img_path}">
	    				<br>
	    				</c:if>
	    				
	    			</td>
    			</tr>
    			
    			<tr>
	    			<td>상품 설명</td>
	    				<td><textarea cols="30" rows="5" readonly>${fn:replace(prod.prod_desc, ln, "<br/>")}</textarea> </td>.
	    				
    			</tr>
    			
    			<tr>
	    			<td>작성일</td>
	    			<td>
					    <!--  ${fn:split(prod.created_at, " ")[0]} --> <!-- 날짜만 보이게 하기 -->				
					    ${prod.created_at}				
					</td>
    			</tr>
    			
    			
    			<tr>
    				<td>판매상태</td>	
    				<td>${prod.prod_status}</td>
    			</tr>
    			
    			<tr>
    				<td colspan="2" align="center">
    					<a href="ProductUpdateForm.do?idx=${prod.prod_idx}" class="btn btn-info">수정화면</a>
    					<a href="ProductDelete.do?idx=${prod.prod_idx}" class="btn btn-danger">삭제</a>
    					<a href="ProductList.do" class="btn btn-warning">상품 목록</a>
    				</td>
    			</tr>
    			
    			
    			
    			
    		</tbody>
    	
    	</table>
    	
    	</form>
    	
    </div>
    
    <div class="panel-footer">상품 상세보기 화면 </div>
  </div>
</div>

</body>
</html>




