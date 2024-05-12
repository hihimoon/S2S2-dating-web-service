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
				url:"z/z_matching_ins1.jsp",
				data:$("#frm01").serialize(),
				dataType:"json",
				success:function(rs){
					// {"insDept": ${dao.insertDept(dept)}}
					var rcnt = rs.insDept
					if(rcnt>0){
						alert("등록 성공")
						location.href="matching2.jsp"
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
						<h2>매칭에 필요한 기본정보를 수집합니다</h2>
					</div>
				</div>
				<form action="" id="frm01">
				<div class="row row-bottom-padded-md roww">
					<div class="col-md-6 text-center animate-box ma">
						<div class="wedding-events">
							<div class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>성별을 선택해주세요</h3>
								<fieldset>
								  <label>
								    <input type="radio" name="gender" value="M" />
								    <span>남성</span>
								  </label>
								
								  <label>
								    <input type="radio" name="gender" value="F" />
								    <span>여성</span>
								  </label>							
								</fieldset>
								<button type="button" onclick="location.href='#age'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="age" class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>나이를 입력해주세요</h3>
								<fieldset>
									<input id="id_hidden" type="hidden" name="id_email" value="no">
															
									<input name="age" type="text" class="form-control" placeholder="25">					
								</fieldset>
								<button type="button" onclick="location.href='#loc'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="loc" class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>지역을 입력해주세요 (예: 서울, 경기, 부산)</h3>
								<fieldset>								
									<input type="text" class="form-control" name="loc" placeholder="서울">					
								</fieldset>
								<button type="button"  onclick="location.href='#height'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="height"class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>신장을 입력해주세요 </h3>
								<fieldset>								
									<input type="text" class="form-control" name="height" placeholder="160cm">					
								</fieldset>
								<button type="button" onclick="location.href='#education'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="education" class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>학력을 선택해주세요</h3>
								<fieldset>
								  <label>
								    <input type="radio" name="education" value="고졸" />
								    <span>고졸</span>
								  </label>		
								  <label>
								    <input type="radio" name="education" value="대졸" />
								    <span>대졸</span>
								  </label>							
								  <label>
								    <input type="radio" name="education" value="대학원" />
								    <span>대학원</span>
								  </label>							
								</fieldset>
								<button type="button"  onclick="location.href='#job'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="job"class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>직업을 입력해주세요 </h3>
								<fieldset>								
									<input type="text" class="form-control" name="job" placeholder="공무원">					
								</fieldset>
								<button type="button"  onclick="location.href='#sal'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="sal"class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>연봉을 입력해주세요</h3>
								<fieldset>								
									<input type="text" class="form-control" name="sal" placeholder="연봉">					
								</fieldset>
								<button type="button"  onclick="location.href='#drink'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="drink"class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>술은 얼마나 드시나요?</h3>
								<fieldset>
								  <label>
								    <input type="radio" name="drink" value="no" />
								    <span>안 마심</span>
								  </label>		
								  <label>
								    <input type="radio" name="drink" value="1" />
								    <span>소주 1병</span>
								  </label>							
								  <label>
								    <input type="radio" name="drink" value="2" />
								    <span>소주 2병</span>
								  </label>							
								  <label>
								    <input type="radio" name="drink" value="3" />
								    <span>소주 3병이상</span>
								  </label>							
								</fieldset>
								<button type="button"  onclick="location.href='#smoke'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="smoke"class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>흡연 여부</h3>
								<fieldset>
								  <label>
								    <input type="radio" name="smoke" value="no" />
								    <span>안 함</span>
								  </label>		
								  <label>
								    <input type="radio" name="smoke" value="1" />
								    <span>흡연</span>
								  </label>												
								</fieldset>
								<button type="button"  onclick="location.href='#mbti'" class="btn btn-primary btn-block">다음 항목</button>			
							</div>
						</div>
						<div class="wedding-events 위">
							<div id="mbti"class="ceremony-bg" style="background-image: url(images/wed-ceremony.jpg);"></div>
							<div class="desc">
								<h3>MBTI를 골라주세요</h3>
								<fieldset>
								  <h4>에너지방향</h4>
								  <label>
								    <input type="radio" name="mbti1" value="E" />
								    <span>E(외향)</span>
								  </label>		
								  <label>
								    <input type="radio" name="mbti1" value="I" />
								    <span>I(내향)</span>
								  </label>												
								</fieldset>
								<fieldset>
								  <h4>인식 방식</h4>
								  <label>
								    <input type="radio" name="mbti2" value="S" />
								    <span>S(감각)</span>
								  </label>		
								  <label>
								    <input type="radio" name="mbti2" value="N" />
								    <span>N(직관)</span>
								  </label>												
								</fieldset>
								<fieldset>
								  <h4>판단 / 의사 결정</h4>
								  <label>
								    <input type="radio" name="mbti3" value="T" />
								    <span>T(사고)</span>
								  </label>		
								  <label>
								    <input type="radio" name="mbti3" value="F" />
								    <span>F(감정)</span>
								  </label>												
								</fieldset>
								<fieldset>
								  <h4>생활 양식 / 대처 방식</h4>
								  <label>
								    <input type="radio" name="mbti4" value="J" />
								    <span>J(판단)</span>
								  </label>		
								  <label>
								    <input type="radio" name="mbti4" value="P" />
								    <span>P(인식)</span>
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