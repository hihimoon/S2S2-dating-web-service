<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.File" 
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    
    %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>   
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>   

<!DOCTYPE html>
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
		
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>파일업로드결과</h2>
<%
String saveDirectory = "C:/b01_javaexp/workspace/S2S2/src/main/webapp/Uploads/";//폴더를 프로젝트에 알맞게 생성하고, 우클릭해서 properties선택하고 경로 복사해서 붙여넣어야 한다.
System.out.println("업로드 경로");
System.out.println(saveDirectory);
int maxPostSize = 1024 * 100000; /* 1MB */
String encoding = "UTF-8";
String fileName = "";
try {
	fileName = (String)session.getAttribute("idFromRegisterForm");
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding); // Uploads폴더에 업로드수행하는 코드
	
	
	//fileName = mr.getFilesystemName("attachedFile");
	File oldFile = new File(saveDirectory + File.separator + fileName);
} catch (Exception e) {
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일 업로드 오류");
}
%>

	<%=fileName%>업로드<br>
	<img src="${path}/Uploads/" width="300" height="200"/>
	<script>
	document.querySelector("img").src="${path}/Uploads/"+"<%=fileName%>"+".png"	
	</script>
	</div>

</body>
</html>