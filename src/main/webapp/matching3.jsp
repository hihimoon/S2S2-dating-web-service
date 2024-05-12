<%@page import="sslove.PreparedStmtDao"%>
<%@page import="sslove.PSJ_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="z01_vo.*"
    import="d01_dao.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>S2S2 &mdash; 쌍용은 사랑을 싣고</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montez" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/sj.css">


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	

<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>

<%
PSJ_Dao dao = new PSJ_Dao();
PreparedStmtDao dao2 = new PreparedStmtDao();
String id = (String)session.getAttribute("sessionID");
System.out.print("mat3:"+id);
//List<MatchMember> mlist = dao.matchMem(dao.getM1("null"), new Member_opp(id,25,4,2));


List<MatchMember> mlist = dao.matchMem(dao.getM1("super"), new Member_opp(id,10,4,2));
if (id !=null){
	mlist = dao.matchMem(dao.getM1(id), new Member_opp(id,10,4,2));
}
%>

<script type="text/javascript">
	$(document).ready(function(){
		$("form").on("keypress",function(e){
			if(e.keyCode==13){
				e.preventDefault() 
			}
		})
	});

</script>
</head>

	<body>

		<div id="fh5co-guest">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center heading-section">
						<h2>추천 회원</h2>
					</div>
				</div>
				<div id="memList" class="row row-bottom-padded-lg">
				<%
				if (id != null){
				for(MatchMember m : mlist){
				%>
					<div class="col-md-3 text-center animate-box">
						<div class="groom-men">
							<img src="Uploads/<%=m.getId_email()%>.png" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
							<h3><%=dao2.chkName(m.getId_email())%></h3>
							<h3><%=m.getAge()%>세</h3>
							<h3><%=dao.getM1(m.getId_email()).getLoc()%></h3>
						</div>
					</div>				
				<%
				}}
				%>

			</div>
		</div>

	<script>
	var loginb = document.getElementById("login_btn")
	
	</script>
	
	<script src="dist/scripts.min.js"></script>
	</body>
</html>