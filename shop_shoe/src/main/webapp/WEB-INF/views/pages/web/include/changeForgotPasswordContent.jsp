<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<!-- Form Forgot Password Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="login-form">
						<form:form  action="change-password" method="post" modelAttribute="formForgotPassword">
							<h2>CHange Forgot Password</h2>
							<c:if test="${message != null }">
								<div class="alert alert-danger">${message}</div>
							</c:if>
							<div class="group-input">
								<form:password 
									id="newPassword" 
									path="newPassword" 
									placeholder="Please enter your new password" 
									required="required"
									pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])([0-9a-zA-Z]{8,})$"
									title="Admin123"
								/> 
							</div>
							<button type="submit" class="site-btn login-btn" >Confirm</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Form Forgot Password End -->
	
	
</body>
</html>