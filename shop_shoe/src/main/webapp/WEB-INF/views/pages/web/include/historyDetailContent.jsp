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

<script src='<c:url value="/template/admin/js/jquery-2.2.3.min.js" />'></script>
<script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>

<link href='<c:url value="/template/web/css/pages/style.css"/>' rel="stylesheet">
<link href='<c:url value="/template/web/css/pages/home.css"/>' rel="stylesheet">
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
	
	<script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
	
	<!-- Js Begin -->
	<script src='<c:url value="/template/web/js/pages/main.js"/>'></script>
	<script src='<c:url value="/template/web/js/pages/listCart.js"/>'></script>
	<!-- Js End -->
</body>
</html>