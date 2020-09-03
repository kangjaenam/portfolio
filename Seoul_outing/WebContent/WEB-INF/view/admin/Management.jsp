<%@page import="poly.dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>관리자 페이지</title>
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
	String ss_nickname = CmmUtil.nvl((String) session.getAttribute("SS_NICKNAME"));
	String ss_user_no = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));
	List<UserInfoDTO> nList = (List<UserInfoDTO>) request.getAttribute("nList");
	String authority = CmmUtil.nvl((String) session.getAttribute("SS_AUTHORITY"));
	//페이징
	int PgNum = (int)request.getAttribute("PgNum");
	int total = (int)request.getAttribute("total");
%>

<!-- 유저 목록  -->
<style>
.table_container {
	z-index: 10;
	width: 70%;
	margin: auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 20px;
}

.user_div {
	cursor: pointer;
	display: inline-block;
	border: solid;
	border-color: #A94028;
	padding: 5px;
	border-radius: 5px;
	color: #2961D7;
	font-weight: 700;
}

.text_center {
	text-align: center;
}

#addTour {
	width: 800px;
	background-color: #8E99B1;
	margin: 0 auto;
	padding: 35px;
	margin-top: 70px;
}

.tourType {
	color: #0C0C0C;
	font-size: 20px;
	margin: 3px;
}

.inputAddr {
	margin-top: 20px;
	width: 500px;
	line-height: 50px;
	background: #fafafa;
	-webkit-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	-moz-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	padding: 0 20px;
	font-size: 16px;
	color: #666;
	-webkit-transition: all 0.4s ease;
	-o-transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

.inputExplain {
	margin-top: 20px;
	width: 700px;
	line-height: 50px;
	background: #fafafa;
	-webkit-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	-moz-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	padding: 0 20px;
	font-size: 16px;
	color: #666;
	-webkit-transition: all 0.4s ease;
	-o-transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	transition: all 0.4s ease;
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
								<div class="home_title">관리페이지</div>
								<div class="breadcrumbs">
									<ul
										class="d-flex flex-row align-items-center justify-content-start">
										<li><a href="index.html">홈으로</a></li>
										<li>관리페이지</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 관광지 추가 -->
		<div id="addTour">
			<h2>관광지 추가</h2>
			<br>
			<form action="/admin/addTour.do" method="post"
				enctype="multipart/form-data">
				<input class="input--style-4" type="text" placeholder="관광지명 입력"
					name="tourName" required="required"> <span class="tourType"
					style="margin-left: 35px">관광지 유형 : </span> <input type="radio"
					name="type" value="자연" checked><span class="tourType">자연</span>
				<input type="radio" name="type" value="볼거리"><span
					class="tourType">볼거리</span> <input type="radio" name="type"
					value="문화"><span class="tourType">문화</span> <input
					type="radio" name="type" value="스포츠"><span class="tourType">스포츠</span>
				<input class="inputAddr" type="text" placeholder="관광지 주소입력"
					name="tourAddr"> <br> <input class="input--style-4"
					type="text" placeholder="전화번호입력" name="tourTell"
					style="margin-top: 20px"> <input class="input--style-4"
					type="text" placeholder="운영시간입력" name="tourTime"
					style="margin-top: 20px"> <br> <input
					class="input--style-4" type="number" placeholder="위도입력"
					name="tourLat" style="margin-top: 20px"> <input
					class="input--style-4" type="number" placeholder="경도입력"
					name="tourHar" style="margin-top: 20px"> <input
					class="inputExplain" type="text" placeholder="관광지 설명"
					name="tourExplain" style="margin-top: 20px"> <label
					class="btn btn-primary btn-file" style="margin-left: 0px;">관광지
					이미지 파일추가 <input name="fileUpload" type="file"
					style="display: none; float: left;">
				</label>
				<button class="btn btn--radius-2 btn--blue" type="submit"
					style="margin-top: 20px">추가하기</button>
			</form>
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


								<h2>회원 정보</h2>
								<%-- <table id="notiTable" style="width: 100%"
										class="table table-bordred table-striped">
										<thead>
											<tr>
												<th width="100px" class="text_center"></th>
												<th width="100px" class="text_center">번호</th>
												<th width="500px" class="text_center">닉네임</th>
												<th width="550px" class="text_center">가입일자</th>
												<th width="150px" class="text_center">권한</th>
												<th width="150px" class="text_center">상태</th>
											</tr>  
										</thead>
										<hr>
										<tbody>
											<%
												for (UserInfoDTO rDTO : nList) {
											%>
																						
											<tr>
												<td class="text_center"><input type="radio" name="user_seq" value="<%=rDTO.getUser_no()%>"></td>
												<td class="text_center"><%=rDTO.getUser_no()%></td>
												<td class="text_center"><%=rDTO.getNickname()%></td>
												<td class="text_center"><%=rDTO.getReg_dt()%></td>
												<td class="text_center">
												<%if(rDTO.getAuthority().equals("0")){ %>
													관리자
												<%}else if(rDTO.getAuthority().equals("1")){ %>
													일반회원
												<%}else if(rDTO.getAuthority().equals("2")){ %>
													정지회원
												<%}else{ %>
													권한오류
												<%} %>
												</td>
												<td class="text_center">
												<%if(rDTO.getState().equals("0")){ %>
													정상
												<%}else if(rDTO.getState().equals("1")){ %>
													정지
												<%}else{ %>
													상태오류
												<%} %>
												</td>
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
											<div class="divTableHead"></div>
											<div class="divTableHead">번호</div>
											<div class="divTableHead">닉네임</div>
											<div class="divTableHead">가입일자</div>
											<div class="divTableHead">권한</div>
											<div class="divTableHead">상태</div>
										</div>
									</div>
									<% for (UserInfoDTO rDTO : nList) { %>
									<div class="divTableBody">
										<div class="divTableRow">
											<div class="divTableCell">
											
												<input name="user_seq" type="radio"	value="<%=rDTO.getUser_no()%>" /></div>
											<div class="divTableCell"><%=rDTO.getUser_no()%></div>
											<div class="divTableCell"><%=rDTO.getNickname()%></div>
											<div class="divTableCell"><%=rDTO.getReg_dt()%></div>
											<div class="divTableCell">
											<%if(rDTO.getAuthority().equals("0")){%>
											관리자
											<%}else if(rDTO.getAuthority().equals("1")){%> 
											일반회원 
											<%}else if(rDTO.getAuthority().equals("2")){%>
											정지회원 
											<%}else{ %>
											권한오류 
											<%} %>
											</div>
											
											<div class="divTableCell">
											<%if(rDTO.getState().equals("0")){%> 
											정상 
											<%}else if(rDTO.getState().equals("1")){ %>
											정지
											<%}else{ %> 
											상태오류 
											<%} %></div>
										</div>
									</div>
									<% }%>
								</div>


								<!-- div로 바꾸는 시도끝 -->
								
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
                        href="/admin/management.do?PgNum=<%=PgNum - 1%>"> < </a></span></li>
                  <%
                     }
                  %>
                  <!-- 숫자 찍기 -->
                  <%
                     if (startPage == temp) {
                  %>
                  <%
                     for (int i = startPage; i <= totalPage; i++) {
                    	 if(i==PgNum){   %>
                    	  <li><span><a class="is-active"
                        href="/admin/management.do?PgNum=<%=i%>"><%=i%></a></span></li>
                    	 <%}else{ %>
                  <li><span><a
                        href="/admin/management.do?PgNum=<%=i%>"><%=i%></a></span></li>
                  <%
                     }	}
                  %>
                  <%
                     } else {
                  %>
                  <%
                     for (int i = startPage; i <= startPage + 4; i++) {
                    	 if(i==PgNum){   %>
                    	 <li><span><a class="is-active"
                        href="/admin/management.do?PgNum=<%=i%>>"><%=i%></a></span></li>
                    	 <%}else{ %>
                  <li><span><a
                        href="/admin/management.do?PgNum=<%=i%>>"><%=i%></a></span></li>
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
                        href="/admin/management.do?PgNum=<%=PgNum + 1%>">></a></span></li>
                  <%
                     }
                  %>
               </ul>
            </div>
			
			
			<!-- 페이징 시도 끝 -->

								<div style="margin-top: 15px;">
								<div onclick="modifyStop()" class="user_div">상태변경</div>
								<div onclick="modifyAuthor()" class="user_div">권한변경</div>
								<div onclick="modifyDel()" class="user_div">회원탈퇴</div>
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
	<script type="text/javascript">
		function modifyAuthor() {

			if (confirm("권한을 변경하시겠습니까?") == true) {
				document.location.href = "/ModifyAuthor.do?user_seq="
						+ $("input:radio[name=user_seq]:checked").val();
			} else {
				return false;
			}
		}
		function modifyStop() {

			if (confirm("유저상태를 변경하시겠습니까?") == true) {
				document.location.href = "/ModifyState.do?user_seq="
						+ $("input:radio[name=user_seq]:checked").val();
			} else {
				return false;
			}
		}
		function modifyDel() {

			if (confirm("유저 탈퇴를 진행하시겠습니까?") == true) {
				document.location.href = "/user/userdelete.do?no="
						+ $("input:radio[name=user_seq]:checked").val();
			} else {
				return false;
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
	<script src="/js/services.js"></script>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/ReviewDatatable/js/popper.min.js"></script>
	<script src="/ReviewDatatable/js/bootstrap.min.js"></script>
	<script src="/ReviewDatatable/js/jquery.dataTables.min.js"></script>
	<script src="/ReviewDatatable/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>