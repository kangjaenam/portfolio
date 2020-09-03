<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<!-- CSS들 -->
<script src="https://kit.fontawesome.com/c19714b4c0.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/sign_up.css">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css"
	rel="stylesheet" href="text/css">
</head>
<body>

	<div class="container login_div">
		<div id="login" class="signin-card">
			<div class="logo-image">
				<img src="/img/education.png" alt="logo" width="300px"
					height="300px" style="margin-left: 25px; margin-bottom: 30px;" />
			</div>
			<h1 class="display1"
				style="font-family: 'Hanna', serif; color: rgb(252, 252, 252);">회원가입</h1>

			<form action="/sign_up/insert_user.do" method="POST" role="form">
				<div id="form-login-username" class="form-group">
					<input class="form-control" name="email" type="email" size="18"
						placeholder="가입할 이메일" alt="가입할 이메일" required /> <span
						class="form-highlight"></span> <span class="form-bar"></span>

				</div>
				<div id="form-login-password" class="form-group">
					<input id="pw" class="form-control" name="password1"
						style="margin-bottom: 15px;" type="password" size="18"
						placeholder="비밀번호" alt="비밀번호" required onkeyup="return isSame();"> 
					<input
					id = "pwCheck"
						class="form-control" name="password2" type="password" size="18"
						placeholder="비밀번호 확인" alt="비밀번호 확인" required onkeyup="return isSame();">
					<div>
						<div id="same"></div>
					</div>
					<span class="form-highlight"></span> <span class="form-bar"></span>

				</div>




				<div>
					<button class="btn btn-block btn-info ripple-effect" type="submit"
						style="margin-top: 20px; margin-bottom: 5px;" name="Submit"
						alt="회원가입">
						회원가입 <i class="fas fa-user-plus"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript"> //비밀번호 일치여부 실시간 확인
	
			function isSame(){
				const pw = document.getElementById('pw').value;
				const pwCheck = document.getElementById('pwCheck').value;
					if(pw===pwCheck){
						document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
						document.getElementById('same').style.color='blue';
					}else{
						document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
						document.getElementById('same').style.color='red';
					}
				
			}
			/* if (pw.length < 6 || pw.length > 16){
				window.alert('비밀번호는 6자리 이상 16자리 이하만 사용 가능합니다.')
				document.getElementById('pw').value=document.getElementById('pwCheck').value='';
				document.getElementById('same').innerHTML='';
			} */
			</script>
</body>
</html>