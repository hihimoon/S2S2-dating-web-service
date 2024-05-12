package z01_vo;

public class Member_info {
	private String id_email;
	private String gender;
	private int age;
	private String loc;
	private int height;
	private String education;
	private String job;
	private int sal;
	private String drink;
	private String smoke;
	private String mbti1;
	private String mbti2;
	private String mbti3;
	private String mbti4;
	private String mbti;
	public Member_info() {
		super();
	}
	
	public Member_info(String id_email, String gender, int age, String loc, int height, String education, String job,
			int sal, String drink, String smoke, String mbti) {
		this.id_email = id_email;
		this.gender = gender;
		this.age = age;
		this.loc = loc;
		this.height = height;
		this.education = education;
		this.job = job;
		this.sal = sal;
		this.drink = drink;
		this.smoke = smoke;
		this.mbti = mbti;
	}



	public Member_info(String id_email, String gender, int age, String loc, int height, String education, String job,
			int sal, String drink, String smoke, String mbti1, String mbti2, String mbti3, String mbti4) {
		super();
		this.id_email = id_email;
		this.gender = gender;
		this.age = age;
		this.loc = loc;
		this.height = height;
		this.education = education;
		this.job = job;
		this.sal = sal;
		this.drink = drink;
		this.smoke = smoke;
		this.mbti1 = mbti1;
		this.mbti2 = mbti2;
		this.mbti3 = mbti3;
		this.mbti4 = mbti4;
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
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public String getDrink() {
		return drink;
	}
	public void setDrink(String drink) {
		this.drink = drink;
	}
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}

	public String getMbti1() {
		return mbti1;
	}

	public void setMbti1(String mbti1) {
		this.mbti1 = mbti1;
	}

	public String getMbti2() {
		return mbti2;
	}

	public void setMbti2(String mbti2) {
		this.mbti2 = mbti2;
	}

	public String getMbti3() {
		return mbti3;
	}

	public void setMbti3(String mbti3) {
		this.mbti3 = mbti3;
	}

	public String getMbti4() {
		return mbti4;
	}

	public void setMbti4(String mbti4) {
		this.mbti4 = mbti4;
	}
	public String getMbti() {
		return mbti1+mbti2+mbti3+mbti4;
	}
	
}
