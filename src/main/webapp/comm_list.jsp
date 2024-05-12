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
<body>

	<%
	String id = (String) session.getAttribute("sessionID");
	String title= (String)request.getParameter("title");
	/* if (title == null)
		title = "";  */
	%>
	<jsp:useBean id="dao" class="sslove.CommunityDao" />
	<%-- <jsp:useBean id="comm" class="z01_vo.Community" />
	<jsp:setProperty property="*" name="comm" />
 	<jsp:setProperty property="id_email" name="comm" value="<%=id%>" />  --%>
	
	<% 
	/* CommunityDao dao = new CommunityDao(); */
	session.setAttribute("communityList", dao.getCommunitytListBySearch(new Community(title)));
	%>
	
	
	
<%-- 
	<%
	request.setAttribute("communityList", dao.getCommunitytListBySearch(new Community(name, title)));
	%> --%>
	<%-- <h2>${sessionID}</h2> --%>
	<%-- <h3><%=id%></h3> --%>



	<!-- Header Section Begin -->
	<jsp:include page="menubar.jsp"></jsp:include>


	<div id="fh5co-wrapper">
		<div id="fh5co-page">

			<div id="fh5co-blog-section" class="fh5co-section-gray">
				<div class="container">
					<!-- <div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section">
							<h2>맞춤추천</h2>
						</div>
					</div>

					<div class="row row-bottom-padded-md">
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_1.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="details.jsp">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_2.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="#">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix visible-sm-block"></div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_3.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="#">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix visible-lg-block visible-md-block"></div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_1.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="#">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix visible-sm-block"></div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_2.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="#">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_3.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="#">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
 -->

					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section">
							<h2>최신글</h2>
						</div>
					</div>
					<!-- Search Section Begin -->
					<jsp:include page="searchbar.jsp"></jsp:include>
					
					<!-- Search Section End -->
					<div class="row row-bottom-padded-md">
						  <c:forEach var="community" items="${communityList}">
							<div class="col-lg-4 col-md-4 col-sm-6">
								<div class="fh5co-blog animate-box">
									<a href="#"><img class="img-responsive"
										src="images/cover_bg_1.jpg" alt=""></a>
									<div class="blog-text">
										<div class="prod-title">
											<h3>
												<a href="${path}/details.jsp?communityno=${community.communityno}">${community.title}</a>
											</h3>
											<span class="by">작성자: ${community.name}</span>
											<p class="posted_date">${community.writtendate}</p><!--  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span> -->

											<p>
												<a href="${path}/details.jsp?communityno=${community.communityno}">자세히 보기...</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- <div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_2.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="#">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div> -->
						<!-- <div class="clearfix visible-sm-block"></div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_3.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="#">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix visible-lg-block visible-md-block"></div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_1.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="#">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix visible-sm-block"></div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_2.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="#">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="fh5co-blog animate-box">
								<a href="#"><img class="img-responsive"
									src="images/cover_bg_3.jpg" alt=""></a>
								<div class="blog-text">
									<div class="prod-title">
										<h3>
											<a href="#">백엔드 개발자 31살이에요!</a>
										</h3>
										<span class="by">김개발</span> <span class="by">31살</span> <span
											class="by">서울 </span>
										<sapn class="posted_date">2023-12-14</span>  <span class="comment"><a href="">21<i
												class="icon-bubble2"></i></a></span>

										<p>
											<a href="details.jsp">자세히 보기...</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>


 -->





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
	<script src="dist/scripts.min.js"></script>
</body>
</html>






<%-- 	<!-- Header Section End -->
	<section class="main spad">


		<div class="container">




			<h4 class=title>맞춤추천</h4>


			<table class="table table-hover table-striped">
				<col width="20%">
				<col width="26%">
				<col width="13%">
				<col width="13%">
				<col width="13%">
				<col width="15%">
				<thead>

					<tr class="table-success text-center">
						<th>프로필 이미지</th>
						<th>제목</th>
						<th>작성자</th>
						<th>지역</th>
						<th>나이</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td>백엔드 개발자 31살이에요!</td>
						<td>김개발</td>
						<td>서울</td>
						<td>31살</td>
						<td>2023-12-14</td>
					</tr>
					<tr>
						<td></td>
						<td>저랑놀아요</td>
						<td>박쌍용</td>
						<td>서울</td>
						<td>25살</td>
						<td>2023-12-15</td>
					</tr>
					<tr>
						<td></td>
						<td>유후~ 오늘 노실분?</td>
						<td>김선비</td>
						<td>성남</td>
						<td>30살</td>
						<td>2023-12-20</td>
					</tr>
				</tbody>
			</table>





			<div class="hero__search">
				<div class="hero__search__form">
					<form action="">

						<div class="filter__sort">

							<select name="category">
								<option>제목</option>
								<option>작성자</option>
								<option>지역</option>
								<option>나이</option>
								<option>작성일자</option>
							</select>

						</div>


				


						<input type="text" placeholder="검색어를 입력해주세요" name="title">
						<div id="fh5co-started">
							<button type="submit" class="btn btn-primary btn-block">검색</button>
						</div>
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="검색어를 입력해주세요" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">검색</button>
						</form>
				</div>
			</div>




			<h4 class=title>최신글</h4>


			<table class="table table-hover table-striped">
				<col width="20%">
				<col width="26%">
				<col width="13%">
				<col width="13%">
				<col width="13%">
				<col width="15%">
				<thead>

					<tr class="table-success text-center">
						<th>프로필 이미지</th>
						<th>제목</th>
						<th>작성자</th>
						<th>지역</th>
						<th>나이</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td>백엔드 개발자 31살이에요!</td>
						<td>김개발</td>
						<td>서울</td>
						<td>31살</td>
						<td>2023-12-14</td>
					</tr>
					<tr>
						<td></td>
						<td>저랑놀아요</td>
						<td>박쌍용</td>
						<td>서울</td>
						<td>25살</td>
						<td>2023-12-15</td>
					</tr>
					<tr>
						<td></td>
						<td>유후~ 오늘 노실분?</td>
						<td>김선비</td>
						<td>성남</td>
						<td>30살</td>
						<td>2023-12-20</td>
					</tr>
				</tbody>
			</table>
 
			


		</div>
		</div>
	</section>
	--%>
<!-- </body>

</html>
 -->