<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
 
<jsp:useBean id="gson" class="com.google.gson.Gson"/>  
<jsp:useBean id="dao" class="sslove.PSJ_Dao"/>
<jsp:useBean id="mem" class="z01_vo.MatchMember"/>
<jsp:setProperty property="*" name="mem"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

${gson.toJson(dao.matchMem(dao.getM1(id), new Member_opp(id,1,4,2)))}

<%--
{"insDept":
"${not empty dept.dname and dao.insertDept(dept)>0 ? 
   "등록성공":"등록실패"}"}
http://localhost:5080/backendweb/a09_ajax/z13_deptInsert.jsp?deptno=12&dname=재무&loc=부산   
   
 --%>   
<%--z13_deptInsert.jsp?deptno=12&dname=재무&loc=부산  --%>    