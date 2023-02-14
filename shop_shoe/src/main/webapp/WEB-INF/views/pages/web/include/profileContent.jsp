<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

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
	
	
</body>
</html>