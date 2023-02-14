<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div class="register-login-section ">
		<div class="container">
		<h2 class="titileHistory">History Detail</h2>
			<div class="row">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>STT</th>
							<th>Image</th>
							<th>Name</th>
							<th>Price</th>
							<th>Quanty</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="item" items="${listOrderDetail }" varStatus = "index"> 
						<tr>
							<td class="count">${index.count}</td>
							<td class="img"><img src='<c:url value="/template/web/img/products/${item.product.image }" />' alt=""></td>
							<td class="name">${item.product.name}</td>
							<td class="price"><span><fmt:formatNumber pattern="#,##0 vnđ" value="${item.product.price}" /></span></td>
							<td class="quanty">${item.quantity}</td>
							<td class="total"><span><fmt:formatNumber pattern="#,##0 vnđ" value="${item.price}" /></span></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<h2 class="linkGoBack"><a href='<c:url value="/history?page=${pageHistory }" />'>Go Back</a></h2>
		</div>
	</div>
	
	
</body>
</html>