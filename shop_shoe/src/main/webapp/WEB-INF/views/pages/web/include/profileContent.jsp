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
	<!-- Profile Customer Begin -->
	<div class="register-login-section ">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2>Profile</h2>
						<form:form cssClass="row" id="form" action="profile" method="post" modelAttribute="user" enctype="multipart/form-data">
							<div class="col-lg-6">
								<div class="group-input">
									<label>Full Name</label>
									<form:input id="fullname" path="fullname"/>
								</div>
								<div class="group-input">
									<label>Email</label>
									<form:input id="email" path="email"/>
								</div>
								<div class="group-input">
									<label>Phone</label>
									<form:input id="phone" path="phone"/>
								</div>
								<div class="group-input">
									<label>Address</label>
									<form:input id="address" path="address"/>
								</div>
							</div>
							<script>
							function chooseFile(fileInput) {
								if (fileInput.files && fileInput.files[0]) {
									let reader = new FileReader();
									reader.onload = function(e) {
										$("#image").attr("src", e.target.result);
									}
									reader.readAsDataURL(fileInput.files[0]);
								}
							}
							</script>
							<div class="col-lg-6">
								<div class="group-input">
									<label>Image</label>
									<img id="image" alt="" src="template/web/img/user/${user.image }" width="100%" height="340px" />
									<input class="mt-2" onchange="chooseFile(this)" type="file" name="fileImage"/>
								</div>
							</div>
							<button type="submit" class="site-btn register-btn col-lg-12">Edit</button> 
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Profile Customer End -->
	
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