<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   String email = CmmUtil.nvl((String)session.getAttribute("SS_EMAIL"));
   String authority = CmmUtil.nvl((String)session.getAttribute("SS_AUTHORITY"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>지역별 관광지</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="HostSpace template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/styles/area.css">
<link rel="stylesheet" type="text/css" href="/styles/blog_responsive.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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
							<div class="home_title">지역별 관광지</div>
							<div class="breadcrumbs">
								<ul class="d-flex flex-row align-items-center justify-content-start">
									<li><a href="/user/main.do">홈으로</a></li>
									<li>지역별 관광지</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	

	
	<!-- News -->

	<div class="news">
		<div class="container">
			<div class="row">

				<!-- News Content -->
				<div class="col-lg-12">
					<div class="news_posts">
						
						<!-- ㄱ 으로 시작하는 구 -->
						<div class="news_post magic_fade_in">
							<div class="news_post_image">
								<img src="/images/dosan.jpg" alt="도산공원">
								<div class="news_post_date">
									<a href="#" class=" d-flex flex-column align-items-center justify-content-center">
										<div class="news_post_day">ㄱ</div>
										
									</a>
								</div>
							</div>
							<div class="news_post_content">
							
								<div class="news_post_meta">
									<ul class="d-flex flex-row align-items-start justify-content-start">
										<li><a href="/tour/area.do?Area=강남구">강남구</a></li>
										<li><a href="/tour/area.do?Area=강동구">강동구</a></li>
										<li><a href="/tour/area.do?Area=강북구">강북구</a></li>
										<li><a href="/tour/area.do?Area=강서구">강서구</a></li>
										<li><a href="/tour/area.do?Area=관악구">관악구</a></li>
										<li><a href="/tour/area.do?Area=광진구">광진구</a></li>
										<li><a href="/tour/area.do?Area=구로구">구로구</a></li>
										<li><a href="/tour/area.do?Area=금천구">금천구</a></li>
									</ul>
								</div>
														
							</div>
						</div>

						<!-- ㄴ 으로 시작하는 구 -->
						<div class="news_post magic_fade_in">
							<div class="news_post_image">
								<img src="/images/sulagsan.jpg" alt="https://unsplash.com/@gbeaudry">
								<div class="news_post_date">
									<a href="#" class=" d-flex flex-column align-items-center justify-content-center">
										<div class="news_post_day">ㄴ</div>
									</a>
								</div>
							</div>
							<div class="news_post_content">
								
								<div class="news_post_meta">
									<ul class="d-flex flex-row align-items-start justify-content-start">
										<li><a href="/tour/area.do?Area=노원구">노원구</a></li>
									</ul>
								</div>
								<div class="news_post_text">
								</div>
							</div>
						</div>

						<!-- ㄷ 으로 시작하는 구 -->
						<div class="news_post magic_fade_in">
							<div class="news_post_image">
								<img src="/images/sejongdaewang.jpg" alt="https://unsplash.com/@helloquence">
								<div class="news_post_date">
									<a href="#" class=" d-flex flex-column align-items-center justify-content-center">
										<div class="news_post_day">ㄷ</div>
									</a>
								</div>
							</div>
							<div class="news_post_content">
								
								<div class="news_post_meta">
									<ul class="d-flex flex-row align-items-start justify-content-start">
										<li><a href="/tour/area.do?Area=도봉구">도봉구</a></li>
										<li><a href="/tour/area.do?Area=동대문구">동대문구</a></li>
										<li><a href="/tour/area.do?Area=동작구">동작구</a></li>
									</ul>
								</div>
								<div class="news_post_text">
									
								</div>
							</div>
						</div>

					

					<!-- ㅁ 으로 시작하는 구 -->
					<div class="news_post magic_fade_in">
							<div class="news_post_image">
								<img src="/images/hongdae.jpg" alt="https://unsplash.com/@helloquence">
								<div class="news_post_date">
									<a href="#" class=" d-flex flex-column align-items-center justify-content-center">
										<div class="news_post_day">ㅁ</div>
									</a>
								</div>
							</div>
							<div class="news_post_content">
								
								<div class="news_post_meta">
									<ul class="d-flex flex-row align-items-start justify-content-start">
										<li><a href="/tour/area.do?Area=마포구">마포구</a></li>
									</ul>
								</div>
								<div class="news_post_text">
									
								</div>
							</div>
						</div>

					

					<!-- ㅅ 으로 시작하는 구 -->
					<div class="news_post magic_fade_in">
							<div class="news_post_image">
								<img src="/images/doglibmun.jpg" alt="https://unsplash.com/@helloquence">
								<div class="news_post_date">
									<a href="#" class=" d-flex flex-column align-items-center justify-content-center">
										<div class="news_post_day">ㅅ</div>
									</a>
								</div>
							</div>
							<div class="news_post_content">
								
								<div class="news_post_meta">
									<ul class="d-flex flex-row align-items-start justify-content-start">
										<li><a href="/tour/area.do?Area=서대문구">서대문구</a></li>
										<li><a href="/tour/area.do?Area=서초구">서초구</a></li>
										<li><a href="/tour/area.do?Area=성동구">성동구</a></li>
										<li><a href="/tour/area.do?Area=성북구">성북구</a></li>
										<li><a href="/tour/area.do?Area=송파구">송파구</a></li>
									</ul>
								</div>
								<div class="news_post_text">
									
								</div>
							</div>
						</div>

					<!-- ㅇ 으로 시작하는 구 -->
					<div class="news_post magic_fade_in">
							<div class="news_post_image">
								<img src="/images/seoultower.jpg" alt="https://unsplash.com/@helloquence">
								<div class="news_post_date">
									<a href="#" class=" d-flex flex-column align-items-center justify-content-center">
										<div class="news_post_day">ㅇ</div>
									</a>
								</div>
							</div>
							<div class="news_post_content">
								
								<div class="news_post_meta">
									<ul class="d-flex flex-row align-items-start justify-content-start">
										<li><a href="/tour/area.do?Area=양천구">양천구</a></li>
										<li><a href="/tour/area.do?Area=영등포구">영등포구</a></li>
										<li><a href="/tour/area.do?Area=용산구">용산구</a></li>
										<li><a href="/tour/area.do?Area=은평구">은평구</a></li>
									</ul>
								</div>
								<div class="news_post_text">
									
								</div>
							</div>
						</div>

					<!-- ㅈ 으로 시작하는 구 -->
					<div class="news_post magic_fade_in">
							<div class="news_post_image">
								<img src="/images/ssamji-gil.jpg" alt="https://unsplash.com/@helloquence">
								<div class="news_post_date">
									<a href="#" class=" d-flex flex-column align-items-center justify-content-center">
										<div class="news_post_day">ㅈ</div>
									</a>
								</div>
							</div>
							<div class="news_post_content">
								
								<div class="news_post_meta">
									<ul class="d-flex flex-row align-items-start justify-content-start">
										<li><a href="/tour/area.do?Area=종로구">종로구</a></li>
										<li><a href="/tour/area.do?Area=중구">중구</a></li>
										<li><a href="/tour/area.do?Area=중랑구">중랑구</a></li>

									</ul>
								</div>
								<div class="news_post_text">
									
								</div>
							</div>
						</div>

				
					</div>
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
<script src="/js/blog.js"></script>
</body>
</html>