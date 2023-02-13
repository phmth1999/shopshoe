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
<link href='<c:url value="/template/web/css/pages/home.css"/>' rel="stylesheet">
<!-- Css End -->
</head>
<body>
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">
						<table>
							<thead>
								<tr>
									<th>Image</th>
									<th class="p-name">Product Name</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th><i class="ti-close"></i></th>
								</tr>
							</thead>
							<tbody id="tableTbodyListCart">
								<c:forEach var="item" items="${Cart }" varStatus="index">
									<tr>
										<td class="cart-pic first-row"><img src='<c:url value="/template/web/img/products/${item.value.product.image }" />' alt=""></td>
										<td class="cart-title first-row"><h5>${item.value.product.name }</h5></td>
										<td class="p-price first-row"><fmt:formatNumber pattern="#,##0 vnđ" value="${item.value.product.price}" /></td>
										<td class="qua-col first-row">
											<div class="quantity">
												<div class="pro-qty">
													<span onclick="editCart(${item.key },${item.value.quanty },0)" data-id="${item.key }" class="dec qtybtn">-</span>
													<input type="text" value="${item.value.quanty }">
													<span onclick="editCart(${item.key },${item.value.quanty },1)" data-id="${item.key }" class="inc qtybtn">+</span>
												</div>
											</div>
										</td>
										<td class="total-price first-row"><fmt:formatNumber pattern="#,##0 vnđ" value="${item.value.totalPrice}" /></td>
										<td class="close-td first-row"><a onclick="deleteCart(${item.key})"><i class="ti-close"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-4">
						</div>
						<div class="col-lg-4 offset-lg-4">
							<div class="proceed-checkout">
								<ul>
									<li class="subtotal">Subtotal <span></span></li>
									<li class="cart-total">Total <span><fmt:formatNumber pattern="#,##0vnđ" value="${TotalPriceCart}" /></span></li>
								</ul>
								<a href='<c:url value="/order" />' class="proceed-btn">PROCEED
									TO ORDER</a>
							</div>
						</div>
					</div>
				</div>
			</div>
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
	
	<!-- Js Begin -->
	<script src='<c:url value="/template/web/js/pages/main.js"/>'></script>
	<script src='<c:url value="/template/web/js/pages/listCart.js"/>'></script>
	<!-- Js End -->
</body>
</html>