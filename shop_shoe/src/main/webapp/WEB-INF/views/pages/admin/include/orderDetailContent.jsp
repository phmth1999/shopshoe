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
					<li><i class="	glyphicon glyphicon-home"></i> <a href="#">Home</a></li>
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
								<h2 class="linkGoBack"><a href='<c:url value="/admin/order?page=${pageOrder }" />'>Go Back</a></h2>
							</div>
						</div>
						<div class="paginationRight" >
							<div class="pagination">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>