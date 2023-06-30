package Z01_National_Library.vo;

public class vo_joinMem {
	
	private String name01;
	private String id;
	private String pass;
	private String email;
	private String address;
	private String phonenumber;
	private String gender;
	private String memtype;

	public vo_joinMem() {
	}
	
	// 로그인시 사용
	public vo_joinMem(String id, String pass) {
		this.id = id;
		this.pass = pass;
	}

	// 등록을 위한 생성자
	public vo_joinMem(String name01, String id, String pass, String email, String address, String phonenumber,
			String gender, String memtype) {
		this.name01 = name01;
		this.id = id;
		this.pass = pass;
		this.email = email;
		this.address = address;
		this.phonenumber = phonenumber;
		this.gender = gender;
		this.memtype = memtype;
	}

	public String getName01() {
		return name01;
	}

	public void setName01(String name01) {
		this.name01 = name01;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMemtype() {
		return memtype;
	}

	public void setMemtype(String memtype) {
		this.memtype = memtype;
	}
	
	

}
