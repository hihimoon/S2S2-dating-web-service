<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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

	function search(){
		
		$.ajax({
			url:"Z_BulletinBoardSHOWAJAX.jsp",
			data:$("#frm01").serialize(),
			type:"get",
			dataType:"json",
			success:function(data){
				console.log(data)
				//나중에 시간되면 ondblclick으로 content까지 보이게 해보자.
				var dataHTTP="";
				for(var idx=0;idx<data.length;idx++){
					dataHTTP+="<tr>";
					dataHTTP+="<td>"+data[idx].writer+"</td>";
					dataHTTP+="<td>"+data[idx].title+"</td>";
					dataHTTP+="<td>"+data[idx].writtentime+"</td>";
					dataHTTP+="</tr>";
				}
				$("tbody").html(dataHTTP)
			},
			error:function(err){
				console.log(err);
			}
		})
	}

	$(document).ready(function(){

		$("#schBtn").click(function(){
			search();
		})
		
		$("#frm01 [name=writer]").keyup(function(){
			search()
		})
		$("#frm01 [name=title]").keyup(function(){
			search()
		})

		search();
		
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
  <h2>게시글 목록</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="writer" class="form-control mr-sm-2" placeholder="작성자 id_email" value="${empty sessionID?'':sessionID}" /> <%--value="<%=(String)(session.getAttribute("sessionID"))%>" --%>
	    <input name="title" class="form-control mr-sm-2" placeholder="제목" />
	    <button id="schBtn" class="btn btn-info" type="button">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">

    <thead>
    
      <tr class="table-success text-center">
        <th>작성자</th>
        <th>제목</th>
        <th>작성일</th>
      </tr>
    </thead>	
    <tbody>

    </tbody>
	</table>    
    
</div>

</body>
</html>