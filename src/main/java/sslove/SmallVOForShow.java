package sslove;

import java.sql.Timestamp;

public class SmallVOForShow 
{
	private String name;
	private String phone;
	private String id_email;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getId_email() {
		return id_email;
	}
	public void setId_email(String id_email) {
		this.id_email = id_email;
	}
	public SmallVOForShow(String name, String phone, String id_email) {
		this.name = name;
		this.phone = phone;
		this.id_email = id_email;
	}
	public SmallVOForShow() {
	}

	
}
