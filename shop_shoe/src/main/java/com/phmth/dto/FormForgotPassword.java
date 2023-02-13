package com.phmth.dto;

public class FormForgotPassword {
	private String email;
	private String newPassword;
	private String verificationCode;

	public FormForgotPassword() {
	}

	public FormForgotPassword(String email, String newPassword, String verificationCode) {
		this.email = email;
		this.newPassword = newPassword;
		this.verificationCode = verificationCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

}
