<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="register-login-section">
			<div class="row" style="display:flex; justify-content:center; align-items:center; ">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<c:if test="${add == 'add' }">
						<h2>Add</h2>
						</c:if>
						<c:if test="${edit == 'edit' }">
						<h2>Edit</h2>
						</c:if>
						<form:form cssClass="row" id="form" action="edit" method="post" modelAttribute="product" enctype="multipart/form-data">
							<input hidden="" name="pageProduct" value="${pageProduct }"/>
							<c:if test="${edit == 'edit' }">
							<div class="group-input col-lg-12">
								<label for=username>Id *</label>
								<form:input id="idProduct" path="id" readonly="true"/>
							</div>
							</c:if>
						<div class="col-lg-6">
							<div class="group-input">
								<label for=username>Name *</label>
								<form:input id="name" path="name" required="required"/>
							</div>
							<div class="group-input">
								<label for=username>Category *</label>
								<form:select id="note"  path="category.name" required="required">
  									<form:option id="op" value="" hidden="true"></form:option>
  									<form:option id="op" value="Men"></form:option>
  									<form:option id="op" value="Women"></form:option>
  									<form:option id="op" value="Kid"></form:option>
								</form:select>
							</div>
							<div class="group-input">
								<label for=username>Brand *</label>
								<form:select id="note"  path="brand.name" required="required">
  									<form:option id="op" value="" hidden="true"></form:option>
  									<form:option id="op" value="Adidas"></form:option>
  									<form:option id="op" value="Nike"></form:option>
								</form:select>
							</div>
							<div class="group-input">
								<label>Price *</label>
								<form:input id="price" path="price" required="required"/>
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
								<img  id="image" alt="" src='<c:url value="/template/web/img/products/${product.image }" />' width="100%" height="340px" />
								<c:if test="${add == 'add' }">
								<input style="margin-top: 5px" onchange="chooseFile(this)" type="file" name="fileImage" required="required"/>
								</c:if>
								<c:if test="${edit == 'edit' }">
								<input style="margin-top: 5px" onchange="chooseFile(this)" type="file" name="fileImage"/>
								</c:if>
							</div>
						</div>
							<div class="group-input col-lg-12">
								<label>Quantity *</label>
								<form:input id="quantity" path="quantity" required="required"/>
							</div>
							<c:if test="${add == 'add' }">
							 <button type="submit" class="site-btn register-btn col-lg-12">
								Add
							</button> 
							</c:if>
							<c:if test="${edit == 'edit' }">
							 <button type="submit" class="site-btn register-btn col-lg-12">
								Edit
							</button> 
							</c:if>
						</form:form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>