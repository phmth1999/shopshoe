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
										<a
											class="btn btn-sm btn-primary btn-edit"
											data-toggle="tooltip" title='Add product'
											href="<c:url value='/admin/product/0'/>"><i class="glyphicon glyphicon-plus"></i> Add Product</a>
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
												<th>Category</th>
												<th>Brand</th>
												<th>Name</th>
												<th>Image</th>
												<th>Price</th>
												<th>Quantity</th>
												<th>Edit</th>
												<th>Cancel</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listProduct }" varStatus = "index">
												<tr>
													<c:if test="${currentPage >= 2 }">
													<td>${index.count + ((currentPage-1)*6)}</td>
													</c:if>
													<c:if test="${currentPage < 2 }">
													<td>${index.count}</td>
													</c:if>
													<td>${item.category.name}</td>
													<td>${item.brand.name}</td>
													<td>${item.name}</td>
													<td>${item.image}</td>
													<td>${item.price}</td>
													<td>${item.quantity}</td>
													<td class="edit">
														<a class="btn btn-sm btn-primary btn-edit"
														   data-toggle="tooltip" 
														   title="Edit Product" 
														   href='<c:url value="/admin/product/${item.id }?pageProduct=${currentPage }" />' >
															<i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
														</a>
													</td>
													<td class="edit">
														<a class="btn btn-sm btn-primary btn-edit"
														   data-toggle="tooltip" 
														   title="Cancel Product" 
														   href='<c:url value="/admin/product/delete/${item.id }?pageProduct=${currentPage }" />'>
															<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
														</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<form id="formpagination" action='<c:url value="/admin/product" />' method="get">
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