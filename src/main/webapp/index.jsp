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


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	

<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
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
	    <!-- Header Section Begin -->
		<jsp:include page="menubar.jsp"></jsp:include>
    	<!-- Header Section End -->
    	
		<div id="fh5co-wrapper">
		<div id="fh5co-page">
	
		<div class="fh5co-hero" data-section="home">
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
		</div>

		<jsp:include page="matching3.jsp"></jsp:include>
		<!-- 추천 회원 섹션 -->

		
		<div id="fh5co-couple" class="fh5co-section-gray">
			<div class="container">
				<div class="row row-bottom-padded-md animate-box">
					<div class="col-md-6 col-md-offset-3 text-center">
						<div class="col-md-5 col-sm-5 col-xs-5 nopadding">
							<img src="images/groom.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
							<h3>홍길동</h3>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-2 nopadding"><h2 class="amp-center"><i class="icon-heart"></i></h2></div>
						<div class="col-md-5 col-sm-5 col-xs-5 nopadding">
							<img src="images/bride.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
							<h3>신길동</h3>
						</div>
					</div>
					<h2>S2S2에서 처음만나 몇년째 행복하게 살고있어요~</h2>
				</div>
				<div class="row row-bottom-padded-md animate-box">
					<div class="col-md-6 col-md-offset-3 text-center">
						<div class="col-md-5 col-sm-5 col-xs-5 nopadding">
							<img src="images/groom.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
							<h3>동길동</h3>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-2 nopadding"><h2 class="amp-center"><i class="icon-heart"></i></h2></div>
						<div class="col-md-5 col-sm-5 col-xs-5 nopadding">
							<img src="images/bride.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
							<h3>서길동</h3>
						</div>
					</div>
					<h2>S2S2에서 처음만나 몇년째 행복하게 살고있어요~</h2>
				</div>
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2">
						<div class="col-md-12 text-center heading-section">
							<h2>Are Getting Married</h2>
							<p><strong>on Dec 28, 2017 &mdash; Boracay, Philippines</strong></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="fh5co-countdown">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center animate-box">
					<h1>오늘 맺어진 커플 수</h1>
					<p> 			
						<span class="font1" >20 <small class="맺sm">오늘</small></span>
						<span class="font1" >156 <small class="맺sm">이번달</small></span>
						<span class="font1" >8500 <small class="맺sm">올해</small></span>
						<span class="font1" >19457 <small class="맺sm">전체</small></span>
					</p>	
				</div>
			</div>
		</div>

		<div id="fh5co-started" style="background-image:url(images/cover_bg_2.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center heading-section">
						<h2>S2S2에서만 가능한 인연</h2>
						<p>수십가지의 다양한 질문</p>
						<p>내 이상형에 부합하는 회원 추천</p>
						<p>원하는 상대와 1:1 채팅 및 데이팅 플랜 안내서비스지원</p>
						<p>S2S2에서 지금바로 시작해보세요
					</div>
				</div>
				<div class="row animate-box">
					<div class="col-md-10 col-md-offset-1">
						<form class="form-inline">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label for="name" class="sr-only">Name</label>
									<input type="name" class="form-control" id="name" placeholder="Name">
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label for="email" class="sr-only">Email</label>
									<input type="email" class="form-control" id="email" placeholder="Email">
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<button type="submit" class="btn btn-primary btn-block">시작 하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
				<!-- end:header-top -->
		<div id="fh5co-gallery">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h2>S2S2에서 맺어진 소중한 인연들</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="gallery animate-box">
							<a class="gallery-img image-popup image-popup" href="images/gallery-1.jpg"><img src="images/gallery-1.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
						</div>
						<div class="gallery animate-box">
							<a class="gallery-img image-popup" href="images/gallery-7.jpg"><img src="images/gallery-7.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="gallery animate-box">
							<a class="gallery-img image-popup" href="images/gallery-6.jpg"><img src="images/gallery-6.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
						</div>
						<div class="gallery animate-box">
							<a class="gallery-img image-popup" href="images/gallery-2.jpg"><img src="images/gallery-2.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
						</div>
						<div class="gallery animate-box">
							<a class="gallery-img image-popup" href="images/gallery-5.jpg"><img src="images/gallery-5.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="gallery animate-box">
							<a class="gallery-img image-popup" href="images/gallery-3.jpg"><img src="images/gallery-3.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
						</div>
						<div class="gallery animate-box">
							<a class="gallery-img image-popup" href="images/gallery-4.jpg"><img src="images/gallery-4.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
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
								<a href="#"><i class="icon-twitter2"></i></a>
								<a href="#"><i class="icon-facebook2"></i></a>
								<a href="#"><i class="icon-instagram"></i></a>
								<a href="#"><i class="icon-dribbble2"></i></a>
								<a href="#"><i class="icon-youtube"></i></a>
							</p>
							<p>Copyright 2016 Free Html5 <a href="#">Module</a>. All Rights Reserved. <br>Made with <i class="icon-heart3"></i> by <a href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> / Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a></p>
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