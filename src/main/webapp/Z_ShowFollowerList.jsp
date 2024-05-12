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
<title></title>
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
<%
String id_email=(String)(session.getAttribute("sessionID"));
%>
<script type="text/javascript">
var id_email="<%=id_email%>"

	$(document).ready(function(){
		$.ajax({
			url:"Z_FollowerAJAX.jsp",
			data:"id_email="+id_email,
			dataType:"json",
			success:function(data){
				var followerHTML="";
				console.log(data)
				for(var idx=0;idx<data.length;idx++){
					followerHTML+="<tr>";
					followerHTML+="<td>"+data[idx]+"<td>"			
					followerHTML+="</tr>"	
				}
				console.log(followerHTML)
				$("tbody").html(followerHTML)
			},
			error:function(err){
				console.log(err)
			}
		})
		
		
		
		
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
  <h2>팔로우 한 아이디</h2>
</div>
<div class="container">
	
   <table class="table table-hover table-striped">
   	<col width="100%">

    <thead>

    </thead>	
    <tbody>

    </tbody>
	</table>    
    
</div>

</body>
</html>