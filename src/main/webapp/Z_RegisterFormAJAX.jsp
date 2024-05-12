<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="insreg" class="sslove.JSW_RegisterVO" />
<jsp:useBean id="dao" class="sslove.PreparedStmtDao" />
<jsp:setProperty name="insreg" property="*"/>
{"logSuc":"${dao.insertRegister(insreg)}"}
