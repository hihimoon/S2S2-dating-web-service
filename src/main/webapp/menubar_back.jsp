<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="z01_vo.*"
    import="sslove.*"
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

	<script src="js/modernizr-2.6.2.min.js"></script>
	

<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
</head>
<%
PreparedStmtDao dao = new PreparedStmtDao();
String id = (String)session.getAttribute("sessionID");
System.out.print("메뉴바:"+id);
%>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">

		<header id="fh5co-header-section" class="sticky-banner">
			<div class="container">
				<div class="nav-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
					<img onclick="location.href='index.jsp'" src="images/logo_s2s2.png" class="img_sj" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"/>
			
					<h1 class="login_btn"><a id="login_btn" href="A_LoginForm.jsp">로그인</a></h1>
					<h3 class="login_btn" id="name_h">@@@</h3>
					<h4 class="login_btn" id="heart">##</h4>
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li class="active"><a href="index.jsp" >Home</a></li>
							<li><a href="chat.jsp">채팅</a></li>
							<li><a href="comm_list.jsp">커뮤니티</a></li>
							<li><a href="mypage.jsp">마이페이지</a></li>
							<li><a href="matching.jsp">매칭</a></li>
							<%
							if (id != null && "admin@naver.com".equals(id)){
							%>
							<li><a href="admin.jsp">Admin</a></li> 
							<%
							}
							%>
							<li><a href="A_RegisterForm.jsp">회원가입</a></li>		
						</ul>
					</nav>
					
										
				</div>
			</div>
		</header>

	</div>
	</div>

	</body>
	<script>
		var id = "<%=id%>"
		var name = "<%=dao.chkName(id)%>"
		var loginb = document.getElementById("login_btn")
		var nameb = document.getElementById("name_h")
		var heartb = document.getElementById("heart")
		if (id == "null"){
			id=""
			loginb.innerText = "로그인"
			loginb.href="./A_LoginForm.jsp"
			nameb.innerText =" "
			heartb.innerText = " "
		}
		else{
			loginb.innerText = "로그아웃"
			loginb.href="./Z_Logout.jsp"
			nameb.innerText = name+"님"
			heartb.innerText = "하트 수:"+<%=dao.getHearts(id)%>
		}
		
	</script>
</html>