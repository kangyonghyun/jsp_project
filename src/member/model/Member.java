package member.model;

import java.util.Date;

public class Member {

	private String id;
	private String name;
	private String password;
	private String email;
	private Date regDate;

	public Member(String id, String name, String password, String email, Date regDate) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}
	
	public String getEmail() {
		return email;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	//dto에 넣어도 되고 
	public boolean matchPassword(String pwd) {
		return password.equals(pwd);
	}

	public void changePassword(String newPwd) {
		this.password = newPwd;
	}

}
