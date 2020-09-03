<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.NoticeDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>리뷰 쓰기</title>
<link rel="stylesheet" type="text/css" href="/styles/review_ detail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<%
	//CmmUtil 붙이기 수정
	String ss_nickname = CmmUtil.nvl((String) session.getAttribute("SS_NICKNAME"));
	String ss_user_no = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	String review_no = CmmUtil.nvl((String) request.getAttribute("Review_No"));
	String authority = CmmUtil.nvl((String)session.getAttribute("SS_AUTHORITY"));
%>



</head>
<body background="/images/login.jpg">
	<!-- 리뷰 전체 div -->
	<div class="review_detail_all">

		<!-- 리뷰 제목 날짜 -->
		<h3>
			<input type="text" class="review_write_title" name="title"
				value='<%=nDTO.getTitle()%>' required="required" readonly="readonly">
		</h3>
		<small><%=nDTO.getReg_date()%></small>

		<hr class="reviewlist_hr">
		<!-- 어느 리뷰인지와 작성자ID -->
		<p>
			<span class="review_type"><%=nDTO.getTitle2()%> >> </span>작성자 :
			<%=nDTO.getReg_nick()%>


		<!-- 별점 -->
		<%if(nDTO.getStarCount().equals("5")){ %>
		<div class="starRev">
			<span class="starR on">별1</span> 
			<span class="starR on">별2</span> 
			<span class="starR on">별3</span>
			<span class="starR on">별4</span> 
			<span class="starR on">별5</span>
		</div>
		<%}else if (nDTO.getStarCount().equals("4")){ %>
		<div class="starRev">
			<span class="starR on">별1</span> 
			<span class="starR on">별2</span> 
			<span class="starR on">별3</span>
			<span class="starR on">별4</span> 
			<span class="starR">별5</span>
		</div>
		<%}else if (nDTO.getStarCount().equals("3")){ %>
		<div class="starRev">
			<span class="starR on">별1</span> 
			<span class="starR on">별2</span> 
			<span class="starR on">별3</span>
			<span class="starR">별4</span> 
			<span class="starR">별5</span>
		</div>
		<%}else if (nDTO.getStarCount().equals("2")){ %>
		<div class="starRev">
			<span class="starR on">별1</span> 
			<span class="starR on">별2</span> 
			<span class="starR">별3</span>
			<span class="starR">별4</span> 
			<span class="starR">별5</span>
		</div>
		<%}else {%>
		<div class="starRev">
			<span class="starR on">별1</span> 
			<span class="starR">별2</span> 
			<span class="starR">별3</span>
			<span class="starR">별4</span> 
			<span class="starR">별5</span>
		</div>
		<%} %>
		
		</p>
		<hr class="reviewlist_hr">
		<!-- 본문 -->
		<div class="review_contents">
			<textarea name="content" class="review_write_contents"
				required="required" readonly="readonly"><%=nDTO.getContent()%></textarea>
		</div>
		<hr style="margin-top: 20px;" class="reviewlist_hr">
		<button class="list_button"
			onclick="location.href='/user/reviewList.do?Tour_no=<%=nDTO.getTour_no()%>'">
			리뷰 더보기 <i class="fas fa-list"></i>
		</button>

		<!-- 본인이 작성한 글 일 경우 수정 삭제 버튼 생성 -->
		<%
			if (nDTO.getUser_no().equals(ss_user_no)||authority.equals("0")) {
		%>
		<button class="reviewlist_button"
			onclick="location.href='/user/reviewModify.do?Review_no=<%=review_no%>'">
			수정 <i class="fas fa-pen"></i>
		</button>
		<button class="reviewlist_button"
			onclick="fn_review_delete()">
			삭제 <i class="fas fa-comment-slash"></i>
		</button>
		<%
			}
		%>

		<a href="javascript:window.history.back();"><button
				class="reviewlist_button">
				취소 <i class="fas fa-backspace"></i>
			</button></a>
			
		<script>
		function fn_review_delete(){
			let deleted = confirm("리뷰를 삭제 하시겠습니까?");
			if(deleted){
				location.href='/user/reviewDelete.do?Review_no=<%=review_no%>';
			}
		}
		</script>

	</div>

</body>
</html>

