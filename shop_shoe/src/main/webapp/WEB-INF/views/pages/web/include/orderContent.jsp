<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<section class="checkout-section spad">
		<div class="container">
			<form:form id="form-checkout" action="order" method="post" modelAttribute="order" class="checkout-form">
				<div class="row">
					<div class="col-lg-6">
						<h4 class="titileBillDetail">
							User detail
						</h4>
						<div class="row">
							<div class="col-lg-12">
								<label>Full Name</label>
								<form:input id="fullname" path="user.fullname" readonly="true"/>
							</div>
							<div class="col-lg-12">
								<label>Email</label>
								<form:input id="email" type="email" path="user.email" readonly="true"/>
							</div>
							<div class="col-lg-12">
								<label>Phone</label>
								<form:input  id="phone" path="user.phone" readonly="true"/>
							</div>
							<div class="col-lg-12">
								<form:hidden  id="totalQuantity" path="totalQuantity" value="${TotalQuantyCart }"/>
							</div>
							<div class="col-lg-12">
								<form:hidden  id="totalPrice" path="totalPrice" value="${TotalPriceCart }"/>
							</div>
							<div class="col-lg-12">
								<label>Delivery Address<span>*</span></label>
								<form:input  id="deliveryAddress" path="deliveryAddress" required="required"/>
							</div>
							<%-- <div class="col-lg-12">
								<label>Status<span>*</span></label>
								<form:select id="note"  path="status" required="required">
  									<form:option id="op" value="" hidden="true"></form:option>
  									<form:option id="op" value="Direct payment"></form:option>
  									<form:option id="op" value="Online payment"></form:option>
								</form:select>
							</div> --%>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="place-order">
							<h4 class="titileOrder">
								Product Detail
							</h4>
							<div class="order-total">
								<ul class="order-table">
									<li>Product <span>Price</span></li>
									<c:forEach var="item" items="${Cart }">
										<li class="fw-normal">
											<h4>x${item.value.quanty}</h4>${item.value.product.name}
											<span>
												<fmt:formatNumber pattern="#,##0 vnđ" value="${item.value.totalPrice}" />
											</span>
										</li>
									</c:forEach>
									<li class="total-price">
										Total Quantity
										<span>
											${TotalQuantyCart}
										</span>
									</li>
									<li class="total-price">
										Total Price
										<span>
											<fmt:formatNumber pattern="#,##0 vnđ" value="${TotalPriceCart}" />
										</span>
									</li>

								</ul>
								<!-- <div class="payment-check">
									<div class="pc-item">
										<label for="pc-check"> Cheque Payment <input
											type="checkbox" id="pc-check"> <span
											class="checkmark"></span>
										</label>
									</div>
									<div class="pc-item">
										<label for="pc-paypal"> Paypal <input type="checkbox"
											id="pc-paypal"> <span class="checkmark"></span>
										</label>
									</div>
								</div> -->
								<div class="order-btn">
									<button type="submit" class="site-btn place-btn">
										Order
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</section>
	
	
</body>
</html>