<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>유형별 관광지</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="HostSpace template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/styles/type.css">
<link rel="stylesheet" type="text/css" href="/styles/contact_responsive.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<%
	String email = CmmUtil.nvl((String)session.getAttribute("SS_EMAIL"));
	String authority = CmmUtil.nvl((String)session.getAttribute("SS_AUTHORITY"));
%>
</head>
<body>

<div class="super_container">
	
	<%if(!email.equals("")){ %>
	
	<%if(authority.equals("0")) {%>
	<%@ include file='/WEB-INF/view/state/AdminLogin.jsp' %>
	<%}else{ %>
 	 <%@ include file='/WEB-INF/view/state/Login.jsp' %>
	<%} %>
	
	<%}else{ %>
  	 <%@ include file='/WEB-INF/view/state/NotLogin.jsp' %>
	<%} %>
	
		<!-- Home -->
	
		<div class="home">
			<div class="home_background"></div>
			<div class="background_image background_city" style="background-image:url(images/city_4.png)"></div>
			<div class="cloud cloud_3"><img src="/images/cloud_full_3.png" alt=""></div>
			<div class="cloud cloud_4"><img src="/images/cloud.png" alt=""></div>
			<div class="home_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">유형별 관광지</div>
								<div class="breadcrumbs">
									<ul class="d-flex flex-row align-items-center justify-content-start">
										<li><a href="/user/main.do">홈으로</a></li>
										<li>유형별 관광지</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	

	<!-- Contact -->
<div class="">
	<div class="contact">
		<div class="container">
			<div class="type_contents_all">
				
				
				<!-- 자연 -->
				<button class="type_button" onclick="location.href='/getTourList.do?Type=자연'" >
					<img src="/images/type1.png" class="type_button_icon">
					<div class="type_button_text">자연</div>
				</button>


				<button class="type_button" onclick="location.href='/getTourList.do?Type=볼거리'" >
						<img src="/images/type2.png" class="type_button_icon">
						<div class="type_button_text">볼거리</div>
				</button>


				<button class="type_button" onclick="location.href='/getTourList.do?Type=문화'" >
						<img src="/images/type3.png" class="type_button_icon">
						<div class="type_button_text">문화</div>
				</button>


				<button class="type_button" onclick="location.href='/getTourList.do?Type=스포츠'" >
						<img src="/images/type4.png" class="type_button_icon">
						<div class="type_button_text">스포츠</div>
				</button>
				
				
			</div>
			
		</div>
	</div>
</div>

	<!-- Footer -->

	<footer class="footer magic_fade_in">
		<div class="container">
			<div class="row">


				<div class="footer_about">
					<div class="footer_logo">
						서울<span> 나들이</span>
					</div>
					<div class="copyright">
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						데이터분석과 1920110001 강재남<i class="fa fa-heart-o" aria-hidden="true"></i>
						by <a href="http://www.kopo.ac.kr/kangseo/index.do"
							target="_blank">KOPO kangseo</a>

					</div>
					<div class="footer_text">
						<!-- Footer 위치 -->
						<div class="footer_contents_text">
							<h4 class="footer_title">
								<i class="fas fa-map-marker-alt"></i> 위치
							</h4>
							<p class="lead mb-0">
								서울특별시 <br>강서구 우장산로10길 112
							</p>
						</div>

						<!-- Footer 연락처 -->
						<br>
						<div class="footer_contents_text">
							<h4 class="footer_title">연락처</h4>
							<p class="lead mb-0">
								<i class="fas fa-phone-square"></i>&nbsp;010-4727-0154
							</p>
							<p class="lead mb-0">
								<i class="fas fa-envelope-square"></i>&nbsp;nymjae&#64;naver.com
							</p>
						</div>

						<!-- Footer 서울 나들이란 -->
						<br>
						<div class="footer_contents_text">
							<h4 class="footer_title">
								<i class="fas fa-city"></i> 서울나들이란
							</h4>
							<p class="lead mb-0">
								서울내의 관광지들을<br /> 거리별, 지역별, 유형별로 검색 할 수 있는 사이트
							</p>
						</div>

					</div>

				</div>



			</div>
		</div>
	</footer>
</div>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/styles/bootstrap-4.1.2/popper.js"></script>
<script src="/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
<script src="/plugins/greensock/TweenMax.min.js"></script>
<script src="/plugins/greensock/TimelineMax.min.js"></script>
<script src="/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="/plugins/greensock/animation.gsap.min.js"></script>
<script src="/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/plugins/easing/easing.js"></script>
<script src="/plugins/progressbar/progressbar.min.js"></script>
<script src="/plugins/parallax-js-master/parallax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="/js/contact.js"></script>
</body>
</html>