<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>마이페이지</title>
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
<link rel="stylesheet" type="text/css" href="/styles/mypage.css">
<link rel="stylesheet" type="text/css"
	href="/styles/services_responsive.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<%
	String email = CmmUtil.nvl((String) session.getAttribute("SS_EMAIL"));
%>

<%
	//CmmUtil 붙이기 수정
	String ss_email = CmmUtil.nvl((String) session.getAttribute("SS_EMAIL"));
	String ss_nickname = CmmUtil.nvl((String) session.getAttribute("SS_NICKNAME"));
	String ss_user_no = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));
	List<NoticeDTO> nList = (List<NoticeDTO>) request.getAttribute("nList");
	String authority = CmmUtil.nvl((String) session.getAttribute("SS_AUTHORITY"));
	//페이징
	int PgNum = (int)request.getAttribute("PgNum");
	int total = (int)request.getAttribute("total");
%>

<!-- 리뷰 목록  -->
<style>
.table_container {
	z-index: 10;
	width: 70%;
	margin: auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 20px;
}

.list_linck {
	a: link text-decoration: none;
	color: #060606;
	a: visited text-decoration: none;
	color: #060606;
	a: active text-decoration: none;
	color: #060606;
	a: hover text-decoration: underline;
	color: #060606;
}

.text_center {
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

		<%
			if (!email.equals("")) {
		%>

		<%
			if (authority.equals("0")) {
		%>
		<%@ include file='/WEB-INF/view/state/AdminLogin.jsp'%>
		<%
			} else {
		%>
		<%@ include file='/WEB-INF/view/state/Login.jsp'%>
		<%
			}
		%>

		<%
			} else {
		%>
		<%@ include file='/WEB-INF/view/state/NotLogin.jsp'%>
		<%
			}
		%>

		<!-- Home -->

		<div class="home">
			<div class="home_background"></div>
			<div class="background_image background_city"
				style="background-image: url(images/city_3.png)"></div>
			<div class="cloud cloud_1">
				<img src="images/cloud.png" alt="">
			</div>
			<div class="cloud cloud_2">
				<img src="images/cloud.png" alt="">
			</div>
			<div class="cloud cloud_3">
				<img src="images/cloud_full_2.png" alt="">
			</div>
			<div class="cloud cloud_4">
				<img src="images/cloud.png" alt="">
			</div>
			<div class="home_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">마이페이지</div>
								<div class="breadcrumbs">
									<ul
										class="d-flex flex-row align-items-center justify-content-start">
										<li><a href="index.html">홈으로</a></li>
										<li>마이페이지</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 테이블 들어갈 위치 -->
		<div style="width: 100%; padding-top: 150px;">
			<div class="table_container">
				<div data-open="click" data-menu="vertical-menu"
					data-col="2-columns"
					class="vertical-layout vertical-menu 2-columns  fixed-navbar">
					<!-- ////////////////////////////////////////////////////////////////////////////-->
					<div class="app-content content container-fluid">

						<div class="content-wrapper">

							<div class="content-body">


								<h2>내가 쓴 리뷰</h2>
								<%-- <table id="notiTable" style="width: 100%"
										class="table table-bordred table-striped">
										<thead>
											<tr>
												<th width="100px" class="text_center">번호</th>
												<th width="500px" class="text_center">제목</th>
												<th width="150px" class="text_center">작성자</th>
												<th width="350px" class="text_center">작성일</th>
												<th width="150px" class="text_center">평점</th>
												<th width="150px" class="text_center">조회수</th>
											</tr>
										</thead>
										<hr>
										<tbody>
											<%
												for (NoticeDTO rDTO : nList) {
											%>
											<%
												String Reg_date = rDTO.getReg_date();
											%>
											
											<tr>
												<td class="text_center"><a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getReview_no()%></a></td>
												<td class="text_center"><a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getTitle()%></a></td>
												<td class="text_center"><a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getReg_nick()%></a></td>
												<td class="text_center"><a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=Reg_date.substring(0,16)%></a></td>
												<td class="text_center"><a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getStarCount()%></a></td>
												<td class="text_center"><a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getViewcount()%></a></td>
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
											<div class="divTableHead">작성자</div>
											<div class="divTableHead">작성일</div>
											<div class="divTableHead">평점</div>
											<div class="divTableHead">조회수</div>
										</div>
									</div>
									<% for (NoticeDTO rDTO : nList) { %>
									<% String Reg_date = rDTO.getReg_date(); %>
									<div class="divTableBody">
										<div class="divTableRow">
											<div class="divTableCell">
												<a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getReview_no()%></a>
											</div>
											<div class="divTableCell">
												<a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getTitle()%></a>
											</div>
											<div class="divTableCell">
												<a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getReg_nick()%></a>
											</div>
											<div class="divTableCell">
												<a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=Reg_date.substring(0,16)%></a>
											</div>
											<div class="divTableCell">
												<a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getStarCount()%></a>
											</div>
											<div class="divTableCell">
												<a class="list_linck"
													href="/tour/reviewDetail.do?Review_No=<%=rDTO.getReview_no()%>"><%=rDTO.getViewcount()%></a>
											</div>
										</div>
									</div>
									<% } %>
								</div>

								<!-- div로 바꾸는 시도 끝 -->

								<!-- 페이징 시도중 -->
			
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
                        href="/user/mypage.do?PgNum=<%=PgNum - 1%>"> < </a></span></li>
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
                        href="/user/mypage.do?PgNum=<%=i%>"><%=i%></a></span></li>
                 <% }else{%>
                  <li><span><a 
                        href="/user/mypage.do?PgNum=<%=i%>"><%=i%></a></span></li>
                  <%
                     }	}
                  %>
                  <%
                     } else {
                  %>
                  <%
                     for (int i = startPage; i <= startPage + 4; i++) {
                    	 if(i==PgNum){ %>
                    	 <li><span><a class="is-active"
                        href="/user/mypage.do?PgNum=<%=i%>>"><%=i%></a></span></li>
                    	 <%}else{ %>
                  <li><span><a
                        href="/user/mypage.do?PgNum=<%=i%>>"><%=i%></a></span></li>
                  <%
                     }	}
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
                        href="/user/mypage.do?PgNum=<%=PgNum + 1%>">></a></span></li>
                  <%
                     }
                  %>
               </ul>
            </div>
			
			
			<!-- 페이징 시도 끝 -->
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="services">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="section_title text-center magic_fade_in">
							<h2>회원 정보 수정</h2>
						</div>
					</div>
				</div>

				<div id="user_modify">
					<form action="/user/modifyEmail.do" method="POST">
						<div class="input-group1">
							<label class="label">기존 이메일</label>
							<div class="info_div" id="befEmail"><%=ss_email%></div>
						</div>
						<div class="input-group1">
							<label class="label">수정할 이메일</label> <input
								class="input--style-4" id="aftEmail" type="email"
								value="<%=ss_email%>" name="email">

						</div>

						<div class="input-group1">
							<label class="label">기존 닉네임</label>
							<div class="info_div" id="befNick"><%=ss_nickname%></div>

						</div>
						<div class="input-group1">
							<label class="label">수정할 닉네임</label> <input
								class="input--style-4" id="aftNick" type="text"
								value="<%=ss_nickname%>" name="nickname">
						</div>
						<button class="btn btn--radius-2 btn--blue" type="submit">수정하기</button>

					</form>

				</div>
				<div id="user_modify2">
					<form action="/user/modifyPassword.do" method="POST">
						<div class="input-group1">
							<label class="label">수정할 비밀번호</label> <input
								class="input--style-4" type="password" placeholder="Passowrd"
								name="password">
						</div>
						<div class="input-group1">
							<label class="label">비밀번호 확인</label> <input
								class="input--style-4" type="password" placeholder="Passowrd"
								name="password2">
						</div>

						<button class="btn btn--radius-2 btn--blue" type="submit">수정하기</button>
					</form>
				</div>

				<button id="user_del" onclick="fn_user_delete(<%=ss_user_no%>)">회원탈퇴</button>
				
			</div>
		</div>

		<script>
	function fn_user_delete(no) {
      let deleted = confirm("회원을 탈퇴하시겠습니까?");
      
      if(deleted) {
         location.href='userdelete.do?no=' + no;
      }
   }
	</script>



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
							<script>document.write(new Date().getFullYear());</script>
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
	<script src="/js/services.js"></script>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/ReviewDatatable/js/popper.min.js"></script>
	<script src="/ReviewDatatable/js/bootstrap.min.js"></script>
	<script src="/ReviewDatatable/js/jquery.dataTables.min.js"></script>
	<script src="/ReviewDatatable/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>