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
		
		$("form").on("keypress",function(e){
			if(e.keyCode==13){ //enterkey의 keycode는 13이다.
				e.preventDefault() //enter키의 기본 동작을 중단 처리
			}
		})

	});
	

</script>
</head>

<body>
<div class="jumbotron text-center">
  
  <h1>마이페이지</h1>
  <hr>
  <a href="Z_AllMembers.jsp">전체 회원 리스트</a>
  <hr>
  <a href="Z_ShowFollowerList.jsp">팔로우한 회원</a>
  <hr>
  <a href="Z_ShowBlockList.jsp">차단한 회원</a>
  <hr>
  <a href="Z_BulletinBoard.jsp">내가 쓴 글</a>
  <hr>
  
</div>


</body>
</html>