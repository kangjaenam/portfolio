<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.RecipeInfoDTO"%>
<%@page import="java.util.logging.Logger" %>
<%
	List<RecipeInfoDTO> rList = (List<RecipeInfoDTO>) request.getAttribute("rList");	//레시피메인이미지
	List<RecipeInfoDTO> r2List = (List<RecipeInfoDTO>) request.getAttribute("r2List");	//레시피제목
	List<RecipeInfoDTO> r3List = (List<RecipeInfoDTO>) request.getAttribute("r3List");	//레시피아이디
	int random = (int)request.getAttribute("random");
	//int PgNum = (int)request.getAttribute("PgNum");
	//int total = (int)request.getAttribute("total");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘은 뭐먹지?</title>

    <!-- CSS들 -->
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/popular_details.css">
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
    
    <!-- 인기레시피 추천수별 또는 조회수별 선택 박스 시작 -->
   <!--  <div class="box">
            <select>
                <option style="font-family: 'Hanna', serif;">조회수별</option>
                <option style="font-family: 'Hanna', serif;">추천수별</option>
            </select>
    </div> -->
    <!-- 인기레시피 추천수별 또는 조회수별 선택 박스 끝 -->
    
    <!-- body밑 padding들어간 div 전체 내용 포함 부분 시작 -->
	<div class="body_div" style="margin: 0 auto;">

	<!-- 인기 레시피 리스트  -->
		<div class="divTable">
			<%!
			private Logger log = Logger.getLogger(this.getClass().getName());
			%>
			<%
			int j = random + 12;
				for (int i=random; i < j; i++) {
					log.info("레시피 메인 이미지 주소 : " + rList.get(i));
			%>
			<div class="divTableBody">
					<div class="divTableCell">
						<a href="/recipe/recipeDetail.do?Recipe_id=<%=r3List.get(i)%>&recipe_main_img=<%=rList.get(i)%>&recipe_name=<%=r2List.get(i)%>"><img src="<%=rList.get(i)%>"></a>
					</div>
					<div class="divTableCell">
						<a id="list_link" href="/recipe/recipeDetail.do?Recipe_id=<%=r3List.get(i)%>&recipe_main_img=<%=rList.get(i)%>&recipe_name=<%=r2List.get(i)%>"><%=r2List.get(i)%></a>
					</div>		
			</div>
			<%
				}
			%>
		</div>


    </div>
    <!-- body밑 padding들어간 div 전체 내용 포함 부분 끝 -->
</body>
</html>