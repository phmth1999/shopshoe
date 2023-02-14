<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="login-form">
						<form:form  action="change-password" method="post" modelAttribute="formPassword">
							<h2>Change Password</h2>
							<c:if test="${message != null }">
								<div class="alert alert-danger">${message}</div>
							</c:if>
							<div class="group-input">
								<label for=password>Password *</label>
								<form:password 
									id="password" 
									path="password" 
									placeholder="Please enter your password" 
									required="required"
									pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])([0-9a-zA-Z]{8,})$"
									title="Admin123"
									/> 
							</div>
							<div class="group-input">
								<label for=rePassword>RePassword *</label>
								<form:password 
									id="rePassword" 
									path="rePassword" 
									placeholder="Please enter your rePassword" 
									required="required"
									pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])([0-9a-zA-Z]{8,})$"
									title="Admin123"
								/> 
							</div>
							<div class="group-input">
								<label for=newPassword>New Password *</label>
								<form:password 
									id="newPassword" 
									path="newPassword" 
									placeholder="Please enter your newPassword" 
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
	
	
</body>
</html>