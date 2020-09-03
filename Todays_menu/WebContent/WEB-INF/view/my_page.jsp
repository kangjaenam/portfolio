<%@page import="poly.util.EncryptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserInfoDTO"%>
<%
	List<UserInfoDTO> uList = (List<UserInfoDTO>)request.getAttribute("uList");
   String email = CmmUtil.nvl((String)session.getAttribute("SS_EMAIL"));
   String authority = CmmUtil.nvl((String)session.getAttribute("SS_AUTHORITY"));
   String dec_email = EncryptUtil.decAES128CBC(email);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘은 뭐먹지?</title>

    <!-- CSS들 -->
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/my_page.css">
	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet" href="text/css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>
    
    <!-- home 아이콘 시작 -->
	<div id="logo">
		<a href="/index.do"><img src="/img/logo.jpg" alt="logo" width="260px" height="78px" /></a>
	</div>
	<!-- home 아이콘 끝 -->
	
	<!-- body밑 padding들어간 div 전체 내용 포함 부분 시작 -->
	<div class="body_div">
	
	<!-- 마이페이지 로그아웃 버튼 시작 -->

	<button type="button" onclick="parent.location.href='/logout.do'"
		class="btn btn-warning"
		style="float: right; font-family: 'Hanna', serif;">로그아웃</button>
		
		
	 <button type="button" onclick="parent.location.href='/my_mune.do'"
		class="btn btn-primary"
		style="margin-right: 8px; float: right; font-family: 'Hanna', serif;">나의 냉장고</button>

	<!-- 마이페이지 로그아웃 버튼 끝 -->


	<%if(dec_email.equals("nymjae@naver.com")) {
		
		/* 관리자 페이지 */
		for(int i = 0; i < uList.size(); i++){%>
			<div style="margin-bottom: 5px;"> 
			회원번호 : <%=uList.get(i).getUser_seq_no() %>
			이메일 : <%=EncryptUtil.decAES128CBC(uList.get(i).getUser_email())%>
				  <% if(uList.get(i).getUser_author().equals("0")){%>
					  <button>관리자</button>  </div>
				 <% }else{%>
				  <button onclick="location.href='/userDelete.do?user_no=<%=uList.get(i).getUser_seq_no() %>'">유저삭제</button>  </div>
					  <%}%>
				  
			  	   
		<%}
		
		
	}else{%>
		
		<div style="text-align: center; margin-top: 15%;">
            <button type="button" data-toggle="modal" data-target="#emailModal" 
            style="font-family: 'Hanna', serif; margin-right: 5%; font-size: 30px;" class="btn btn-info">이메일 수정</button>


            <button type="button" data-toggle="modal" data-target="#passwordModal" 
            style="font-family: 'Hanna', serif; font-size: 30px;" class="btn btn-info">비밀번호 수정</button>
        </div>
	
    </div>
    <!-- body밑 padding들어간 div 전체 내용 포함 부분 끝 -->
    
<!-- 이메일수정 Modal -->
<div class="modal fade" id="emailModal" tabindex="-1" role="dialog"
	data-backdrop="static" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document" style="width: 400px;">
		<div class="modal-content"
			style="background-color: rgb(106, 181, 224); border-radius: 10px">
			<div style="width: 100%; text-align: right; padding: 10px;">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" style="font-size: 40px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<!-- container -->

				<div class="logo-image" style="text-align: center;">
					<img src="/img/email.png" alt="logo" width="300px"
						height="300px" />
				</div>
				<h1 class="display1"
					style="font-family: 'Hanna', serif; color: rgb(252, 252, 252);">이메일 수정</h1>

				<form action="/emailModify.do" method="POST" role="form">
					<div id="form-login-username" class="form-group">
						 <span class="form-highlight"></span> <span class="form-bar"></span>

					</div>
					<div id="form-login-password" class="form-group">
					<div style="width: 366px; background-color: rgb(149, 209, 228); border-radius: 7px; text-align: center; margin: auto;
					font-family: 'Hanna', serif; margin-bottom: 7px; padding: 2px; font-size: 20px"><%=dec_email %></div>
						<input class="form-control" name="email" type="email"
							size="18" placeholder="수정할 이메일" alt="" required> <span
							class="form-highlight"></span> <span class="form-bar"></span>

					</div>

					<!-- 수정하기 버튼 시작 -->
					<div>
						<button class="btn btn-block btn-info ripple-effect" type="submit"
							style="margin-top: 20px; margin-bottom: 5px; font-family: 'Hanna', serif; font-size: 20px;"
							name="Submit" alt="수정하기">
							수정하기 <i class="fas fa-edit"></i></i>
						</button>
						

					</div>
					<!-- 수정하기 버튼 끝 -->
				</form>

			</div>

		</div>
	</div>
</div>

<!-- 비밀번호 수정 Modal -->
<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog"
	data-backdrop="static" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document" style="width: 400px;">
		<div class="modal-content"
			style="background-color: #eebe65; border-radius: 10px">
			<div style="width: 100%; text-align: right; padding: 10px;">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" style="font-size: 40px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<!-- container -->

				
				<div class="logo-image">
					<img src="/img/password.png" alt="logo" width="300px"
						height="300px" style="margin-left: 25px; margin-bottom: 30px;" />
				</div>
				<h1 class="display1"
					style="font-family: 'Hanna', serif; color: rgb(252, 252, 252);">비밀번호 수정</h1>

				<form action="/passwordModify.do" method="POST" role="form">
					<div id="form-login-username" class="form-group">
						<span class="form-highlight"></span> <span class="form-bar"></span>
					</div>
					<div id="form-login-password" class="form-group">
						<input id="pw" class="form-control" name="password1"
							style="margin-bottom: 15px;" type="password" size="18"
							placeholder="비밀번호" alt="비밀번호" required onkeyup="return isSame();">
						<input id="pwCheck" class="form-control" name="password2"
							type="password" size="18" placeholder="비밀번호 확인" alt="비밀번호 확인"
							required onkeyup="return isSame();">
						<div>
							<div id="same"></div>
						</div>
						<span class="form-highlight"></span> <span class="form-bar"></span>

					</div>

					<div>
						<button class="btn btn-block btn-info ripple-effect" type="submit" onclick="return number_length()"
							style="font-family: 'Hanna', serif; font-size: 20px; margin-top: 20px; margin-bottom: 5px;"
							name="Submit" alt="회원가입">
							수정하기 <i class="fas fa-edit"></i>
						</button>
					</div>
				</form>
				
				<script type="text/javascript">

					//비밀번호 일치여부 실시간 확인
					function isSame() {
						const pw = document.getElementById('pw').value;
						const pwCheck = document.getElementById('pwCheck').value;
						if (pw === pwCheck) {
							document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
							document.getElementById('same').style.color = 'blue';
						} else {
							document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
							document.getElementById('same').style.color = 'red';
						}

					}
					
				//비밀번호 자릿수 검사
				function number_length(){
				const pw = document.getElementById('pw').value;	
				const pwCheck = document.getElementById('pwCheck').value;
					if (pw.length < 6 || pw.length > 16){
				window.alert('비밀번호는 6자리 이상 16자리 이하만 사용 가능합니다.')
				document.getElementById('pw').value=document.getElementById('pwCheck').value='';
				document.getElementById('same').innerHTML='';
					}
					if(pw!=pwCheck){
						window.alert('비밀번호를 다시 확인해주세요.')
						return false;
					}
				}
				</script>


			</div>

		</div>
	</div>
</div>
		
	<%}%>
	
		

        
    
</body>
</html>