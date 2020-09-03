<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<%
  String my_ig = (String)request.getAttribute("my_ig");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘은 뭐먹지?</title>
</head>
<body>

    <!-- home 아이콘 시작 -->
	<div id="logo">
		<a href="/index.do"><img src="/img/logo.jpg" alt="logo" width="260px" height="78px" /></a>
	</div>
	<!-- home 아이콘 끝 -->
	
	<!-- body밑 padding들어간 div 전체 내용 포함 부분 시작 -->
	<div class="body_div">
	
	<!-- 마이페이지 로그아웃 버튼 시작 -->

	<button type="button" onclick="parent.location.href='/logout.do'"
		class="btn btn-warning"
		style="float: right; font-family: 'Hanna', serif;">로그아웃</button>
	<button type="button" onclick="parent.location.href='/my_page.do'"
		class="btn btn-primary"
		style="margin-right: 8px; float: right; font-family: 'Hanna', serif;">마이페이지</button>

	<!-- 마이페이지 로그아웃 버튼 끝 -->
	<div><%=my_ig %></div>
	<form action="/my_ig_save.do">
	<input name="my_ig" type="text" size="30" maxlength="30" value="<%=my_ig %>"  />
	</form>
	<div></div>
	
</body>
</html>