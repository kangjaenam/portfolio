<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header -->

	<header class="header trans_400">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="header_content d-flex flex-row align-items-center justify-content-start trans_400">
						<div class="logo"><a href="/user/main.do">서울<span> 나들이</span></a></div>
						<nav class="main_nav ml-auto mr-auto">
							<ul class="d-flex flex-row align-items-center justify-content-start">
								<li class="active"><a href="/user/main.do">홈으로</a></li>
								<li><a href="/user/near.do">내 주변 관광지</a></li>
								<li><a href="/user/area.do">지역별 관광지</a></li>
								<li><a href="/user/type.do">유형별 관광지</a></li>
								
							</ul>
						</nav>
						<div class="log_reg">
							<div class="log_reg_content d-flex flex-row align-items-center justify-content-start">
								<div class="login log_reg_text"><a href="/user/loginForm.do">로그인</a></div>
								<div class="register log_reg_text"><a href="/user/signup.do">회원가입</a></div>
							</div>
						</div>
						<div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Menu -->
	
	<div class="menu_overlay trans_400"></div>
	<div class="menu trans_400">
		<div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
		<div class="log_reg">
			<div class="log_reg_content d-flex flex-row align-items-center justify-content-end">
				<div class="login log_reg_text"><a href="/user/loginForm.do">로그인</a></div>
				<div class="register log_reg_text"><a href="/user/signup.do">회원가입</a></div>
			</div>
		</div>
		<nav class="menu_nav">
			<ul>
				<li><a href="/user/main.do">홈으로</a></li>
				<li><a href="/user/near.do">내 주변 관광지</a></li>
				<li><a href="/user/area.do">지역별 관광지</a></li>
				<li><a href="/user/type.do">유형별 관광지</a></li>
				
			</ul>
		</nav>
	</div>
</body>
</html>