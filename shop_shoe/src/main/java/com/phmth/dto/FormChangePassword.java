package com.phmth.dto;

public class FormChangePassword {
	private String password;
	private String rePassword;
	private String newPassword;

	public FormChangePassword() {
	}

	public FormChangePassword(String password, String rePassword, String newPassword) {
		this.password = password;
		this.rePassword = rePassword;
		this.newPassword = newPassword;
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

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

}
