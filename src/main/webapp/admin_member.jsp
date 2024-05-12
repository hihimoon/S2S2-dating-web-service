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

<jsp:useBean id="dao" class="sslove.CommunityDao" />
<%
String victimid = (String) request.getParameter("victimid");
if (victimid == null)
	victimid = "";

String reportnoStr = (String) request.getParameter("reportno");

if (reportnoStr == null)
	reportnoStr = "0";
int reportno = Integer.parseInt(reportnoStr);

String resolutionstatus = (String) request.getParameter("resolutionstatus");

if (resolutionstatus == null)
	resolutionstatus = "";
session.setAttribute("reportList", dao.getReportListBySearch(new Report(victimid)));
session.setAttribute("reportList2", dao.getReport(reportno));
%>


<script type="text/javascript">
	$(document).ready(function() {
		$("form").on("keypress", function(e) {
			if (e.keyCode == 13) {
				e.preventDefault()
			}
		})
	});

	function mod() {
		if (confirm("수정하시겠습니까?")) {
			/* alert( $("#frm02").serialize() ) */
			$.ajax({
				url : "z/z_report_upt.jsp",
				data : $("#frm02").serialize(),
				dataType : "json",
				success : function(report) {
					//{"insReport": ${dao.insReport(report)}}
					if (report.uptReport > 0) {
						if (confirm("수정완료!\n창을 닫으시겠습니까?")) {
							$("#frm02")[0].reset()
							$("#clsBtn").click()
						}
					} else {
						alert("수정이 되지 않았습니다!")
					}

				},
				error : function(err) {
					console.log(err)
				}
			})
		}
	}
</script>
</head>

<body>
	<!-- Header Section Begin -->
	<jsp:include page="admin-menubar.jsp"></jsp:include>
	<!-- Header Section End -->

	<div id="fh5co-wrapper">
		<div id="fh5co-page">


			<!--  섹션 -->
			<div id="fh5co-guest">
				<div class="container admin_member">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section">
							<h2>신고리스트</h2>
							<div class="hero__search__form admin ">
								<form id="frm01" class="form" method="post">


									<input type="text" placeholder="아이디를 입력해주세요" name="victimid"
										value="${param.victimid}">
									<button type="submit" class="btn btn-primary">검색</button>



								</form>
							</div>


						</div>

					</div>



					<%-- <jsp:useBean id="report1" class="z01_vo.Report" />
					<jsp:setProperty name="report1" property="*" /> --%>

					<table class="table table-hover table-striped">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<col width="11%">
						<thead>

							<tr class="table-success text-center">
								<th>신고NO</th>
								<th>피해 유저 아이디</th>
								<th>피고 유저 아이디</th>
								<th>신고사유</th>
								<th>처리방법</th>
								<th>해결Y/N</th>
								<th>게시글NO</th>
								<th>신고일자</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="report" items="${reportList}">
								<tr class="text-center">
									<td>${report.reportno}</td>
									<td>${report.victimid}</td>
									<td>${report.offenderid}</td>
									<td>${report.reportreason}</td>
									<td>${report.handlingmethod}</td>
									<td>${report.resolutionstatus}</td>
									<td>${report.communityno}</td>
									<td>${report.reportdate}</td>

									<td><button class="btn btn-success" data-toggle="modal"
											data-target="#exampleModalCenter" type="button">수정하기</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br> <br> <br>
				</div>





			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">신고리스트 수정 및 삭제</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form id="frm02" class="form" method="post">
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" placeholder="reportno"
									name="reportno" value="${reportList2.reportno}"> <input
									type="text" class="form-control" placeholder="처리방법"
									name="handlingmethod">
									
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" placeholder="해결Y/N"
									name="resolutionstatus">

							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="clsBtn">닫기</button>
					<button type="button" onclick="mod()" class="btn btn-primary">수정하기</button>
					<button type="button" onclick="del()" class="btn btn-primary">삭제하기</button>
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