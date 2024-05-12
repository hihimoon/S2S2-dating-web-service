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

<div id="fh5co-guest">
	<div class="container">
		<div class="row animate-box">
			<div class="col-md-8 col-md-offset-2 text-center heading-section">
				<h2>하트 구매</h2>
			</div>
		</div>
		<div class="row row-bottom-padded-lg">
			<div class="col-md-3 text-center animate-box">
				<div class="groom-men">
					<img src="images/heart1.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<h3>하트 ×1</h3>
					<button type="button" class="btn btn-primary btn-block"
					 data-toggle="modal" data-target="#exampleModalCenter">￦50</button>
				</div>
			</div>
			<div class="col-md-3 text-center animate-box">
				<div class="groom-men">
					<img src="images/heart2.png" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<h3>하트 ×10</h3>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='Payment.jsp'">￦500</button>
				</div>
			</div>
			<div class="col-md-3 text-center animate-box">
				<div class="groom-men">
					<img src="images/heart3.jpg" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<h3>하트 ×100</h3>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='Payment.jsp'">￦5,000</button>
				</div>
			</div>
			<div class="col-md-3 text-center animate-box">
				<div class="groom-men">
					<img src="images/heart4.png" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<h3>하트 ×1000</h3>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='Payment.jsp'">￦50,000</button>
				</div>
			</div>
		</div>
		<div class="row animate-box">
			<div class="col-md-8 col-md-offset-2 text-center heading-section">
				<h2>정기 이용권 구매</h2>
			</div>
		</div>
		<div class="row row-bottom-padded-lg">
			<div class="col-md-3 text-center animate-box">
				<div class="groom-men">
					<img src="images/utilize1.PNG" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<h3>1개월 이용권</h3>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='Payment.jsp'">￦50,000</button>
				</div>
			</div>
			<div class="col-md-3 text-center animate-box">
				<div class="groom-men">
					<img src="images/utilize2.PNG" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<h3>3개월 이용권</h3>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='Payment.jsp'">￦120,000</button>
				</div>
			</div>
			<div class="col-md-3 text-center animate-box">
				<div class="groom-men">
					<img src="images/utilize3.PNG" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<h3>6개월 이용권</h3>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='Payment.jsp'">￦200,000</button>
				</div>
			</div>
			<div class="col-md-3 text-center animate-box">
				<div class="groom-men">
					<img src="images/utilize4.PNG" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<h3>1년 이용권</h3>
					<button type="button" class="btn btn-primary btn-block" onclick="location.href='Payment.jsp'">￦360,000</button>
				</div>
			</div>
		</div>
	</div>
</div>


<div id="fh5co-started" style="background-image:url(images/cover_bg_2.jpg);" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
	<div class="container">
		<div class="row animate-box">
			<div class="col-md-8 col-md-offset-2 text-center heading-section">
				<h2>Are You Attending?</h2>
				<p>Please Fill-up the form to notify you that you're attending. Thanks.
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
						<button type="submit" class="btn btn-primary btn-block">I am Attending</button>
					</div>
				</form>
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
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	         <label class="form-label">교육감</label>
	         <div class="form-check">
	             <input type="radio" class="form-check-input" name="choice2" value="카드결제" id="kimJurip">
	             <label class="form-check-label" for="kimJurip">김주립</label>
	         </div>
	         <div class="form-check">
	             <input type="radio" class="form-check-input" name="choice2" value="강정책" id="kangJungChak">
	             <label class="form-check-label" for="kangJungChak">강정책</label>
	         </div>
	         <div class="form-check">
	             <input type="radio" class="form-check-input" name="choice2" value="송세라" id="songSera">
	             <label class="form-check-label" for="songSera">송세라</label>
	         </div>
	         <div class="form-check">
	             <input type="radio" class="form-check-input" name="choice2" value="이슬기" id="leeSeulGi">
	             <label class="form-check-label" for="leeSeulGi">이슬기</label>
	         </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	<script src="dist/scripts.min.js"></script>
</body>
</html>