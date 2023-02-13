<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li>
						<i class="	glyphicon glyphicon-home"></i> 
							<a href="#">Home</a>
						</li>
				</ul>
			</div>
			<div align="center" style="margin-top: 10px;"></div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<div class="widget-box table-filter">
							<div class="table-btn-controls">
								<div class="pull-right tableTools-container">
									<div class="dt-buttons btn-overlap btn-group">
										<%-- <a class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='#' href="<c:url value='#'/>">
												</a> --%>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<div class="table-responsive">
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
													<c:if test="${currentPage >= 2 }">
													<td>${index.count + ((currentPage-1)*6)}</td>
													</c:if>
													<c:if test="${currentPage < 2 }">
													<td>${index.count}</td>
													</c:if>
													<td class="fullname">${item.user.fullname}</td>
													<td class="user">${item.user.email}</td>
													<td class="phone">${item.user.phone}</td>
													<td class="address">${item.deliveryAddress}</td>
													<td class="total"><span><fmt:formatNumber pattern="#,##0 vnđ" value="${item.totalPrice}" /></span></td>
													<td class="quanty"><a href='<c:url value="/admin/order/${item.id }?pageOrder=${currentPage }" />'>${item.totalQuantity}</a></td>
													<td>
														<form id="formEditStatus${item.id }" action='<c:url value="/admin/order/edit-status" />' method="post">
														<select onchange="editStatus(${item.id })" id="status" name="status">
															<option hidden="">${item.status }</option>
															<option value="Pending">Pending</option>
															<option value="Complete">Complete</option>
															<option value="Delivered">Delivered</option>
														</select>
														<input hidden="" name="orderID" value="${item.id }" />
														<input hidden="" name="pageOrder" value="${currentPage }" />
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<script>
										function editStatus(id){
											$('#formEditStatus'+id).submit();
										}
									</script>
								</div>
							</div>
						</div>
						<form id="formpagination" action='<c:url value="/admin/order" />' method="get">
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>