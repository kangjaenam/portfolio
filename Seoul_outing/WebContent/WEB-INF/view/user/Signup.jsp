<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>회원가입</title>

    <!-- Icons font CSS-->
    <link href="/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="/css/sginup.css" rel="stylesheet" media="all">
    <!-- 아이콘 사용 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>

<body>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4"><a href="javascript:window.history.back();"><div class="sginup_icon"><i class="far fa-window-close"></i></div></a>
                <div class="card-body">
                    <h2 class="title">회원가입</h2>
                    <form action="/user/insertUserInfo.do" method="POST" onsubmit="return test()">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">사용할 닉네임</label>
                                    <input class="input--style-4" type="text" placeholder="Nickname to use" maxlength="16" name="nickname" id="inputNick" required="required">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">이메일</label>
                                    <input class="input--style-4" type="email" placeholder="Email" name="email" required="required">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">비밀번호</label>
                                    <input class="input--style-4" type="password" placeholder="Password (5자리이상)" maxlength="20" name="password" id="pwd" required="required">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">비밀번호 확인</label>
                                    <input class="input--style-4" type="password" placeholder="Password check" name="password2" id="reppwd" required="required">
                                </div>
                            </div>
                        </div>
                        
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">가입하기</button>
                        </div>
                             <div class="sginup_text">
                                이미 회원 이신가요 ? 
                                <a href="/user/loginForm.do" class="login_link">&nbsp; 로그인페이지로</a>
                               
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script>    
    							
    // 특수문자 정규식 변수(공백 미포함)
    var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
 
    // 완성형 아닌 한글 정규식
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;

    
    function test(){
    	var inputed = $("#inputNick").val();
    	var pwd = $("#pwd").val();
    	var reppwd = $("#reppwd").val();
    	var CheckForm = /^[a-z0-9]{3,16}$/;
    	if(inputed.length<3||inputed.length>16){
    		alert("3~16글자의 닉네임을 사용해 주세요.");
        	return false;
    	}
        if (replaceChar.test(inputed)) {
        	alert("특수문자는 사용하실수 없습니다.");
        	return false;
        }
        if (replaceNotFullKorean.test(inputed)) {
        	alert("완성되지 않은 한글은 입력하실 수 없습니다.");
        	return false;
        }
        if(pwd.length<5){
        	alert("5글자이상의 비밀번호를 사용해 주세요.");
        	return false;
        }
        if(pwd!=reppwd){
        	alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 확인해 주세요.");
        	return false;
        }
        
        return true;
    }
 
</script>

    <!-- Jquery JS-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="/vendor/select2/select2.min.js"></script>
    <script src="/vendor/datepicker/moment.min.js"></script>
    <script src="/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="/js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->