<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Css Library Begin -->
<link href='<c:url value='/template/admin/assets/css/bootstrap.min.css' />' rel="stylesheet"/>
<link href='<c:url value="/template/web/css/bootstrap.min.css"/>' rel="stylesheet" />
<link href='<c:url value="/template/web/css/themify-icons.css"/>' rel="stylesheet" />
<link href='<c:url value="/template/web/css/elegant-icons.css"/>' rel="stylesheet">
<link href='<c:url value="/template/web/css/owl.carousel.min.css"/>' rel="stylesheet">
<link href='<c:url value="/template/web/css/nice-select.css"/>' rel="stylesheet">
<link href='<c:url value="/template/web/css/jquery-ui.min.css"/>' rel="stylesheet">
<link href='<c:url value="/template/web/css/slicknav.min.css"/>' rel="stylesheet">
<!-- Css Library End -->

<!-- Css Begin -->
<link href='<c:url value="/template/web/css/pages/style.css"/>' rel="stylesheet">
<link href='<c:url value="/template/web/css/pages/login.css"/>' rel="stylesheet">
<!-- Css End -->
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
	
	<!-- Js Library Begin -->
	<script src='<c:url value="/template/web/js/jquery-3.3.1.min.js" />'></script>
	<script src='<c:url value="/template/web/js/bootstrap.min.js" />'></script>
	<script src='<c:url value="/template/web/js/jquery-ui.min.js" />'></script>
	<script src='<c:url value="/template/web/js/jquery.countdown.min.js" />'></script>
	<script src='<c:url value="/template/web/js/jquery.nice-select.min.js"/>'></script>
	<script src='<c:url value="/template/web/js/jquery.zoom.min.js"/>'></script>
	<script src='<c:url value="/template/web/js/jquery.dd.min.js"/>'></script>
	<script src='<c:url value="/template/web/js/jquery.slicknav.js"/>'></script>
	<script src='<c:url value="/template/web/js/owl.carousel.min.js"/>'></script>
	<!-- Js Library End -->
	
	<!-- Js Begin -->
	<script src='<c:url value="/template/web/js/pages/main.js"/>'></script>
	<!-- Js End -->
</body>
</html>