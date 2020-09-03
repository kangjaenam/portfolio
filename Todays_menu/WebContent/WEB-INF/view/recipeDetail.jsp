<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.RecipeInfoDTO"%>
<%@page import="java.util.logging.Logger" %>
<%
	List<String> cooking_list = (List<String>)request.getAttribute("cooking_list"); //조리법
	List<String> img_list = (List<String>)request.getAttribute("img_list");	//조리 이미지
	int CSize = cooking_list.size();
	int ISize = img_list.size();
	RecipeInfoDTO rDTO = (RecipeInfoDTO)request.getAttribute("rDTO");	//제목 메인이미지 재료 시간 난이도 인분
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피 상세</title>
<!-- CSS들 -->
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet" href="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css" integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">

<style>
.body_div{
    padding-left: 150px;
    padding-right: 150px;
    padding-top: 30px;
    max-width: 100%;
    height: 100%;
}
#recipe_content{
	border: 3px solid #7BAEE8;
	text-align: center;
	width: 100%;
	margin-bottom: 50px;
	padding-bottom: 100px;
}
#recipe_name{
	border: 2px solid; 
	display: inline-block;
	border-radius: 5px; 
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 50px;
	padding-right: 50px;
	font-family: 'Hanna', serif;
	font-size: 30px;
	margin-top: 30px;
}
#recipe_main_img{
	margin-top: 200px;
	border: 6px solid #DCB850; 
	border-radius: 3px; 
	display: inline-block;
}
#recipe_info{
	border: 3px solid #D8B54C; 
	display: inline-block;
	padding: 13px;
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 40px;
	font-family: 'Hanna', serif;
	color: #6A675F;
}
#text_space{
	 border: 3px solid #D4CECE; 
	 margin-top: 3px;
	 display: inline-block;
	 width: 60%;
	 font-family: 'Hanna', serif;
	 font-size: 30px;
	 height: 130px ; 
	 vertical-align: middle;
	 padding-left: 20px;
	 padding-right: 20px;
	 padding-top: 5%;
}
#img_space{
	display: inline-block;
	vertical-align: middle;
}
#content_space{
	margin-top: 20px;
}
</style>
</head>
<body>
  <!-- home 아이콘 시작 -->
	<div id="logo">
		<a href="/index.do"><img src="/img/logo.jpg" alt="logo" width="260px" height="78px" /></a>
	</div>
    <!-- home 아이콘 끝 -->
<div class="body_div">

<!-- 레시피 전체 내용 -->
<div id="recipe_content">

<!-- 레시피 메인 이미지 -->
<div id="recipe_main_img">
<img src="<%=rDTO.getRecipe_main_img()%>">
</div>
<br>
<!-- 레시피 제목 -->
<div id="recipe_name">
<%=rDTO.getRecipe_name() %> 
</div>
<br>
<!-- 시간 난이도 인분 -->
<div id="recipe_info">
<i class="far fa-hourglass"></i>&nbsp;
<%=rDTO.getRecipe_time() %>&nbsp;&nbsp;&nbsp;
<i class="fas fa-user-friends"></i>&nbsp; 
<%=rDTO.getRecipe_personnel() %>&nbsp;&nbsp;&nbsp;
<i class="fas fa-splotch"></i>&nbsp;
<%=rDTO.getRecipe_step() %>
</div>

<div><img src="/img/recommend.png" style="width: 100px; height: 100px;"></div>

<!-- 조리법과 조리사진 -->
<div>
<%
if(CSize==ISize){
	for(int i = 0; i<CSize; i++){%>
<div id="content_space">
	<%if(CmmUtil.nvl(cooking_list.get(i))!=""){ %>
	<div id="text_space">
		<%=cooking_list.get(i)%>
	</div>
	<%} %>
	<div id="img_space">
		<img src="<%=img_list.get(i) %>" onerror="this.style.display='none'" alt=''  width="200px" height="200px">
	</div>
</div>	
	<%}
}else if(CSize > ISize){
	for(int i = 0; i>CSize; i++){%>
<div id="content_space">
	<%if(CmmUtil.nvl(cooking_list.get(i))!=""){ %>
	<div id="text_space">
		<%=cooking_list.get(i)%>
	</div>
	<%} %>
	<div id="img_space">
		<img src="<%=img_list.get(i) %>" onerror="this.style.display='none'" alt=''  width="200px" height="200px">
	</div>
</div>	
	<%}
}else{
	for(int i = 0; i>ISize; i++){%>
<div id="content_space">
	<%if(CmmUtil.nvl(cooking_list.get(i))!=""){ %>
	<div id="text_space">
		<%=cooking_list.get(i)%>
	</div>
	<%} %>
	<div id="img_space">
		<img src="<%=img_list.get(i) %>" onerror="this.style.display='none'" alt=''  width="200px" height="200px">
	</div>
</div>	
	<%}
}%>
</div>


</div>

</div>
</body>
</html>