<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.logging.Logger" %>
<%
	List<String> recipe_main_img_list = (List<String>) request.getAttribute("recipe_main_img_list");
	List<String> recipe_name_list = (List<String>) request.getAttribute("recipe_name_list");
	List<String> recipe_id_list = (List<String>) request.getAttribute("recipe_id_list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- CSS들 -->
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/recipeList.css">
    <link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet" href="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">

<style type="text/css">
  /* 리스트 */
.divTable{
	text-align: center;
	width: 100%;
}
.divTableHeading {
	background-color: #EEE;
}
.divTableCell, .divTableHead {
	text-align: center;
	padding: 3px 10px;
}
.divTableHeading {
	background-color: #EEE;
	font-weight: bold;
}
.divTableFoot {
	background-color: #EEE;
	font-weight: bold;
}
.divTableBody {
	border: 3px solid gold;
	border-radius: 25px; 
	padding: 5px;
	display: inline-block;
	margin-left: 4%;
	margin-right: 4%;
	margin-bottom: 5%;
}
#list_link{
	font-family: 'Hanna', serif !important;
	font-size: 18px !important;
	color: black;
	text-overflow:ellipsis;
	white-space:nowrap;
	word-wrap:normal;
	width:299px;
	overflow:hidden;
	display:block;
}
a{
    text-decoration: none !important;
}
a:hover {text-decoration: none;}
/*리스트 끝*/

</style>

</head>
<body>
	<!-- home 아이콘 시작 -->
	<div id="logo">
		<a href="/index.do"><img src="/img/logo.jpg" alt="logo" width="260px" height="78px" /></a>
	</div>
    <!-- home 아이콘 끝 -->

    <!-- body밑 padding들어간 div 전체 내용 포함 부분 시작 -->
	<div class="body_div" style="margin: 0 auto;">

	<!-- 레시피 리스트  -->
		<div class="divTable">
			<%!
			private Logger log = Logger.getLogger(this.getClass().getName());
			%>
			<%
				if(recipe_name_list==null||recipe_name_list.size()==0){ %>
					
					<div style="margin-top: 50px;"><img src="/img/notfound.jpg"></div>
					
				<%}else{
					if(recipe_name_list.size()<12){
						int j = recipe_name_list.size();
						for (int i = 0; i < j; i++) {
							%>
			<div class="divTableBody">
					<div class="divTableCell">
						<a href="/recipe/recipeDetail.do?Recipe_id=<%=recipe_id_list.get(i)%>&recipe_main_img=<%=recipe_main_img_list.get(i)%>&recipe_name=<%=recipe_name_list.get(i)%>"><img src="<%=recipe_main_img_list.get(i)%>"></a>
					</div>
					<div class="divTableCell">
						<a id="list_link" href="/recipe/recipeDetail.do?Recipe_id=<%=recipe_id_list.get(i)%>&recipe_main_img=<%=recipe_main_img_list.get(i)%>&recipe_name=<%=recipe_name_list.get(i)%>"><%=recipe_name_list.get(i)%></a>
					</div>		
			</div>							
							<%
						}
						
					}else{
						
				for (int i = 0; i < 12; i++) {
					log.info("레시피 제목 : " + recipe_name_list.get(i));
			%>
			<div class="divTableBody">
					<div class="divTableCell">
						<a href="/recipe/recipeDetail.do?Recipe_id=<%=recipe_id_list.get(i)%>&recipe_main_img=<%=recipe_main_img_list.get(i)%>&recipe_name=<%=recipe_name_list.get(i)%>"><img src="<%=recipe_main_img_list.get(i)%>"></a>
					</div>
					<div class="divTableCell">
						<a id="list_link" href="/recipe/recipeDetail.do?Recipe_id=<%=recipe_id_list.get(i)%>&recipe_main_img=<%=recipe_main_img_list.get(i)%>&recipe_name=<%=recipe_name_list.get(i)%>"><%=recipe_name_list.get(i)%></a>
					</div>		
			</div>
			<%
				}}}
			%>
		</div>

    </div>
    <!-- body밑 padding들어간 div 전체 내용 포함 부분 끝 -->


</body>
</html>