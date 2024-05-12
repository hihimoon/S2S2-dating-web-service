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

	function deliverIdToDataTransfer(id)
	{
		window.open("Z_DataTransfer.jsp?idFromRegisterForm="+id);
	}

	$(document).ready(function(){
		$("#regFrmBtn").click()
		$("form").on("keypress",function(e){

			if(e.keyCode==13){ //enterkey의 keycode는 13이다.
				e.preventDefault() //enter키의 기본 동작을 중단 처리
			}

		}) // form.on keypress function 끝

		
		$("#frm02 [name=id_email]").keyup(function(){ //아이디 중복체크
			if(event.keyCode==13){
				$.ajax({
					url:"Z_DuplicationCheckId.jsp",
					data:"id="+$(this).val(),
					type:"get",
					dataType:"json",
					success:function(rs)
					{
						if(rs.dupCheck)
							{
								alert("이미 등록된 아이디 입니다.\n다른 아이디를 입력하세요.")
							}
						else
							{
								alert("사용 가능한 아이디입니다.")
								$("[name=ckid]").val("Y")
								$("#frm02 [name=id_email]").attr("readonly",true);
							}
					},//success의 끝
					error:function(err)
					{
						console.log(err);
					}//error의 끝
				}) // ajax의 끝
				
			}//if event.keyCode==13끝
		}) //keyup의 끝
		

	
		$("#regBtn").click(function(){ //회원정보 등록
			//alert($("#frm02").serialize())
			if($("[name=ckid]").val()!="Y")
			{
				alert("아이디 중복체크를 해주세요.\nEnter키를 눌러 중복검사를 수행하세요.")
				return;
			}//if val!=Y 의 끝
			else //else로 처리해보자
			{
				if(confirm("등록하시겠습니까?"))
					{
						$.ajax({
							url:"Z_RegisterFormAJAX.jsp",
							data:$("#frm02").serialize(),
							dataType:"json",
							type:"get",
							success:function(rs){
								var rcnt=rs.logSuc
								if(rcnt>0)
									{
										var deliverId=$("#frm02 [name=id_email]").val();
										alert("등록성공")
										$("#frm02")[0].reset()
										
										if(confirm("사진을 등록하시겠습니까?\n단,사진파일의 이름은 자신의 아이디로, 확장자는 .png로 해주세요."))
										{
											deliverIdToDataTransfer(deliverId)
											window.open("a01_fileUploadForm.jsp")
											
										}
									}
							}, //success 끝
							error:function(err){
								console.log(err)
							} //error 끝
						})
					}//if 등록하시겠습니까 의 끝
			}//else의 끝
			
		})//회원정보등록의 끝


	});//document.ready 끝


</script>



</head>



<body>



<div class="container">

	<form id="frm01" class="form"  method="post">

  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

	    <button class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter" 

	    id="regFrmBtn" type="button">회원가입</button>

 	</nav>

	</form>

</div>



<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">회원가입</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
		     <div class="col">
			     <input type="text" class="form-control" placeholder="이름" name="name">
			 </div>
	     </div>
	     <br>
	     <div class="row">			 
			 <div class="col">
			     <input type="password" class="form-control" placeholder="주민등록번호" name="residentnum">
		     </div>
	     </div>
	     <br>
	     <div class="row">			 
			 <div class="col">
			     <input type="text" class="form-control" placeholder="핸드폰번호" name="phone">
		     </div>
	     </div>
	     <br>
	     <div class="row">			 
			 <div class="col">
			     <input type="text" class="form-control" placeholder="아이디(이메일) Enter키를 눌러 중복검사를 수행하세요." 
			     name="id_email">
			   	 <input type="hidden" name="ckid" value="N"/>
		     </div>
	     </div>
	     <br>
	     <div class="row">			 
			 <div class="col">
			     <input type="password" class="form-control" placeholder="비밀번호" name="pwd">
		     </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button id="regBtn" type="button" class="btn btn-secondary" data-dismiss="modal">회원등록</button>
        <button id="clsBtn" type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>