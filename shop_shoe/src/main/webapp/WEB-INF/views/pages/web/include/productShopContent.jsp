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
<link href='<c:url value="/template/web/css/pages/product.css"/>' rel="stylesheet">
</head>
<body>
	<form id="formProductShop" action='<c:url value="/product-shop" />' method="get">
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">Categories</h4>
						<script>
						function clickCategory(e){
							let myCheckbox = document.querySelectorAll("#nameCategory");
							console.log(myCheckbox);
							 for (let i = 0; i < myCheckbox.length; i++) {
								 myCheckbox[i].checked = false;
							 }
							e.checked = true;
							$('#formProductShop').submit();
						}
						</script>
						<ul class="filter-catagories">
							<li>
								<c:if test="${nameCategory == 'all' }">
								<input onclick="clickCategory(this)" 
									   checked="checked" 
									   id="nameCategory" 
									   name="nameCategory" 
									   type="checkbox" 
									   value="all"
								/>
								</c:if>
								<c:if test="${nameCategory != 'all' }">
								<input onclick="clickCategory(this)" 
									   id="nameCategory" 
									   name="nameCategory" 
									   type="checkbox" 
									   value="all"
								/>
								</c:if>
								&nbsp;
								<a>All</a>
							</li>
							<c:forEach var="item" items="${listCategory }">
							<li>
								<c:if test="${nameCategory == item.name }">
								<input onclick="clickCategory(this)" 
									   checked="checked" 
									   id="nameCategory" 
									   name="nameCategory" 
									   type="checkbox" 
									   value="${item.name }"
								/>
								</c:if>
								<c:if test="${nameCategory != item.name }">
								<input onclick="clickCategory(this)" 
									   id="nameCategory" 
									   name="nameCategory" 
									   type="checkbox" 
									   value="${item.name }"
								/>
								</c:if>
								&nbsp;
								<a>${item.name }</a>
							</li>
							</c:forEach> 
						</ul>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title">Brand</h4>
						<script>
						function clickBrand(e){
							let myCheckbox = document.querySelectorAll("#nameBrand");
							console.log(myCheckbox);
							 for (let i = 0; i < myCheckbox.length; i++) {
								 myCheckbox[i].checked = false;
							 }
							e.checked = true;
							$('#formProductShop').submit();
						}
						</script>
						<ul class="filter-catagories">
							<li>
								<c:if test="${nameBrand == 'all' }">
								<input onclick="clickBrand(this)" 
									   checked="checked" 
									   id="nameBrand" 
									   name="nameBrand" 
									   type="checkbox" 
									   value="all"
								/>
								</c:if>
								<c:if test="${nameBrand != 'all' }">
								<input onclick="clickBrand(this)" 
									   id="nameBrand" 
									   name="nameBrand" 
									   type="checkbox" 
								  	   value="all"
								/>
								</c:if>
								&nbsp;
								<a>All</a>
							</li>
							<c:forEach var="item" items="${listBrand }">
							<li>
								<c:if test="${nameBrand == item.name }">
								<input onclick="clickBrand(this)" 
									   checked="checked" 
									   id="nameBrand" 
									   name="nameBrand" 
									   type="checkbox" 
								  	   value="${item.name }"
								/>
								</c:if>
								<c:if test="${nameBrand != item.name }">
								<input onclick="clickBrand(this)" 
									   id="nameBrand" 
									   name="nameBrand" 
									   type="checkbox" 
									   value="${item.name }"
								/>
								</c:if>
								&nbsp;
								<a>${item.name }</a>
							</li>
							</c:forEach>
						</ul>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title">Price</h4>
						<script>
						function clickPrice(e){
							let myCheckbox = document.querySelectorAll("#namePrice");
							 for (let i = 0; i < myCheckbox.length; i++) {
								 myCheckbox[i].checked = false;
							 }
							e.checked = true;
							$('#formProductShop').submit();
						}
						</script>
						<ul class="filter-catagories">
							<li>
								<c:if test="${namePrice == 'all' }">
								<input onclick="clickPrice(this)" 
									   checked="checked" 
									   id="namePrice" 
									   name="namePrice" 
									   type="checkbox" 
									   value="all"
								/>
								</c:if>
								<c:if test="${namePrice != 'all' }">
								<input onclick="clickPrice(this)" 
									   id="namePrice" 
									   name="namePrice" 
									   type="checkbox" 
								  	   value="all"
								/>
								</c:if>
								&nbsp;
								<a>All</a>
							</li>
							<li>
								<c:if test="${namePrice == '1-5' }">
								<input onclick="clickPrice(this)" 
									   checked="checked" 
									   id="namePrice" 
									   name="namePrice" 
									   type="checkbox" 
									   value="1-5"
								/>
								</c:if>
								<c:if test="${namePrice != '1-5' }">
								<input onclick="clickPrice(this)" 
									   id="namePrice" 
									   name="namePrice" 
									   type="checkbox" 
								  	   value="1-5"
								/>
								</c:if>
								&nbsp;
								<a>1.000000 - 5.000000</a>
							</li>
							<li>
								<c:if test="${namePrice == '5-10' }">
								<input onclick="clickPrice(this)" 
									   checked="checked" 
									   id="namePrice" 
									   name="namePrice" 
									   type="checkbox" 
									   value="5-10"
								/>
								</c:if>
								<c:if test="${namePrice != '5-10' }">
								<input onclick="clickPrice(this)" 
									   id="namePrice" 
									   name="namePrice" 
									   type="checkbox" 
								  	   value="5-10"
								/>
								</c:if>
								&nbsp;
								<a>5.000000 - 10.000000</a>
							</li>
							<li>
								<c:if test="${namePrice == '10-100' }">
								<input onclick="clickPrice(this)" 
									   checked="checked" 
									   id="namePrice" 
									   name="namePrice" 
									   type="checkbox" 
									   value="10-100"
								/>
								</c:if>
								<c:if test="${namePrice != '10-100' }">
								<input onclick="clickPrice(this)" 
									   id="namePrice" 
									   name="namePrice" 
									   type="checkbox" 
								  	   value="10-100"
								/>
								</c:if>
								&nbsp;
								<a>10.000000 - 100.000000</a>
							</li>
						</ul>
					</div>
					<!-- <div class="filter-widget">
						<h4 class="fw-title">Price</h4>
						<div class="filter-range-wrap">
							<div class="range-slider">
								<div class="price-input">
									<input type="text" id="minamount"> <input type="text"
										id="maxamount">
								</div>
							</div>
							<div
								class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
								data-min="33" data-max="98">
								<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
								<span tabindex="0"
									class="ui-slider-handle ui-corner-all ui-state-default"></span>
								<span tabindex="0"
									class="ui-slider-handle ui-corner-all ui-state-default"></span>
							</div>
						</div>
						<a href="#" class="filter-btn">Filter</a>
					</div> -->
					<!-- <div class="filter-widget">
						<h4 class="fw-title">Color</h4>
						<div class="fw-color-choose">
							<div class="cs-item">
								<input type="radio" id="cs-black"> <label
									class="cs-black" for="cs-black">Black</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-violet"> <label
									class="cs-violet" for="cs-violet">Violet</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-blue"> <label class="cs-blue"
									for="cs-blue">Blue</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-yellow"> <label
									class="cs-yellow" for="cs-yellow">Yellow</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-red"> <label class="cs-red"
									for="cs-red">Red</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-green"> <label
									class="cs-green" for="cs-green">Green</label>
							</div>
						</div>
					</div> -->
					<!-- <div class="filter-widget">
						<h4 class="fw-title">Size</h4>
						<div class="fw-size-choose">
							<div class="sc-item">
								<input type="radio" id="s-size"> <label for="s-size">s</label>
							</div>
							<div class="sc-item">
								<input type="radio" id="m-size"> <label for="m-size">m</label>
							</div>
							<div class="sc-item">
								<input type="radio" id="l-size"> <label for="l-size">l</label>
							</div>
							<div class="sc-item">
								<input type="radio" id="xs-size"> <label for="xs-size">xs</label>
							</div>
						</div>
					</div> -->
					<!-- <div class="filter-widget">
						<h4 class="fw-title">Tags</h4>
						<div class="fw-tags">
							<a href="#">Towel</a> <a href="#">Shoes</a> <a href="#">Coat</a>
							<a href="#">Dresses</a> <a href="#">Trousers</a> <a href="#">Men's
								hats</a> <a href="#">Backpack</a>
						</div>
					</div> -->
				</div>
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-7 col-md-7">
								<div class="select-option">
									<select id="sorting" onchange="changeSort(this)" class="sorting" name="nameSort">
										<option hidden="" value='${nameSort }'>${nameSort }</option>
										<option value='low-high'>Low to High Price</option>
										<option value='high-low'>High to Low Price</option>
										<option value='a-z'>Name: A - Z</option>
										<option value='z-a'>Name: Z - A</option>
									</select>
									<script>
										function changeSort(e){
											$('#formProductShop').submit();
										}
									</script>
								</div>
							</div>
							<div class="col-lg-5 col-md-5 text-right">
							</div>
						</div>
					</div>
					<div class="product-list">
						<div class="row">
							<c:forEach var="item" items="${listProduct }">
								<div class="col-lg-4 col-sm-6">
									<div class="product-item">
										<div class="pi-pic">
											<img src='<c:url value="/template/web/img/products/${item.image }" />' alt="">
											<ul>
												<li class="w-icon active">
													<a onclick="addCart(${item.id})"><i class="icon_bag_alt"></i></a>
												</li>
												<li class="quick-view">
													<a href='<c:url value="/product-shop/${item.id }"/>'>+ Quick View</a>
												</li>
											</ul>
										</div>
										<div class="pi-text">
											<h5>${item.name }</h5>
											<div class="product-price"><fmt:formatNumber pattern="#,##0 vnđ" value="${item.price }" /></div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<ul class="pagination" id="pagination"></ul>	
					<input type="hidden" value="1" id="page" name="page"/>
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
										$('#formProductShop').submit();
									}
								}
							});
						});
					</script>
				</div>
			</div>
		</div>
	</section>
	</form>
	
	<!-- Js Library -->
	<script src="<c:url value="/template/web/js/jquery-3.3.1.min.js" />"></script>
	<script src="<c:url value="/template/web/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/template/web/js/jquery-ui.min.js" />"></script>
	<script src="<c:url value="/template/web/js/jquery.countdown.min.js" />"></script>
	<script src="<c:url value="/template/web/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/template/web/js/jquery.zoom.min.js"/>"></script>
	<script src="<c:url value="/template/web/js/jquery.dd.min.js"/>"></script>
	<script src="<c:url value="/template/web/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="/template/web/js/owl.carousel.min.js"/>"></script>
	
	<script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
	
	<script src="<c:url value="/template/web/js/pages/main.js"/>"></script>
	<script src='<c:url value="/template/web/js/pages/listCart.js"/>'></script>
</body>
</html>