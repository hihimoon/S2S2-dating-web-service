<%@page import="sslove.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="z01_vo.*"
	import="d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>S2S2 &mdash; 커뮤니티</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />


<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montez"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

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
<link rel="stylesheet" href="css/hi.css">


<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	
</script>



</head>
<%
String title = request.getParameter("title");
if (title == null)
	title = "";
%>
<%-- <jsp:useBean id="dao" class="sslove.CommunityDao" />
	<jsp:useBean id="comm" class="z01_vo.Community" />
	<jsp:setProperty property="*" name="comm" />
	<jsp:setProperty property="id_email" name="comm" value="<%=id%>" /> --%>

<%
CommunityDao dao = new CommunityDao();
request.setAttribute("communityList", dao.getCommunitytListBySearch(new Community(title)));
%>
<body>

	<!-- Search Section Begin -->
	<div class="row">
		<section class="hero comm_list">
			<div class="hero__search__form ">
				<form action="${path}/comm_list.jsp" id="frm01">

					<!-- <div class="filter__sort">

										<select class="nice-select" name="category">
											<option value="">전체검색</option>
											<option value="제목">제목</option>
											<option value="닉네임">닉네임</option>
										</select>

									</div>
 -->
					<input type="text" placeholder="검색어를 입력해주세요" name="title"
						value="${param.title}">
					<button type="submit" class="btn btn-primary" id="schBtn">검색</button>


				</form>
			</div>
			<button type="button" class="btn btn-outline-primary"
				onclick="location.href='comm_write.jsp'">글 작성하기</button>



		</section>
	</div>
	<!-- Search Section End -->
	
