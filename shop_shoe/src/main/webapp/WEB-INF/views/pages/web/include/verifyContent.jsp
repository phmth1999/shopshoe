<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<!-- Form Verify Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="login-form">
						<form action="verify" method="post">
							<h2>Confirm</h2>
							<c:if test="${message != null }">
								<div class="alert alert-danger">${message}</div>
							</c:if>
							<div class="group-input">
								<input 
									type="text" 
									name="verificationCode" 
									placeholder="Please enter verification code" 
									required="required"
									title="ABCDEF"
								/> 
							</div>
							<button type="submit" class="site-btn login-btn" >Confirm</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Form Verify End -->
	
	
</body>
</html>