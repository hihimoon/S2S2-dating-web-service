<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<jsp:useBean id="dao" class="sslove.Chat_Dao"/>
<jsp:useBean id="chatRooms" class="z01_vo.ChatRooms"/>
<jsp:setProperty property="*" name="chatRooms"/>
{"insChatRooms": ${dao.insertChatRooms(chatRooms)}}
  