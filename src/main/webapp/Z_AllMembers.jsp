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

function detail(id_email)
{	
	$("#changeBtn").click();
	
	$.ajax({
		url:"Z_GetDetailInformation.jsp",
		data:"id_email="+id_email,
		dataType:"json",
		success:function(mem)
		{
			console.log(mem)
			$("#frm02 [name=name]").val(mem.name);
			$("#frm02 [name=phone]").val(mem.phone);
			$("#frm02 [name=id_email]").val(mem.id_email);
		},//success끝
		error:function(err)
		{
			console.log(err)
		}//error끝
	})//ajax끝
	
	$("#frm02 [name=name]").attr("readonly",true);
	$("#frm02 [name=phone]").attr("readonly",true);
	$("#frm02 [name=id_email]").attr("readonly",true);
}//function detail끝

	$(document).ready(function(){
		
			$.ajax({
				url:"Z_ShowMemberList.jsp",
				dataType:"json",
				success:function(data)
				{
					var memberHTML="";
					for(var idx=0;idx<data.length;idx++)
					{
						memberHTML +="<tr ondblclick='detail(\"" + data[idx].id_email + "\")'>";
						memberHTML +="<td>"+data[idx].name+"</td>";
						memberHTML +="<td>"+data[idx].phone+"</td>";
						memberHTML +="<td>"+data[idx].id_email+"</td>";
						memberHTML +="</tr>";
					}//for끝
					
					$("#deptList").html(memberHTML)
				}, //success끝
				error:function(err)
				{
					console.log(err)
				}//error끝
			})//ajax 끝
			
			
			
			
			
			$("#followBtn").click(function(){
				$.ajax({
					url:"Z_insertFollowerMemberAJAX.jsp",
					data:"myid_email="+'<%=(String)(session.getAttribute("sessionID"))%>'+"&followname="+$('#frm02 [name=id_email]').val(),
					dataType:"json",
					success:function(data){
						
					},
					error:function(err){
						console.log(err)
					}
				})
			})
			
			
			$("#blockBtn").click(function(){
				$.ajax({
					url:"Z_insertBlockMemberAJAX.jsp",
					data:"myid_email="+'<%=(String)(session.getAttribute("sessionID"))%>'+"&blockname="+$('#frm02 [name=id_email]').val(),
					dataType:"json",
					success:function(data){
						
					},
					error:function(err){
						console.log(err)
					}
				})
			})

			
	});//ready function 끝

</script>
</head>

<body>
<button type="button" data-toggle="modal" data-target="#exampleModalCenter" id="changeBtn"></button>
<div class="container">
   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">
    <thead>
      <tr class="table-success text-center">
        <th>이름</th>
        <th>전화번호</th>
        <th>아이디_이메일</th>
      </tr>
    </thead>	
    <tbody id="deptList">
    </tbody>
	</table>    
</div>

<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitle">회원 팔로우 / 회원 차단</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" name="name"/>
	      </div>
	     </div>
	     
	     <div class="row"> 
	      <div class="col">
	        <input type="text" class="form-control"  name="phone"/>
	      </div>
	     </div>
	     
	     <div class="row"> 
	      <div class="col">
	        <input type="text" class="form-control" name="id_email"/>
	      </div>
	      
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">

        <button type="button" id="followBtn" class="btn btn-info">팔로우하기</button>
        <button type="button" id="blockBtn" class="btn btn-danger">차단하기</button>
        <button type="button" id="clsBtn" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
</body>
</html>