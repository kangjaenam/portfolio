<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	String email = CmmUtil.nvl((String) session.getAttribute("SS_EMAIL"));
	List<NoticeDTO> nList = (List<NoticeDTO>) request.getAttribute("nList");
	String allCount = (String)request.getAttribute("allCount");
	String starAvg = CmmUtil.nvl((String)request.getAttribute("starAvg"));
	String authority = CmmUtil.nvl((String)session.getAttribute("SS_AUTHORITY"));
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>관광지 상세</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="HostSpace template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/styles/detail.css">
<link rel="stylesheet" type="text/css"
	href="/styles/elements_responsive.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
<style>
#adminTourBtn{
	
}
</style>


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
			<div class="background_image background_city"
				style="background-image: url(images/city_4.png)"></div>
			<div class="cloud cloud_3">
				<img src="images/cloud_full_3.png" alt="">
			</div>
			<div class="cloud cloud_4">
				<img src="images/cloud.png" alt="">
			</div>
			<div class="home_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">관광지 상세</div>
								<div class="breadcrumbs">
									<ul
										class="d-flex flex-row align-items-center justify-content-start">
										<li><a href="index.html">홈으로</a></li>
										<li>관광지 상세</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 관광지 명 -->
		<div class="name_of_tourist_destination">
			<div><%=nDTO.getTitle()%></div>
		</div>



		<div class="tabs_section">
			<div class="parallax_background parallax-window"
				data-parallax="scroll" data-speed="0.8"></div>
			<div class="container">
				<div class="row">
					<div class="col">
						

						<!-- Panel 1 -->
						<div class="tab_panels">
							<div class="tab_panel active">

								<div class="news_post magic_fade_in">
									<div class="tourist_destination_image">
									
										<img src="<%=CmmUtil.nvl(nDTO.getFilePath())%><%=CmmUtil.nvl(nDTO.getFileName())%>" alt="관광지 사진 정보 입력중"
											style="margin-top: 10px;">
									</div>
								</div>
							</div>

						
						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- 관광지 소개 -->
		<div class="introduction_to_tourism_area">
		<%=CmmUtil.nvl(nDTO.getExplain())%>
		<%if(CmmUtil.nvl(nDTO.getExplain())==""){%>
			데이터 정보 입력 중
		<%}%>
		
		</div>

		<!-- 관광지 기본정보 -->
		<div class="basic_information_tourism">
		
			<!-- 전화번호 -->
			<i class="fas fa-phone"></i><%=CmmUtil.nvl(nDTO.getTel())%>
										<%if(CmmUtil.nvl(nDTO.getTel())==""){%>
											전화번호 정보가 없습니다.
										<%}%>
			 &nbsp;&nbsp;&nbsp; 
			
			<!-- 주소 -->
			<i class="fas fa-map-marker-alt"></i> <%=CmmUtil.nvl(nDTO.getAddr())%>
										<%if(CmmUtil.nvl(nDTO.getAddr())==""){%>
											주소 정보가 없습니다.
										<%}%>
			&nbsp;&nbsp;&nbsp;
			
			<!-- 운영시간 --> 
			<i class="far fa-clock"></i> <%=CmmUtil.nvl(nDTO.getTime())%>
										<%if(CmmUtil.nvl(nDTO.getTime())==""){%>
											운영시간 정보가 없습니다.
										<%}%>
			&nbsp; 
			<!-- 유형 -->
			유형 : <%=CmmUtil.nvl(nDTO.getType())%>
			<%if(CmmUtil.nvl(nDTO.getType())==""){%>
				유형 정보가 없습니다.
			<%}%>
		</div>

		<!-- 별점과 리뷰 수 -->
		<div class="detail_star_review">
			<div class="detail_line">
				<img src="/images/star.svg" class="detail_icon">
				<div class="detail_star_review_text"><%=starAvg%></div>
			</div>
			<div class="detail_line">
				<img src="/images/review.svg" class="detail_icon">
				<div class="detail_star_review_text"><%=allCount%></div>
			</div>
		</div>


		<div class="review_previews">
			<!-- 리뷰가 하나도 없을 경우 -->
			<%if(nList.size()==0){%>
				<div id="no_review">등록된 후기가 없습니다!<br> 첫 번째 후기를 작성해보세요!</div>
			<%}%>
		
			<!-- 최근 리뷰 미리보기 -->
			<% 
				for (NoticeDTO rDTO : nList) {
			%>
			<div class="detail_review_preview">
				<div
					class="service d-flex flex-column align-items-center justify-content-start text-center trans_200">
					<div class="service_icon"></div>
					<div class="service_title">
						<h3><%=CmmUtil.nvl(rDTO.getTitle())%></h3>
						
							
					</div>
					<div class="service_text">
					<%
						String sc = rDTO.getStarCount();
						String star = "";
					
						if(sc.equals("5")){
							star = "★★★★★";
						}else if(sc.equals("4")){
							star = "★★★★☆";
						}else if(sc.equals("3")){
							star = "★★★☆☆";
						}else if(sc.equals("2")){
							star = "★★☆☆☆";
						}else if(sc.equals("1")){
							star = "★☆☆☆☆";
						}
					%>
						<p>
							<span id="starColor"><%=star%></span><br>
							<%=rDTO.getContent()%>
						</p>
					</div>
					<div class="service_button trans_200">
						<a href="reviewDetail.do?Review_No=<%=rDTO.getReview_no() %>" id="more">더보기..</a>
					</div>
				</div>
			</div>
			<%
				}
			%>
			

		</div>




		<!-- 리뷰 작성 버튼 -->
		<div class="detail_review_buttons" style="float: right">
			<div class="detail_review_button" style="margin-left:80%">
				<button class="contact_button"
					onclick="location.href='/user/writeReview.do?Tour_No=<%=nDTO.getTour_no()%>'">
					리뷰 작성 <i class="fas fa-pen"></i>
				</button>
			</div>
			<div class="detail_review_button" style="margin-left:80%">
				<button class="contact_button" 
				onclick="location.href='/user/reviewList.do?Tour_no=<%=nDTO.getTour_no()%>'">
					리뷰 더보기 <i class="fas fa-list"></i>
				</button>
			</div>
		
		<%
			if (authority.equals("0")) {
		%>
		<div id="adminTourBtn" style="margin-left:80%">
		<button class="contact_button"
			onclick="fn_tour_delete()">
			관광지 삭제 <i class="fas fa-comment-slash"></i>
		</button>
		</div>
		<%
			}
		%>
		</div>
		
		<!-- News Sidebar -->
		<div class="col-lg-3 sidebar_col">
			<div class="sidebar"></div>
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
	<script>
		function fn_tour_delete(){
			let deleted = confirm("관광지를 삭제 하시겠습니까?");
			if(deleted){
				location.href='/user/tourDelete.do?Tour_no=<%=nDTO.getTour_no()%>';
			}
		}
		</script>
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
	<script src="/js/elements.js"></script>
</body>
</html>