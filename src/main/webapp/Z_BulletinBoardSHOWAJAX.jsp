<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<jsp:useBean id="gson" class="com.google.gson.Gson"/>
<jsp:useBean id="dao" class="sslove.PreparedStmtDao"/>
<jsp:useBean id="bullet" class="sslove.Bulletinboard"/>
<jsp:setProperty name="bullet" property="*"/>
<%-- ${gson.toJson(dao.getBulletinBoardList(param.writer,param.title))} --%>
<c:if test="${empty bullet.writer}">${bullet.setWriter("")}</c:if>
<c:if test="${empty bullet.title}">${bullet.setTitle("")}</c:if>
${gson.toJson(dao.getBulletinBoardList(bullet))}
