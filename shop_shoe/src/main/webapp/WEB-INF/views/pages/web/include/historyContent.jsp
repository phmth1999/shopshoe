<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

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
	
	
</body>
</html>