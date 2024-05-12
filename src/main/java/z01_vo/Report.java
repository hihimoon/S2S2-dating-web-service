package z01_vo;

public class Report {

private int reportno;
private String victimid;
private String offenderid;
private String reportreason;
private String reportdate;
private int communityno;
private int chatno;
private String resolutionstatus;
private String handlingmethod;

public Report() {
	super();
	// TODO Auto-generated constructor stub
}

public Report(String victimid) {
	super();
	this.victimid = victimid;
}

public Report(int reportno) {
	super();
	this.reportno = reportno;
}

public Report(int reportno, String victimid, String offenderid, String reportreason, String reportdate,
		int communityno, int chatno) {
	super();
	this.reportno = reportno;
	this.victimid = victimid;
	this.offenderid = offenderid;
	this.reportreason = reportreason;
	this.reportdate = reportdate;
	this.communityno = communityno;
	this.chatno = chatno;
}



public Report(int reportno, String victimid, String offenderid, String reportreason, String reportdate,
		int communityno, String resolutionstatus, String handlingmethod) {
	super();
	this.reportno = reportno;
	this.victimid = victimid;
	this.offenderid = offenderid;
	this.reportreason = reportreason;
	this.reportdate = reportdate;
	this.communityno = communityno;
	this.resolutionstatus = resolutionstatus;
	this.handlingmethod = handlingmethod;
}

public String getResolutionstatus() {
	return resolutionstatus;
}

public void setResolutionstatus(String resolutionstatus) {
	this.resolutionstatus = resolutionstatus;
}

public String getHandlingmethod() {
	return handlingmethod;
}

public void setHandlingmethod(String handlingmethod) {
	this.handlingmethod = handlingmethod;
}

public String getReportreason() {
	return reportreason;
}

public void setReportreason(String reportreason) {
	this.reportreason = reportreason;
}

public int getReportno() {
	return reportno;
}
public void setReportno(int reportno) {
	this.reportno = reportno;
}
public String getVictimid() {
	return victimid;
}
public void setVictimid(String victimid) {
	this.victimid = victimid;
}
public String getOffenderid() {
	return offenderid;
}
public void setOffenderid(String offenderid) {
	this.offenderid = offenderid;
}
public String getReportdate() {
	return reportdate;
}
public void setReportdate(String reportdate) {
	this.reportdate = reportdate;
}
public int getCommunityno() {
	return communityno;
}
public void setCommunityno(int communityno) {
	this.communityno = communityno;
}
public int getChatno() {
	return chatno;
}
public void setChatno(int chatno) {
	this.chatno = chatno;
}


	
}
