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
<link rel="stylesheet" type="text/css" href="/styles/review_ write.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<%
	//CmmUtil 붙이기 수정
	String ss_nickname = CmmUtil.nvl((String) session.getAttribute("SS_NICKNAME"));
	String ss_user_no = CmmUtil.nvl((String) session.getAttribute("SS_USER_NO"));
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	//현재시간
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Date time = new Date();
	String nowtime = format.format(time);
%>


</head>
<body background="/images/login.jpg">
	<!-- 리뷰 전체 div -->
	<div class="review_detail_all">
		<form action="/user/completedReview.do" method="post">
			<!-- 리뷰 제목 날짜 -->
			<h3>
				<input type="text" class="review_write_title" name="title" required="required"
					placeholder="제목을 입력해주세요." maxlength="50" >
			</h3>
			<small><%=nowtime%></small>
			<hr class="reviewlist_hr">
			<!-- 어느 리뷰인지와 작성자ID -->
			<p>
				<span class="review_type"><%=nDTO.getTitle()%> >> </span>작성자 :
				<%=ss_nickname%>

				<input type="hidden" name="user_no" value="<%=ss_user_no%>">
				<input type="hidden" name="tour_no" value="<%=nDTO.getTour_no()%>">

			<!-- 별점 -->
			<div class="starRev">
				<span id="star1" class="starR on">별1</span> 
				<span id="star2" class="starR">별2</span> 
				<span id="star3" class="starR">별3</span>
				<span id="star4" class="starR">별4</span>
				<span id="star5" class="starR">별5</span>
			</div>
			
			<!-- 별점을 숫자로 변환 -->
			<input type="hidden" id="starCount" name="starCount" value="1">		

			</p>
			<hr class="reviewlist_hr">
			<!-- 본문 -->
			<div class="review_contents">
				<textarea name="content" class="review_write_contents" maxlength="800"
					placeholder="여기에 내용을 입력해주세요." required="required"></textarea>
			</div>
			<hr style="margin-top: 20px;" class="reviewlist_hr">
			<button class="reviewlist_button" type="submit">
				완료 <i class="fas fa-edit"></i>
			</button>
			<a href="/user/reviewList.do?Tour_no=<%=nDTO.getTour_no()%>"><button type="button"
					class="reviewlist_button">
					취소 <i class="fas fa-comment-slash"></i>
				</button></a>
		</form>
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
	<script>
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			if($("#star5").hasClass("on")===true){
				$("#starCount").val('5');
			}else if($("#star4").hasClass("on")===true){
				$("#starCount").val('4');
			}else if($("#star3").hasClass("on")===true){
				$("#starCount").val('3');
			}else if($("#star2").hasClass("on")===true){
				$("#starCount").val('2');
			}else if($("#star1").hasClass("on")===true){
				$("#starCount").val('1');
			}
			return false;
		});
	</script>

</body>
</html>
