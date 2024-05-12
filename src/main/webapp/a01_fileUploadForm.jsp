<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    
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
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#attachedFile").change(function() {
	    var selectedFile = $("[name=attachedFile]")[0].files;
		//console.log((selectedFile[0].name).substring(0,(selectedFile[0].name).indexOf(".")))
		
		$.ajax({
					url:"Z_DuplicationCheckId.jsp",
					data:"id="+(selectedFile[0].name).substring(0,(selectedFile[0].name).indexOf(".png")),
					type:"get",
					dataType:"json",
					success:function(rs)
					{
						if(rs.dupCheck)
							{
								alert("사용 가능한 파일명입니다.")
							}
						else
							{
								alert("사용 불가능한 파일명입니다.\n아이디(이메일)과 같게 설정하세요.")
							}
					},//success의 끝
					error:function(err)
					{
						console.log(err);
					}//error의 끝
				}) // ajax의 끝
	});
})


	
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>파일업로드</h2>
	</div>
	<div class="container">
		<form id="frm01" action="a02_upload.jsp" enctype="multipart/form-data" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			
				<input placeholder="파일업로드" type="file" name="attachedFile" id="attachedFile" class="form-control mr-sm-2" accept="image/png"/>

				<button class="btn btn-info" type="submit">업로드<%=session.getAttribute("idFromRegisterForm") %></button>
			</nav>
		</form>
	</div>
		
		
		
		
		
		
		
</body>



</html>