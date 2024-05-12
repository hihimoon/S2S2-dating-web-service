package z01_vo;

public class Community {
	
	private int communityno;
	private String id_email;
	private String title;
	private String ccontent;
	private String writtendate;
	private String name;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Community() {
		// TODO Auto-generated constructor stub
	}
	
	public Community(int communityno, String id_email, String title, String ccontent, String writtendate) {
		this.communityno = communityno;
		this.id_email = id_email;
		this.title = title;
		this.ccontent = ccontent;
		this.writtendate = writtendate;
	}
	
	
	public Community(int communityno, String id_email, String title, String ccontent, String writtendate, String name) {
		super();
		this.communityno = communityno;
		this.id_email = id_email;
		this.title = title;
		this.ccontent = ccontent;
		this.writtendate = writtendate;
		this.name = name;
	}
	

	public Community(String title) {
		super();
		this.title = title;
	}

	
	public int getCommunityno() {
		return communityno;
	}

	public void setCommunityno(int communityno) {
		this.communityno = communityno;
	}

	public String getId_email() {
		return id_email;
	}
	public void setId_email(String id_email) {
		this.id_email = id_email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(String writtendate) {
		this.writtendate = writtendate;
	}
	
	
	
}
