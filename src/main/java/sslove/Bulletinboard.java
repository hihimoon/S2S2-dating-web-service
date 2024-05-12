package sslove;

import java.sql.*;
import java.util.*;

public class Bulletinboard 
{
	private String writer;
	private String title;
	private Timestamp writtentime;
	private String content;
	
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getWrittentime() {
		return writtentime;
	}
	public void setWrittentime(Timestamp writtentime) {
		this.writtentime = writtentime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Bulletinboard(String writer, String title, Timestamp writtentime, String content) {
		this.writer = writer;
		this.title = title;
		this.writtentime = writtentime;
		this.content = content;
	}
	public Bulletinboard(String writer, String title, Timestamp writtentime) {
		this.writer = writer;
		this.title = title;
		this.writtentime = writtentime;
	}
	public Bulletinboard(String writer, String title, String content) {
		this.writer = writer;
		this.title = title;
		this.content = content;
	}
	public Bulletinboard() {
		
	}
	
	
	
}
