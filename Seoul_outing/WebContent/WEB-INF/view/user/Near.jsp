<%@page import="poly.util.CmmUtil"%>
<%@page import="org.codehaus.jettison.json.JSONArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.text.Position"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>내 주변 관광지</title>
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
<link href="/plugins/colorbox/colorbox.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" href="/styles/near.css">
<link rel="stylesheet" type="text/css"
	href="/styles/about_responsive.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<%
	String email = CmmUtil.nvl((String)session.getAttribute("SS_EMAIL"));
	String authority = CmmUtil.nvl((String)session.getAttribute("SS_AUTHORITY"));
	JSONArray nList = (JSONArray) request.getAttribute("nList");
%>
<style>
#info{
	padding: 5px;
	text-overflow: ellipsis;
	color: #0B0719;
	height: 100px;
	width: 280px;
}
#icon{
	color: #FA5858;
}
#span_color{
	color: #0DA6B8;
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
								<div class="home_title">내 주변 관광지</div>
								<div class="breadcrumbs">
									<ul
										class="d-flex flex-row align-items-center justify-content-start">
										<li><a href="index.html">홈으로</a></li>
										<li>내 주변 관광지</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Why Choose Us -->

		<!-- 현위치 지도 -->
		<div class="why">
			<div id="map2" style="width: 100%; height: 785px;"></div>		
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
	
	

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70a0072f99e473e0abd5bafc1f2a88ee"></script>
	<script type="text/javascript" src="/js/kakao_map.js"></script>
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
	<script src="/plugins/colorbox/jquery.colorbox-min.js"></script>
	<script src="/js/about.js"></script>
	<script type="text/javascript">
	
	var mapContainer = document.getElementById('map2'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.578044, 126.981064), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

	var map2 = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var positions2 = [];
	var nList = <%=nList%>
	//for 문 제이쿼리에서 쓰는 for 문
	$.each(nList,function(index,data){
		positions2.push({title:data.TITLE,content:data.ADDR,tour_no:data.TOUR_NO,latlng:new kakao.maps.LatLng(data.LAT,data.HAR)});
	})


	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	console.log('asd');
	
	$.each(positions2,function(i){
		// 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map2, // 마커를 표시할 지도
	        position: positions2[i].latlng, // 마커를 표시할 위치
	        image : markerImage, // 마커 이미지 
	        clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	   });
	 // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div id="info">' +positions2[i].title + '<br> <i class="fas fa-map-marker-alt" id="icon"></i> : '+ positions2[i].content+'<br><span id="span_color">마커 클릭 시 상세페이지 이동..</span><div>'// 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map2, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커 위에 인포윈도우를 표시합니다
	        location.href="/tour/tourDetail.do?Tour_No="+positions2[i].tour_no;
	  });
	  	
	    

	})
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map2, marker, infowindow) {
    return function() {
        infowindow.open(map2, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

//마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'click', function() {
      // 마커 위에 인포윈도우를 표시합니다
      location.href="tour/tourDetail.do?Tour_No=";
});
		

	
	</script>
</body>
</html>