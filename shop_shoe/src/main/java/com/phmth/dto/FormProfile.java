package com.phmth.dto;

public class FormProfile {

	private String fullname;
	private String email;
	private String phone;
	private String address;
	private String image;

	public FormProfile() {
	}

	public FormProfile(String fullname, String email, String phone, String address, String image) {
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.image = image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
