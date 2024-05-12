<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gson" class="com.google.gson.Gson"/>
<jsp:useBean id="dao" class="sslove.Chat_Dao"/>
<jsp:useBean id="sch" class="z01_vo.ChatRooms"/>
<jsp:setProperty property="*" name="sch"/>
<c:if test="${empty sch.name}">${sch.setName("")}</c:if>
${gson.toJson(dao.getChatRoomList(sch)}


			       
    