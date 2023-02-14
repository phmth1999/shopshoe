<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<!-- Register Form Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2>Register</h2>
						<c:if test="${message != null }">
							<div class="alert alert-danger">${message}</div>
						</c:if>
						<form:form id="form-register"  action="register" method="post" modelAttribute="user" >
							<div class="group-input">
								<label for=username>Username *</label>
								<form:input 
									id="username" 
									path="username" 
									placeholder="Please enter your username"  
									maxlength="50" 
									required="required"
									pattern="^(?=.*\d)(?=.*[a-z])([0-9a-zA-Z]{8,})$"
									title="VD: admin123"
								/>
							</div>
							<div class="group-input">
								<label for="password">Password *</label>
								<form:password 
									id="password" 
									path="password" 
									placeholder="Please enter your password"  
									maxlength="8" 
									required="required"
									pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])([0-9a-zA-Z]{8,})$"
									title="VD: Admin123"
								/>
							</div>
							<div class="group-input">
								<label for="rePassword">RePassword *</label> 
								<form:password 
									id="rePassword" 
									path="rePassword" 
									placeholder="Please enter your rePassword" 
									maxlength="8" 
									required="required"
									pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])([0-9a-zA-Z]{8,})$"
									title="VD: Admin123"
								/> 
							</div>
							<div class="group-input">
								<label for="fullname">Full Name *</label>
								<form:input 
									id="fullname" 
									path="fullname" 
									placeholder="Please enter your full name"  
									maxlength="50" 
									required="required"
									title="VD: Nguyen Van A"
								/>
							</div>
							<div class="group-input">
								<label for="email">Email *</label>
								<form:input 
									id="email" 
									path="email" 
									placeholder="Please enter your email"  
									maxlength="50" 
									required="required"
									pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"
									title="VD: admin@gmail.com"
								/>
							</div>
							<div class="group-input">
								<label for="phone">Phone *</label>
								<form:input 
									id="phone" 
									path="phone" 
									placeholder="Please enter your phone"  
									maxlength="10" 
									required="required"
									pattern="^\d{10}$"
									title="VD: 0378348419"
								/>
							</div>
							<div class="group-input">
								<label for="address">Address *</label>
								<form:input 
									id="address" 
									path="address" 
									placeholder="Please enter your address"  
									maxlength="255" 
									required="required"
									title="VD: Cai Lay district, Tien Giang province, HCM city"
								/>
							</div>
							<button type="submit" class="site-btn register-btn">Register</button>
						</form:form>
						<div class="switch-login">
							<a href='<c:url value="/login" />' class="or-login">Or Login</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Register Form End -->
	
	
</body>
</html>