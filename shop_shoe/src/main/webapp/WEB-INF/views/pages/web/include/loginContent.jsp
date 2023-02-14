<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<!-- Login Form Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="login-form">
						<h2>Login</h2>
						<c:if test="${message != null }">
							<div class="alert alert-danger">${message}</div>
						</c:if>
						<c:if test="${param.incorrectAccount != null }">
							<div class="alert alert-danger">Username or password incorrect</div>
						</c:if>
						<c:if test="${param.accessDenied != null }">
							<div class="alert alert-danger">You not authorize</div>
						</c:if>
						<form:form id="form-login" action="j_spring_security_check" method="post" modelAttribute="user">
							<div class="group-input">
								<label for="username">Username *</label>
								<form:input id="username" path="username" placeholder="Please enter your username" maxlength="50" required="required"/>
							</div>
							<div class="group-input">
								<label for="password">Password *</label>
								<form:password id="password" path="password" placeholder="Please enter your password" maxlength="8" required="required"/>
							</div>
							<button type="submit" class="site-btn login-btn">Login</button>
						</form:form>
						<div class="switch-login">
							<a href='<c:url value="/register" />' class="or-login">Register</a>
							&nbsp;&nbsp;
							OR
							&nbsp;&nbsp;
							<a href='<c:url value="/forgot-password" />' class="or-login">Forgot Passsword</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Login Form End -->
	
	
</body>
</html>