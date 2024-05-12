package z01_vo;

public class MatchMember {
	private String id_email;
	private String gender;
	private int age;
	private int sal;
	public MatchMember() {
	}
	public MatchMember(String id_email,String gender, int age, int sal) {
		this.id_email = id_email;
		this.gender = gender;
		this.age = age;
		this.sal = sal;
	}
	public String getId_email() {
		return id_email;
	}
	public void setId_email(String id_email) {
		this.id_email = id_email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	
}
