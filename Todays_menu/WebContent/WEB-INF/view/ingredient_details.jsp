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
	<link rel="stylesheet" href="/css/ingredient_details.css">
	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet" href="text/css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
<body>
    
    <!-- home 아이콘 시작 -->
	<div id="logo">
		<a href="/index.do"><img src="img/logo.jpg" alt="logo" width="260px" height="78px" /></a>
	</div>
	<!-- home 아이콘 끝 -->


    <div class="body_div">

    <!-- 재료 검색창 시작 -->
			<div class="search_display" style="margin-bottom: 60px; text-align: center;">
			<form action="/recipe/ingredient_select.do">
				<span class='green_window'>
					<input type='text' class='input_text' value="" id="jg" name="ingredient" placeholder="재료 검색..  재료 구분은  ,(콤마)로 해주세요." />
				</span>
				<button type='submit' class='sch_smit'>검색</button>
			</form>
			</div>
    <!-- 재료 검색창 끝 -->
    
    <!-- 재료아이콘들 -->
    <div style="text-align: center; margin-top: 150px;">
    <a id="pt" style="cursor: pointer;"><img src="img/potato.png"  alt="감자" style="width: 300px; height: 300px"></a>
    <a id="cr" style="cursor: pointer;"><img src="img/carrot.png" alt="당근" style="width: 300px; height: 300px"></a>
    <a id="oi" style="cursor: pointer;"><img src="img/onion.png" alt="양파" style="width: 300px; height: 300px"></a>
    <a id="ms" style="cursor: pointer;"><img src="img/mushroom.png" alt="버섯" style="width: 300px; height: 300px"></a>
	</div>
	
	<script type="text/javascript">
	let a = $('#jg').val();
	$('#pt').click(function(){
		a = $('#jg').val();
		if($('#jg').val()=="")
			a += "감자";
		else
			a += ",감자";
		$('#jg').val(a)
	});
	$('#cr').click(function(){
		a = $('#jg').val();
		if($('#jg').val()=="")
			a += "당근";
		else
			a += ",당근";
		$('#jg').val(a)
	});
	$('#oi').click(function(){
		a = $('#jg').val();
		if($('#jg').val()=="")
			a += "양파";
		else
			a += ",양파";
		$('#jg').val(a)
	});
	$('#ms').click(function(){
		a = $('#jg').val();
		if($('#jg').val()=="")
			a += "버섯";
		else
			a += ",버섯";
		$('#jg').val(a)
	});
	
	</script>
	
    </div>
</body>
</html>