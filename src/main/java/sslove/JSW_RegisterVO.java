package sslove;

import java.sql.*;
import java.util.*;
public class JSW_RegisterVO 
{

	private String name;
	private String residentnum;
	private String phone;
	private String id_email;
	private String pwd;
	private Timestamp registerdate;
	private Timestamp finallogindate;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResidentnum() {
		return residentnum;
	}
	public void setResidentnum(String residentnum) {
		this.residentnum = residentnum;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Timestamp getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(Timestamp registerdate) {
		this.registerdate = registerdate;
	}
	public Timestamp getFinallogindate() {
		return finallogindate;
	}
	public void setFinallogindate(Timestamp finallogindate) {
		this.finallogindate = finallogindate;
	}
	public JSW_RegisterVO(String name, String residentnum, String phone, String id_email, String pwd,
			Timestamp registerdate, Timestamp finallogindate) {
		this.name = name;
		this.residentnum = residentnum;
		this.phone = phone;
		this.id_email = id_email;
		this.pwd = pwd;
		this.registerdate = registerdate;
		this.finallogindate = finallogindate;
	}
	public JSW_RegisterVO() {
	
	}

}