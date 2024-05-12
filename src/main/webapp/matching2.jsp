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

<script type="text/javascript">
	$(document).ready(function(){
		$("form").on("keypress",function(e){
			if(e.keyCode==13){
				e.preventDefault() 
			}
		})
	});
	function reg(){
		if(confirm("등록하시겠습니까?")){
			//alert( $("#frm01").serialize() )
			$.ajax({
				url:"z/z_matching_ins2.jsp",
				data:$("#frm01").serialize(),
				dataType:"json",
				success:function(rs){
					// {"insDept": ${dao.insertDept(dept)}}
					var rcnt = rs.insDept
					if(rcnt>0){
						alert("등록 성공")
						location.href="matching3.jsp"
						//$("#frm01")[0].reset()					
					}else{
						alert("등록 실패")
					}
					
				},
				error:function(err){
					console.log(err)
				}
			})	
		}
	}
</script>
</head>
	<body>
	    <!-- Header Section Begin -->
		<jsp:include page="menubar.jsp"></jsp:include>
    	<!-- Header Section End -->

		<div id="fh5co-when-where" class="fh5co-section-gray">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h2>원하는 이상형의 정보를 입력하세요</h2>
					</div>
				</div>
				<form action="" id="frm01">
				<input id="id_hidden" type="hidden" name="id_email" value="no">
				<div class="row row-bottom-padded-md roww">
					<div class="col-md-6 text-center animate-box ma">
						<div class="wedding-events">
							<div class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>이상형의 나이대를 선택해주세요</h3>
								<fieldset>
								  <label>
								    <input type="radio" name="age_opp" value="5"/>
								    <span>연하(5살이내)</span>
								  </label>						
								  <label>
								    <input type="radio" name="age_opp" value="-5" />
								    <span>연상(5살이내)</span>
								  </label>							
								  <label>
								    <input type="radio" name="age_opp" value="10" />
								    <span>연하(10살이내)</span>
								  </label>							
								  <label>
								    <input type="radio" name="age_opp" value="-10" />
								    <span>연상(10살이내)</span>
								  </label>							
								  <label>
								    <input type="radio" name="age_opp" value="-99" />
								    <span>상관없다</span>
								  </label>							
								</fieldset>
								<button type="button" onclick="location.href='#height_opp'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="height_opp" class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>이상형의 키를 선택하세요</h3>
								<fieldset>
								  <label>
								    <input type="radio" name="height_opp" value="1" />
								    <span>140cm 이하</span>
								  </label>						
								  <label>
								    <input type="radio" name="height_opp" value="2" />
								    <span>140cm~150cm</span>
								  </label>							
								  <label>
								    <input type="radio" name="height_opp" value="3" />
								    <span>150cm~160cm</span>
								  </label>							
								  <label>
								    <input type="radio" name="height_opp" value="4" />
								    <span>160cm~170cm</span>
								  </label>							
								  <label>
								    <input type="radio" name="height_opp" value="5" />
								    <span>170~180cm</span>
								  </label>							
								  <label>
								    <input type="radio" name="height_opp" value="6" />
								    <span>180cm 이상</span>
								  </label>							
								</fieldset>
								<button type="button" onclick="location.href='#sal_opp'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="sal_opp" class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>상대방의 원하는 연봉을 선택하세요</h3>
								<fieldset>
								  <label>
								    <input type="radio" name="sal_opp" value="1" />
								    <span>3000~4000만원</span>
								  </label>						
								  <label>
								    <input type="radio" name="sal_opp" value="2" />
								    <span>4000~6000만원</span>
								  </label>							
								  <label>
								    <input type="radio" name="sal_opp" value="3" />
								    <span>6000만원 이상</span>
								  </label>							
								  <label>
								    <input type="radio" name="sal_opp" value="4" />
								    <span>상관없다</span>
								  </label>							
						
								</fieldset>
								<button type="button"  onclick="reg()" class="btn btn-primary btn-block">제출</button>			
							</div>
						</div>						
					</form>	
					</div>
				</div>
			
			</div>
		</div>
	<script>
	<%
	
	String id = (String)session.getAttribute("sessionID");
	System.out.print(id);
	%>
	var id = "<%=id%>"
	document.getElementById("id_hidden").value = id;
	if (id == null){
		alert("로그인해야합니다!")
		location.href="index.jsp"
	}
	
	</script>
	
	<script src="dist/scripts.min.js"></script>
	</body>
</html>