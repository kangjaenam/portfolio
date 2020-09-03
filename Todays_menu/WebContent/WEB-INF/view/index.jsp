<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
	
	<%
   String email = CmmUtil.nvl((String)session.getAttribute("SS_EMAIL"));
   String authority = CmmUtil.nvl((String)session.getAttribute("SS_AUTHORITY"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오늘은 뭐먹지?</title>

<!-- CSS들 -->
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/index.css">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css"
	rel="stylesheet" href="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style>
  	.btn-info {
  		background-color : #17A2B8 !important;
  	}
  </style>

</head>
<body>

	<!-- home 아이콘 시작 -->
	<div id="logo">
		<a href="/index.do"><img src="/img/logo.jpg" alt="logo" width="260px"
			height="78px" /></a>
	</div>
	<!-- home 아이콘 끝 -->



	<!-- body밑 padding들어간 div 전체 내용 포함 부분 시작 -->
	<div class="body_div">
	
		<%if(!email.equals("")){ %>
	
		<%if(authority.equals("0")) {%>
		<%@ include file='/WEB-INF/view/state/Login.jsp' %>
		<%}else{ %>
 		 <%@ include file='/WEB-INF/view/state/Login.jsp' %>
		<%} %>
	
		<%}else{ %>
  		 <%@ include file='/WEB-INF/view/state/NotLogin.jsp' %>
		<%} %>
	
		<!-- 레시피 검색창 시작 -->
		<div class="search_display" style="margin-bottom: 60px;">
		<form action="/recipe/recipeSearch.do">
			<span class='green_window'> <input type='text'
				name="recipeSearch" class='input_text' placeholder="레시피 검색.." />
			</span>
			<button type='submit' class='sch_smit'>검색</button>
		</form>
		</div>
		<!-- 레시피 검색창 끝 -->

		<!-- 메뉴 아이콘들 시작 -->
		<div style="text-align: -webkit-center;">
			<a href="/cooktime_details.do"><div class="icon_div">
					<img src="/img/cookTime.png" alt="조리시간별 레시피" width="150px"
						height="150px" />
					<p class="menu_icon_p" style="font-family: 'Hanna', serif;">조리시간별
						레시피</p>
				</div></a> 
				 <a href="/ingredient_details.do"><div class="icon_div">
					<img src="/img/ingredient.png" alt="재료별 레시피" width="150px"
						height="150px" />
					<p class="menu_icon_p" style="font-family: 'Hanna', serif;">재료별
						레시피</p>
				</div></a> 
				<a href="/popular_details.do"><div class="icon_div">
					<img src="/img/popular.png" alt="인기 레시피" width="150px"
						height="150px" />
					<p class="menu_icon_p" style="font-family: 'Hanna', serif;">추천
						레시피</p>
				</div></a> <br> <a href="/personnel_details.do"><div class="icon_div">
					<img src="/img/personnel.png" alt="인원수별 레시피" width="150px"
						height="150px" />
					<p class="menu_icon_p" style="font-family: 'Hanna', serif;">인원수별
						레시피</p>
				</div></a> <a href="/step_details.do"><div class="icon_div">
					<img src="/img/step.png" alt="난이도별 레시피" width="150px" height="150px" />
					<p class="menu_icon_p" style="font-family: 'Hanna', serif;">난이도별
						레시피</p>
				</div></a>

		</div>

		<!-- 메뉴 아이콘들 끝 -->
		
		
		
		
	</div>
	<!-- body밑 padding들어간 div 전체 내용 포함 부분 끝 -->
	

</body>
</html>