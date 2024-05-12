<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*" import="z01_vo.*"
   import="d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>S2S2 &mdash; 커뮤니티 상세</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
   content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montez"
   rel="stylesheet">
<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
   rel='stylesheet' type='text/css'>

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
<link rel="stylesheet" href="css/hi.css">


<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->


<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<jsp:useBean id="dao" class="sslove.CommunityDao" />
<%
String communitynoStr = (String)request.getParameter("communityno");
if (communitynoStr == null)
   communitynoStr = "0";
int communityno = Integer.parseInt(communitynoStr);
%>

<%
String id = (String) session.getAttribute("sessionID");
%>
<%
session.setAttribute("communityList", dao.getCommunity(communityno));
%>
<script>
var sendUserID = "<%=id%>"
var getUserID = "${communityList.id_email}";
</script>

<script type="text/javascript">
   $(document).ready(function() {
      $("form").on("keypress", function(e) {
         if (e.keyCode == 13) {
            e.preventDefault()
         }
      })
      
   $("#chatBtn").click(function(){
      $.ajax({
         url:"z/z_chatRoom_insert.jsp",
         data: {"sendUserID": sendUserID,
                "getUserID" : getUserID},
         dataType:"json",
         success:function(rs){
            var rcnt = rs.insChatRooms
            if(rcnt>0){
               alert("채팅방을 생성합니다.")
               goChat(sendUserID)
            }else{
               alert("채팅방 생성 실패")
            }
         },
         error:function(err){
            console.log(err)
         }
      })
   }) 
      
   });

   function reg() {
      if (confirm("신고하시겠습니까?")) {
         /* alert( $("#frm02").serialize() ) */
         $.ajax({
            url : "z/z_report_insert.jsp",
            data : $("#frm02").serialize(),
            dataType : "json",
            success : function(rs) {
               //{"insReport": ${dao.insReport(report)}}
               var rcnt = rs.insReport
               if (rcnt > 0) {
                  alert("신고완료")

                  location.href = "details.jsp?communityno="+<%=communityno%>;

                  //$("#frm01")[0].reset()               
               } else {
                  alert("신고실패")
               }

            },
            error : function(err) {
               console.log(err)
            }
         })
      }
   }
   
function goChat(id){
   location.href="chat.jsp?sendUserID=" + id;
}
</script>
</head>

<body>
   <!-- Header Section Begin -->
   <jsp:include page="menubar.jsp"></jsp:include>


   <!-- Header Section End -->


   <!-- Comm Details Section Begin -->

   <section class="comm-details spad">
      <div class="container">
         <!-- <div class="row">
            <div class="col-lg-6 col-md-6">
               <div class="product__details__pic">
                  <div class="product__details__pic__item">
                     <img class="product__details__pic__item--large"
                        src="" alt="">
                  </div>

               </div>
            </div> -->
         <!-- <div class="col-lg-6 col-md-6"> -->
         <div class="comm__details__text">
            <h2 class="title">${communityList.title}</h2>
            <span class="report" data-toggle="modal"
               data-target="#exampleModalCenter">신고하기</span>
            <span style="color: #616161; display: inline-block;">${communityList.name}(서울,
               31살)</span> <span style="color: #616161;">&nbsp; &nbsp;·&nbsp;
               &nbsp; 작성일:${communityList.writtendate} </span>



            <!-- <ul class="profile-list">
                     <li><img class="profile_pic" alt=""
                     > <b><span></span></b>
                        <span style="color: #6f6f6f"></span></li>
                  </ul>
 -->


         </div>
         <div class="comm-content">
            <p>${communityList.ccontent}</p>

         </div>
         <button type="button" class="btn btn-outline-primary"
            onclick="location.href='comm_list.jsp'">목록으로</button>
         <button type="button" class="btn btn-primary" id="chatBtn" onclick="">채팅하기</button>
      </div>
      <div class="modal fade" id="exampleModalCenter" tabindex="-1"
         role="dialog" aria-labelledby="exampleModalCenterTitle"
         aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle">신고하기</h5>
                
               </div>

               <div class="modal-body">
                  <div class="modal-text">
                     <p>작성자 : ${communityList.name}</p>
                     <p>내용 : ${communityList.title}</p>
                  </div>



                  <form id="frm02" action="">
                     <div class="row">
                        <label class="form-label">사유선택</label>
                        <div class="form-check">
                           <input id="victimid_hidden" type="hidden" name="victimid"
                              value="${sessionID}"> <input id="offenderid_hidden"
                              type="hidden" name="offenderid"
                              value="${communityList.id_email}"> <input
                              id="communityno_hidden" type="hidden" name="communityno"
                              value="${communityList.communityno}"> <input
                              type="radio" class="form-check-input" name="reportreason"
                              value="스팸/홍보" id="Spam/promotion"> <label
                              class="form-check-label" for="Spam/promotion">스팸/홍보
                              도배글입니다.</label>
                        </div>
                        <div class="form-check">
                           <input type="radio" class="form-check-input"
                              name="reportreason" value="음란물" id="Pornography"> <label
                              class="form-check-label" for="Pornography">음란물입니다.</label>
                        </div>
                        <div class="form-check">
                           <input type="radio" class="form-check-input"
                              name="reportreason" value="욕설/혐오표현" id="Profanity/hatespeech">
                           <label class="form-check-label" for="Profanity/hatespeech">욕설/혐오
                              표현입니다.</label>
                        </div>
                        <div class="form-check">
                           <input type="radio" class="form-check-input"
                              name="reportreason" value="불쾌한표현" id="Offensivelanguage">
                           <label class="form-check-label" for="Offensivelanguage">불쾌한
                              표현이 있습니다.</label>
                        </div>
                     </div>
                  </form>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary"
                     data-dismiss="modal">닫기</button>
                  <button type="button" onclick="reg()" class="btn btn-primary">신고하기</button>
               </div>
            </div>
         </div>
      </div>
   </section>



   <!-- Footer Section Begin -->
   <footer>
      <div id="footer">
         <div class="container">
            <div class="row">
               <div class="col-md-12 text-center">
                  <h2>S2S2</h2>
               </div>
               <div class="col-md-6 col-md-offset-3 text-center">
                  <p class="fh5co-social-icons">
                     <a href="#"><i class="icon-twitter2"></i></a> <a href="#"><i
                        class="icon-facebook2"></i></a> <a href="#"><i
                        class="icon-instagram"></i></a> <a href="#"><i
                        class="icon-dribbble2"></i></a> <a href="#"><i
                        class="icon-youtube"></i></a>
                  </p>
                  <p>
                     Copyright 2016 Free Html5 <a href="#">Module</a>. All Rights
                     Reserved. <br>Made with <i class="icon-heart3"></i> by <a
                        href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> /
                     Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </footer>
<script>


</script>



   <script src="dist/scripts.min.js"></script>
</body>
</html>