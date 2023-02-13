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
					<li><i class="	glyphicon glyphicon-home"></i> <a href="#">Trang
							chủ</a></li>
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
										 <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
												   title='Thêm tài khoản' href="<c:url value='/dang-ky'/>"><i class="glyphicon glyphicon-plus"></i>  Thêm tài khoản</a> 
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<div class="table-responsive">
									<table id="table" class="table table-bordered">
										<thead>
											<tr>
												<th>STT</th>
												<th>Image</th>
												<th>UserName</th>
												<th>Full name</th>
												<th>Email</th>
												<th>Phone</th>
												<th>Address</th>
												<th>Role</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listAccount }" varStatus = "index">
												<tr onload="">
													<c:if test="${currentPage >= 2 }">
													<td>${index.count + ((currentPage-1)*6)}</td>
													</c:if>
													<c:if test="${currentPage < 2 }">
													<td>${index.count}</td>
													</c:if>
													<td>${item.image}</td>
													<td>${item.username}</td>
													<td>${item.fullname}</td>
													<td>${item.email}</td>
													<td>${item.phone}</td>
													<td>${item.address}</td>
													<td>
														<form id="formEditRole${item.id }" action='<c:url value="/admin/account/edit-role" />' method="post">
														<select onchange="editRole(${item.id })" id="role" name="role">
															<option hidden="">${item.role }</option>
															<option value="ROLE_ADMIN">ROLE_ADMIN</option>
															<option value="ROLE_USER">ROLE_USER</option>
															<option value="ROLE_STAFF">ROLE_STAFF</option>
															<option value="ROLE_SHIPPER">ROLE_SHIPPER</option>
														</select>
														<input hidden="" name="userID" value="${item.id }" />
														<input hidden="" name="pageAccount" value="${currentPage }" />
														</form>
													</td>
													<td>
														<form id="formEditStatus${item.id }" action='<c:url value="/admin/account/edit-status" />' method="post">
														<select onchange="editStatus(${item.id })" id="status" name="status">
															<option hidden="">${item.status }</option>
															<option value="Activated">Activated</option>
															<option value="InActivated">InActivated</option>
														</select>
														<input hidden="" name="userID" value="${item.id }" />
														<input hidden="" name="pageAccount" value="${currentPage }" />
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<script>
										function editRole(id){
											$('#formEditRole'+id).submit();
										}
										function editStatus(id){
											$('#formEditStatus'+id).submit();
										}
									</script>
								</div>
							</div>
						</div>
						<form id="formpagination" action='<c:url value="/admin/account" />' method="get">
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
	<script>
		$("#block").attr("disabled", "disabled");
	</script>
</body>
</html>