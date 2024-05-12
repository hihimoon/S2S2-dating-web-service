package z01_vo;

public class Member_opp {
	private String id_email;
	private int age_opp;
	private int height_opp;
	private int sal_opp;
	public Member_opp() {
		super();
	}
	public Member_opp(String id_email, int age_opp, int height_opp, int sal_opp) {
		super();
		this.id_email = id_email;
		this.age_opp = age_opp;
		this.height_opp = height_opp;
		this.sal_opp = sal_opp;
	}
	public String getId_email() {
		return id_email;
	}
	public void setId_email(String id_email) {
		this.id_email = id_email;
	}
	public int getAge_opp() {
		return age_opp;
	}
	public void setAge_opp(int age_opp) {
		this.age_opp = age_opp;
	}
	public int getHeight_opp() {
		return height_opp;
	}
	public void setHeight_opp(int height_opp) {
		this.height_opp = height_opp;
	}
	public int getSal_opp() {
		return sal_opp;
	}
	public void setSal_opp(int sal_opp) {
		this.sal_opp = sal_opp;
	}
}
