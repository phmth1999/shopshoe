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
	<section class="register-login-section ">
		<div class="container">
			<h2 class="titileHistory">History</h2>
			<div class="row table-col">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>STT</th>
							<th>Full name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Delivery Address</th>
							<th>Total Price</th>
							<th>Total Quantity</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="item" items="${listOrder }" varStatus = "index"> 
						<tr>
							<td class="count">${index.count}</td>
							<td class="fullname">${item.user.fullname}</td>
							<td class="user">${item.user.email}</td>
							<td class="phone">${item.user.phone}</td>
							<td class="address">${item.deliveryAddress}</td>
							<td class="total"><span><fmt:formatNumber pattern="#,##0 vnđ" value="${item.totalPrice}" /></span></td>
							<td class="quanty"><a href='<c:url value="/history/${item.id }?pageHistory=${currentPage }" />'>${item.totalQuantity}</a></td>
							<td class="note">${item.status}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
					<form id="formpagination" action="history" method="get">
					<ul class="pagination" id="pagination"></ul>	
					<input type="hidden" value="1" id="page" name="page"/>
					</form>
					<script>
						var totalPages = ${totalPage };
						var currentPage = ${currentPage };
						$(function () {
							window.pagObj = $('#pagination').twbsPagination({
								totalPages: totalPages,
								visiblePages: 5,
								startPage: currentPage,
								onPageClick: function (event, page) {
								    if (currentPage != page) {
										$('#page').val(page);
										$('#formpagination').submit();
									}
								}
							});
						});
					</script>
		</div>
	</section>
	
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