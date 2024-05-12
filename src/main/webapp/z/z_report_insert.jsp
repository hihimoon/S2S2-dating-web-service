<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
%>
<jsp:useBean id="gson" class="com.google.gson.Gson"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:useBean id="dao" class="sslove.CommunityDao"/>
<jsp:useBean id="report" class="z01_vo.Report"/>
<jsp:setProperty property="*" name="report"/>

{"insReport": ${dao.insReport(report)}}
