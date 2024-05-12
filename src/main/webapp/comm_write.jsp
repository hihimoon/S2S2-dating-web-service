<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="z01_vo.*"
	import="d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%

%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>S2S2 &mdash; 커뮤니티 등록</title>
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


</head>
<body>
	<%
	String id = (String) session.getAttribute("sessionID");
	%>
	<jsp:useBean id="dao" class="sslove.CommunityDao"/>
	<jsp:useBean id="comm" class="z01_vo.Community" />
	<jsp:setProperty property="*" name="comm" />
	<jsp:setProperty property="id_email" name="comm" value="${sessionID}" />
	<c:if test="${not empty comm.title}">
		<script>
			var regCnt = "${dao.insCommunity(comm)}";
			if (regCnt === "0") {
				console.log("등록실패");
			} else if (regCnt !== "0" && confirm("등록성공\n계속 등록하시겠습니까?")) {
				location.href = "comm_write.jsp";
			} else {
				location.href = "comm_list.jsp";
			}
		</script>
	</c:if>
	<!-- Header Section Begin -->
	<jsp:include page="menubar.jsp"></jsp:include>

	<!-- Header Section End -->
	<section class="main spad">
		<div class="container">
			<div class="checkout__form comm">
				<h2 class=title>게시글 등록하기</h2>
				<form method="post">
					<!-- <div class="checkout__file">
						<p>
							상품 이미지 등록<span></span>
						</p>
						<input type="file" id="myFile" name="productimage">
					</div> -->

					<div class="checkout__input">
						<p>
							제목<span>*</span>
						</p>

						<input type="text" class="form-control" placeholder="제목을 입력해 주세요"
							name="title" maxlength="50" required>
					</div>


					<div class="checkout__input">
						<p>
							내용 입력<span>*</span>
						</p>
						<textarea rows="50" cols="50" class="form-control"
							placeholder="상세내용을 입력해주세요" maxlength="4000" class="formStyle"
							name="ccontent" required></textarea>
					</div>

					<div id="fh5co-started">
						<input type="submit" class="btn btn-primary btn-block"
							value="등록하기"></input>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script>
		
	</script>
</body>

</html>
