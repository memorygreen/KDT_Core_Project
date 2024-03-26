<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- 네비게이션 메뉴바 추가  -->
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/controller">스프링게시판</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">Page 2</a></li>
        <li><a href="#">Page 3</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${empty info}"> <!-- 자:세션이 null일때(로그인x 일때) -->
        <li><a href="joinForm.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="loginForm.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </c:if>
        
        <c:if test="${not empty info}"> <!-- 자:세션이 null아닐 때 (로그인o 일때)-->
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${info.nick}님 Welcome!</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Update</a></li><!-- 회원정보수정 -->
        <li><a href="logout.do"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </c:if>
        
      </ul>
    </div>
  </div>
</nav>
	
	<!-- 네이게이녀 메뉴바 종료 -->