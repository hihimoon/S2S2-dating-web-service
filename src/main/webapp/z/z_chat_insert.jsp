<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<jsp:useBean id="dao" class="sslove.Chat_Dao"/>
<jsp:useBean id="chat" class="z01_vo.Chat"/>
<jsp:setProperty property="*" name="chat"/>
{"insChat": ${dao.insertChat(chat)}}
  