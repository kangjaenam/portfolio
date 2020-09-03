<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <!-- CSS들 -->
    <script src="https://kit.fontawesome.com/c19714b4c0.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/login.css">
	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet" href="text/css">

</head>

<body>

    <div class="container login_div">
        <div id="login" class="signin-card">
          <div class="logo-image">
            <img src="/img/refrigerator.png" alt="logo" width="300px" height="300px" style="margin-left:15px; margin-bottom: 30px;"/>
          </div>
          <h1 class="display1" style="font-family: 'Hanna', serif; color: rgb(252, 252, 252);">로그인</h1>
         
          <form action="/login/ckeck.do" method="POST" role="form">
            <div id="form-login-username" class="form-group">
              <input class="form-control" name="email" type="email" size="18" placeholder="가입한 이메일" alt="가입된 이메일" required />
              <span class="form-highlight"></span>
              <span class="form-bar"></span>
             
            </div>
            <div id="form-login-password" class="form-group">
              <input class="form-control" name="password" type="password" size="18" placeholder="비밀번호" alt="비밀번호" required>
              <span class="form-highlight"></span>
              <span class="form-bar"></span>
             
            </div>
            
            <!-- 로그인 버튼과 비밀번호찾기 회원가입 링크 시작 -->
            <div>
              <button class="btn btn-block btn-info ripple-effect" type="submit" style="margin-top: 20px; margin-bottom: 5px;" name="Submit" alt="로그인">로그인 <i class="fas fa-sign-in-alt"></i></button>
         
               <a href="#" style="margin-left: 170px;">회원가입</a>
            </div>
            <!-- 로그인 버튼과 비밀번호찾기 회원가입 링크 끝 -->
            </div>
          </form>
        </div>
        




</body>
</html>