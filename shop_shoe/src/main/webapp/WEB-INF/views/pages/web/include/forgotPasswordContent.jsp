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
						<form:form  action="forgot-password" method="post" modelAttribute="formForgotPassword">
							<h2>Forgot Password</h2>
							<c:if test="${message != null }">
								<div class="alert alert-danger">${message}</div>
							</c:if>
							<div class="group-input">
								<form:input 
									id="email" 
									path="email" 
									placeholder="Please enter your email" 
									required="required"
									pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"
									title="admin@gmail.com"
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