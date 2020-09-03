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
<title>서울 나들이</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="HostSpace template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/styles/responsive.css">


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
		<div class="background_image background_city" style="background-image:url(/images/city.png)"></div>
		<div class="cloud cloud_1"><img src="/images/cloud.png" alt=""></div>
		<div class="cloud cloud_2"><img src="/images/cloud.png" alt=""></div>
		<div class="cloud cloud_3"><img src="/images/cloud_full.png" alt=""></div>
		<div class="cloud cloud_4"><img src="/images/cloud.png" alt=""></div>
		<div class="home_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content text-center">
							<div class="home_title">서울에서 놀자!</div>
							<div class="home_text">원하는 관광지를 유형별, 지역별로 찾아보자.</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<div class="domain_search_form_container">
							<form action="/user/searchTourname.do" id="domain_search_form" class="domain_search_form d-flex flex-md-row flex-column align-items-center justify-content-start">
								<div class="d-flex flex-row align-items-center justify-content-start">
									
									<input type="text" class="domain_search_input" name="tourName" placeholder="검색어 입력" required="required">
									<div class="domain_search_dropdown d-flex flex-row align-items-center justify-content-start">	
										<div class="domain_search_selected">관광지명</div>
										
									</div>
								</div>
								<button type="submit" class="domain_search_button d-flex flex-row align-items-center justify-content-center"><img src="images/search.png" alt="">검색</button>
							</form>
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
						<div class="footer_logo">서울<span> 나들이</span></div>
						<div class="copyright">
Copyright &copy;<script>document.write(new Date().getFullYear());</script> 데이터분석과 1920110001 강재남<i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="http://www.kopo.ac.kr/kangseo/index.do" target="_blank">KOPO kangseo</a>

</div>
						<div class="footer_text">
							<!-- Footer 위치 -->
								<div class="footer_contents_text">
									<h4 class="footer_title">
									<i class="fas fa-map-marker-alt"></i>
									   위치
									</h4>
									<p class="lead mb-0">서울특별시
									  <br>강서구 우장산로10길 112</p>
								</div>
						  
								  <!-- Footer 연락처 -->
								  <br><div class="footer_contents_text">
									<h4 class="footer_title">
									   연락처
									</h4>
								   <p class="lead mb-0"><i class="fas fa-phone-square"></i>&nbsp;010-4727-0154</p>
								 <p class="lead mb-0"><i class="fas fa-envelope-square"></i>&nbsp;nymjae&#64;naver.com</p>
								  </div>
								
								  <!-- Footer 서울 나들이란 -->
								  <br><div class="footer_contents_text">
									<h4 class="footer_title"><i class="fas fa-city"></i> 서울나들이란</h4>
									<p class="lead mb-0">서울내의 관광지들을<br/> 거리별, 지역별, 유형별로 검색 할 수 있는 사이트</p>
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
<script src="/js/custom.js"></script>


</body>
</html>