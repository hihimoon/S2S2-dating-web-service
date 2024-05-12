<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="sslove.PreparedStmtDao"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>   
<%
String login_id=request.getParameter("login_id");
String login_pwd=request.getParameter("login_pwd");
if(login_id==null){login_id="";}
if(login_pwd==null){login_pwd="";}
PreparedStmtDao dao=new PreparedStmtDao();
if(!login_id.equals("")&&!login_pwd.equals(""))
{
	if(dao.login(login_id,login_pwd))
	{
		log("로그인 성공");	
		session.setAttribute("sessionID",login_id);	
		dao.setFinalLoginTime(login_id);
		response.sendRedirect("index.jsp");
	}
	else
	{
	log("로그인 실패");	
	}
}
%>  
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

		$("#loginBtn").click()

		$("[name=loginBtn]").click(function(){
			$("#frm02").submit();
		})

		
	});//document.ready의 끝
</script>
</head>

<body>
<div class="container">

	<form id="frm01" class="form"  method="post">

  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

	    <button class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter" id="loginBtn" type="button">로그인</button>

 	</nav>

	</form>

</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">로그인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="아이디 입력" name="login_id">
	      </div>
	      <div class="col">
	        <input type="password" class="form-control" placeholder="패스워드 입력" name="login_pwd">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" name="loginBtn" class="btn btn-primary">로그인</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>