package z01_vo;

public class ChatRooms {
	private int chatroom;
	private String sendUserID;
	private String getUserID;
	private String name;
	

	public ChatRooms() {
		// TODO Auto-generated constructor stub
	}
	
	public ChatRooms(String name, int chatroom, String sendUserID, String getUserID) {
		super();
		this.name = name;
		this.chatroom = chatroom;
		this.sendUserID = sendUserID;
		this.getUserID = getUserID;
	}

	public ChatRooms(int chatroom, String sendUserID, String getUserID) {
		this.chatroom = chatroom;
		this.sendUserID = sendUserID;
		this.getUserID = getUserID;
	}

	public ChatRooms(int chatroom, String getUserID) {
		this.chatroom = chatroom;
		this.getUserID = getUserID;
	}
	
	public ChatRooms(String name) {
		super();
		this.name = name;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
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
	
}
