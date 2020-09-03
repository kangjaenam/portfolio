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
	<link rel="stylesheet" href="/css/cooktime_details.css">
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
        
        <!-- 원하는 조리시간 선택 제목 부분 시작 -->
        <div class="text_center" style="margin-bottom: 70px;">
        <span class="cookTime_title">원하는 조리시간 선택</span>
        <img src="/img/cookTime.png" alt="조리시간별 레시피" style="transform:rotate(20deg);" width="70px" height="70px" />
        </div>
        <!-- 원하는 조리시간 선택 제목 부분 끝 -->

        <!-- 조리시간 선택지 시작 -->
        <div class="text_center">
            <a href="/recipe/cookTime_select.do?time=10"><div class="time_select_bg"><span class="time_select">10분 이내</span></div></a>
            <a href="/recipe/cookTime_select.do?time=20"><div class="time_select_bg"><span class="time_select">20분 이내</span></div></a>
            <a href="/recipe/cookTime_select.do?time=30"><div class="time_select_bg"><span class="time_select">30분 이내</span></div></a>
            <a href="/recipe/cookTime_select.do?time=60"><div class="time_select_bg"><span class="time_select">60분 이내</span></div></a>
            <a href="/recipe/cookTime_select.do?time=70"><div class="time_select_bg"><span class="time_select">60분 이상</span></div></a>
        </div>
        <!-- 조리시간 선택지 끝 -->

    </div>
    <!-- body밑 padding들어간 div 전체 내용 포함 부분 끝 -->
</body>
</html>