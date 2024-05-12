<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="z01_vo.*"
	import="d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>S2S2 &mdash; 쌍용은 사랑을 싣고</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

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
<link rel="stylesheet" href="css/admin.css">


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
	$(document).ready(function() {
		$("form").on("keypress", function(e) {
			if (e.keyCode == 13) {
				e.preventDefault()
			}
		})
	});
</script>
</head>

<body>
	<!-- Header Section Begin -->
	<jsp:include page="admin-menubar.jsp"></jsp:include>
	<!-- Header Section End -->

	<div id="fh5co-wrapper">
		<div id="fh5co-page">

			<!-- 	<div class="fh5co-hero" data-section="home">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style="background-image: url(images/cover_bg_1.jpg);">
				<div class="display-t">
					<div class="display-tc">
						<div class="container">
							<div class="col-md-10 col-md-offset-1">
								<div class="animate-box">
									<h1>S2S2</h1>
									<h2>쌍용은 사랑을 싣고</h2>
									<p><span>No.1</span></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->

			<!--  섹션 -->
			<div id="fh5co-guest">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section">
							<h2>Dash Board</h2>
							<!-- <div class="hero__search__form admin ">
								<form action="shop-grid.jsp">

									<label for="startDate">분석 기간:</label> <input type="date"
										id="startDate" placeholder="검색을 원하는 날짜를 입력해주세요"
										name="startDate" value=""> <span>~</span> <input
										type="date" id="endDate" placeholder="검색을 원하는 날짜를 입력해주세요"
										name="endDate" value="">
									<button type="submit" class="btn btn-primary">검색</button>
								</form>
							</div> -->


						</div>

					</div>


					<div class="col-xl-3 col-lg-3 col-md-12 col-12 mt-6">
						<!-- card -->
						<div class="card ">
							<!-- card body -->
							<div class="card-body">
								<!-- heading -->
								<div
									class="d-flex justify-content-between align-items-center
                    mb-3">
									<div>
										<h4 class="title">게시글수</h4>
									</div>
								</div>
								<!-- project number -->
								<div>
									<h1 class="fw-bold">8</h1>
									
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-12 col-12 mt-6">
						<!-- card -->
						<div class="card ">
							<!-- card body -->
							<div class="card-body">
								<!-- heading -->
								<div
									class="d-flex justify-content-between align-items-center
                    mb-3">
									<div>
										<h4 class="title">가입자 수</h4>
									</div>
								</div>
								<!-- project number -->
								<div>
									<h1 class="fw-bold">6</h1>
									
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-12 col-12 mt-6">
						<!-- card -->
						<div class="card ">
							<!-- card body -->
							<div class="card-body">
								<!-- heading -->
								<div
									class="d-flex justify-content-between align-items-center
                    mb-3">
									<div>
										<h4 class="title">남자 회원수</h4>
									</div>

								</div>
								<!-- project number -->
								<div>
									<h1 class="fw-bold">3</h1>
								
								</div>
							</div>
						</div>
					</div>


					<div class="col-xl-3 col-lg-3 col-md-12 col-12 mt-6">
						<!-- card -->
						<div class="card ">
							<!-- card body -->
							<div class="card-body">
								<!-- heading -->
								<div
									class="d-flex justify-content-between align-items-center
                    mb-3">
									<div>
										<h4 class="title">여자 회원수</h4>
									</div>

								</div>
								<!-- project number -->
								<div>
									<h1 class="fw-bold">3</h1>
									
								</div>
							</div>
						</div>
					</div>










				</div>
			</div>
		</div>
	</div>

	<footer>
		<div id="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h2>S2S2</h2>
					</div>
					<div class="col-md-6 col-md-offset-3 text-center">
						<p class="fh5co-social-icons">
							<a href="#"><i class="icon-twitter2"></i></a> <a href="#"><i
								class="icon-facebook2"></i></a> <a href="#"><i
								class="icon-instagram"></i></a> <a href="#"><i
								class="icon-dribbble2"></i></a> <a href="#"><i
								class="icon-youtube"></i></a>
						</p>
						<p>
							Copyright 2016 Free Html5 <a href="#">Module</a>. All Rights
							Reserved. <br>Made with <i class="icon-heart3"></i> by <a
								href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> /
							Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>



	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	<!-- Google Map 
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	-->
	<!-- jQuery -->
	<script src="dist/scripts.min.js"></script>
</body>
</html>