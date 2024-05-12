package z01_vo;

import java.sql.Timestamp;

public class Chat {
	private int chatno;
	private int chatroom;
	private String sendUserID;
	private String getUserID;
	private String message;
	private Timestamp sendtime;
	
	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Chat(int chatno, int chatroom, String sendUserID, String getUserID, String message, Timestamp sendtime) {
		super();
		this.chatno = chatno;
		this.chatroom = chatroom;
		this.sendUserID = sendUserID;
		this.getUserID = getUserID;
		this.message = message;
		this.sendtime = sendtime;
	}
	
	public Chat(int chatno, int chatroom, String sendUserID, String getUserID) {
		super();
		this.chatno = chatno;
		this.chatroom = chatroom;
		this.sendUserID = sendUserID;
		this.getUserID = getUserID;
	}

	public Chat(int chatroom, String sendUserID, String getUserID) {
		super();
		this.chatroom = chatroom;
		this.sendUserID = sendUserID;
		this.getUserID = getUserID;
	}

	public int getChatno() {
		return chatno;
	}

	public void setChatno(int chatno) {
		this.chatno = chatno;
	}

	public int getChatroom() {
		return chatroom;
	}

	public void setChatroom(int chatroom) {
		this.chatroom = chatroom;
	}

	public String getSendUserID() {
		return sendUserID;
	}

	public void setSendUserID(String sendUserID) {
		this.sendUserID = sendUserID;
	}

	public String getGetUserID() {
		return getUserID;
	}

	public void setGetUserID(String getUserID) {
		this.getUserID = getUserID;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getSendtime() {
		return sendtime;
	}

	public void setSendtime(Timestamp sendtime) {
		this.sendtime = sendtime;
	}
	
	
}
