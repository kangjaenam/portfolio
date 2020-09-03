
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘은 뭐먹지?</title>

    <!-- CSS들 -->
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/step_details.css">
	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet" href="text/css">
</head>
<body>
    <!-- home 아이콘 시작 -->
	<div id="logo">
		<a href="/index.do"><img src="/img/logo.jpg" alt="logo" width="260px" height="78px" /></a>
	</div>
	<!-- home 아이콘 끝 -->
	
	<!-- body밑 padding들어간 div 전체 내용 포함 부분 시작 -->
	<div class="body_div">

        <!-- 원하는 난이도 선택 제목 부분 시작 -->
        <div class="text_center" style="margin-bottom: 70px; margin-top: 90px">
            <span class="step_title">원하는 난이도 선택</span>
            <img src="img/step.png" alt="인원수 레시피" width="80px" height="80px" style="margin-left: 15px; margin-top: -22px;" />
            </div>
            <!-- 원하는 인원수 선택 제목 부분 끝 -->
    
            <!-- 난이도 선택지 시작 -->
            <div class="text_center">
                <a href="/recipe/select_step.do?step=1"><div class="step_select_bg"><span class="step_select">쉬움</span></div></a>
                <a href="/recipe/select_step.do?step=2"><div class="step_select_bg"><span class="step_select">보통</span></div></a>
                <a href="/recipe/select_step.do?step=3"><div class="step_select_bg"><span class="step_select">어려움</span></div></a>
            </div>
            <!-- 난이도 선택지 끝 -->

    </div>
    <!-- body밑 padding들어간 div 전체 내용 포함 부분 끝 -->
</body>
</html>