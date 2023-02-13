package com.phmth.dto;

public class FormRegister {

	private String username;
	private String password;
	private String rePassword;
	private String fullname;
	private String email;
	private String phone;
	private String address;
	private String verificationCode;

	public FormRegister() {
	}

	public FormRegister(String username, String password, String rePassword, String fullname, String email,
			String phone, String address, String verificationCode) {
		this.username = username;
		this.password = password;
		this.rePassword = rePassword;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.verificationCode = verificationCode;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

}
