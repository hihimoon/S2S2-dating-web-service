<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<jsp:useBean id="dao" class="sslove.PSJ_Dao"/>
<jsp:useBean id="mem" class="z01_vo.Member_info"/>
<jsp:setProperty property="*" name="mem"/>

{"insDept": ${dao.insMemInfo(mem)}}

<%--
{"insDept":
"${not empty dept.dname and dao.insertDept(dept)>0 ? 
   "등록성공":"등록실패"}"}
http://localhost:5080/backendweb/a09_ajax/z13_deptInsert.jsp?deptno=12&dname=재무&loc=부산   
   
 --%>   
<%--z13_deptInsert.jsp?deptno=12&dname=재무&loc=부산  --%>    