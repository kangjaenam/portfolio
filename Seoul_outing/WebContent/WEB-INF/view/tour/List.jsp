<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%
	List<NoticeDTO> nList = (List<NoticeDTO>) request.getAttribute("nList");
	String email = CmmUtil.nvl((String)session.getAttribute("SS_EMAIL"));
	String authority = CmmUtil.nvl((String)session.getAttribute("SS_AUTHORITY"));
	//페이징
	int PgNum = (int)request.getAttribute("PgNum");
   int total = (int)request.getAttribute("total");
   String type = CmmUtil.nvl((String)request.getAttribute("type"));
   String searchtitle = CmmUtil.nvl((String)request.getAttribute("searchtitle"));
   String addr = CmmUtil.nvl((String)request.getAttribute("addr"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>서울 나들이</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="HostSpace template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/styles/responsive.css">

<!-- 관광지 목록  -->
<style>
.table_container {
	z-index: 10;
	width: 70%;
	margin: auto;
	background-color: #fff;
	padding:30px;
	border-radius: 20px;
	
}
.list_linck{
	a:link text-decoration: none; color: #060606;
	a:visited text-decoration: none; color: #060606;
	a:active text-decoration: none; color: #060606;
	a:hover text-decoration: underline; color: #060606;
}
.text_center{
	text-align: center;
}


/* div로 바꾸는중인것 */
.divTable{
	display: table;
	width: 100%;
}
.divTableRow {
	display: table-row;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
}
.divTableCell, .divTableHead {
	border: 1px solid #999999;
	display: table-cell;
	padding: 3px 10px;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
	font-weight: bold;
}
.divTableFoot {
	background-color: #EEE;
	display: table-footer-group;
	font-weight: bold;
}
.divTableBody {
	display: table-row-group;
}
/*변환 화기 끝*/

/* 페이징박스 */
.pagingBox {
   width: 100%;
   font-size: 16px;
}

.pagingBox ul {
   padding: 0;
   margin: 0;
}

.pagingBox ul li {
   display: inline-block;
   margin-bottom: 4px;
   font-weight: 400;
}

.pagingBox ul li a, .pagingBox ul li span {
   color: #2C3E50;
   text-align: center;
   display: inline-block;
   width: 40px;
   height: 40px;
   line-height: 40px;
   border-radius: 50%;
   border: 1px solid #e6e6e6;
}

/* 페이징 현재 페이지 */
.p1 a{
  width: 40px;
  height: 40px;
  line-height: 40px;
  padding: 0;
  text-align: center;
}

.p1 a.is-active{
  background-color: #2ecc71;
  border-radius: 100%;
  color: #fff;
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

		<div class="home" style="height: 1050px">
			<div class="home_background"></div>
			<div class="background_image background_city"
				style="background-image: url(/images/city.png)"></div>
			<div class="cloud cloud_1">
				<img src="/images/cloud.png" alt="">
			</div>
			<div class="cloud cloud_2">
				<img src="/images/cloud.png" alt="">
			</div>
			<div class="cloud cloud_3">
				<img src="/images/cloud_full.png" alt="">
			</div>
			<div class="cloud cloud_4">
				<img src="/images/cloud.png" alt="">
			</div>
			<!-- 테이블 들어갈 위치 -->
			<div style="width:100%;padding-top:150px;">
				<div class="table_container">
					<div data-open="click" data-menu="vertical-menu"
						data-col="2-columns"
						class="vertical-layout vertical-menu 2-columns  fixed-navbar">
						<!-- ////////////////////////////////////////////////////////////////////////////-->
						<div class="app-content content container-fluid">

							<div class="content-wrapper">

								<div class="content-body">



									<h2>관광지 목록</h2>
									<%-- <table id="notiTable" style="width: 100%"
										class="table table-bordred table-striped">
										<thead>
											<tr>
												<th width="100px" class="text_center">번호</th>
												<th width="500px" class="text_center">제목</th>
												<th width="150px" class="text_center">유형</th>
												<th width="150px" class="text_center">조회수</th>
											</tr>
										</thead>
										<hr>
										<tbody>
											<%
												for (NoticeDTO nDTO : nList) {
											%>

											<tr>
												<td class="text_center"><a class="list_linck"
													href="/tour/tourDetail.do?Tour_No=<%=nDTO.getTour_no()%>"><%=nDTO.getTour_no()%></a></td>
												<td class="text_center"><a class="list_linck"
													href="/tour/tourDetail.do?Tour_No=<%=nDTO.getTour_no()%>"><%=nDTO.getTitle()%></a></td>
												<td class="text_center"><a class="list_linck"
													href="/tour/tourDetail.do?Tour_No=<%=nDTO.getTour_no()%>"><%=nDTO.getType()%></a></td>
												<td class="text_center"><a class="list_linck"
													href="/tour/tourDetail.do?Tour_No=<%=nDTO.getTour_no()%>"><%=nDTO.getViewcount()%></a></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table> --%>
									
									<!-- div로 바꾸는 시도중 -->
									
									<div class="divTable">
										<div class="divTableHeading">
											<div class="divTableRow">
												<div class="divTableHead">번호</div>
												<div class="divTableHead">제목</div>
												<div class="divTableHead">유형</div>
												<div class="divTableHead">조회수</div>
											</div>
										</div>
										<% for (NoticeDTO nDTO : nList) { %>
										<div class="divTableBody">
											<div class="divTableRow">
												<div class="divTableCell">
													<a class="list_linck"
														href="/tour/tourDetail.do?Tour_No=<%=nDTO.getTour_no()%>"><%=nDTO.getTour_no()%></a>
												</div>
												<div class="divTableCell">
													<a class="list_linck"
														href="/tour/tourDetail.do?Tour_No=<%=nDTO.getTour_no()%>"><%=nDTO.getTitle()%></a>
												</div>
												<div class="divTableCell">
													<a class="list_linck"
														href="/tour/tourDetail.do?Tour_No=<%=nDTO.getTour_no()%>"><%=nDTO.getType()%></a>
												</div>
												<div class="divTableCell">
													<a class="list_linck"
														href="/tour/tourDetail.do?Tour_No=<%=nDTO.getTour_no()%>"><%=nDTO.getViewcount()%></a>
												</div>
											</div>
										</div>
										<% } %>
									</div>
									<!-- div 바꾸기 시도 끝 -->
									
			
			 <!-- 페이징 시작 -->
            <div class="pagingBox pagination p1"
               style="margin-top: 15px; margin-bottom: 15px;">
               <ul style="list-style: none;">
                  <%
                     int totalPage = (total - 1) / 20 + 1;
                     int startPage = ((PgNum - 1) / 5) * 5 + 1;
                     int temp = ((totalPage - 1) / 5) * 5 + 1;
                  %>
                  <!-- < 이전 찍기 -->
                  <%
                     if (PgNum == 1) {
                  %>
                  <li><span><</span></li>
                  <%
                     } else {
                  %>
                  <li><span><a
                        href="/getTourList.do?PgNum=<%=PgNum - 1%>&Type=<%=type%>&tourName=<%=searchtitle%>&Area=<%=addr%>"> < </a></span></li>
                  <%
                     }
                  %>
                  <!-- 숫자 찍기 -->
                  <%
                     if (startPage == temp) {
                  %>
                  <%
                     for (int i = startPage; i <= totalPage; i++) {
                    	 if(i==PgNum){ %>
                 <li><span><a class="is-active"
                        href="/getTourList.do?PgNum=<%=i%>&Type=<%=type%>&tourName=<%=searchtitle%>&Area=<%=addr%>"><%=i%></a></span></li>
                  <% }else{
                  %>
                  <li><span><a 
                        href="/getTourList.do?PgNum=<%=i%>&Type=<%=type%>&tourName=<%=searchtitle%>&Area=<%=addr%>"><%=i%></a></span></li>
                  <%
                     }	}
                  %>
                  <%
                     } else {
                  %>
                  <%
                     for (int i = startPage; i <= startPage + 4; i++) {
                    	 if(i==PgNum){  %>
                    		 <li><span><a class="is-active"
                        href="/getTourList.do?PgNum=<%=i%>&Type=<%=type%>&tourName=<%=searchtitle%>&Area=<%=addr%>"><%=i%></a></span></li>
                    	<% }else{
                  %>
                  <li><span><a
                        href="/getTourList.do?PgNum=<%=i%>&Type=<%=type%>&tourName=<%=searchtitle%>&Area=<%=addr%>"><%=i%></a></span></li>
                  <%
                     } }
                  %>
                  <%
                     }
                  %>
                  <!-- > 다음 찍기 -->
                  <%
                     if (PgNum == totalPage) {
                  %>
                  <li><span>></span></li>
                  <%
                     } else {
                  %>
                  <li><span><a
                        href="/getTourList.do?PgNum=<%=PgNum + 1%>&Type=<%=type%>&tourName=<%=searchtitle%>&Area=<%=addr%>">></a></span></li>
                  <%
                     }
                  %>
               </ul>
            </div>
			<!-- 페이징 끝 --> 
						
									
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
	<script src="/js/custom.js"></script>
	
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/datatable/js/popper.min.js"></script>
	<script src="/datatable/js/bootstrap.min.js"></script>
	<script src="/datatable/js/jquery.dataTables.min.js"></script>
	<script src="/datatable/js/dataTables.bootstrap4.min.js"></script>
	
	<script>
		$(document).ready(function() {
			$('#notiTable').DataTable();
		});
	</script>

</body>
</html>