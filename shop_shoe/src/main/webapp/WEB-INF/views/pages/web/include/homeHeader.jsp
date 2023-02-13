<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<%@ page import="com.phmth.security.CustomSuccesHandler"%>
<c:set var="lang" value="${pageContext.response.locale}" />
<!DOCTYPE html>
<html>
<head>
<link href='<c:url value="/template/web/css/pages/component/header.css"/>' rel="stylesheet">
</head>
<body>
<header class="header-section">
	<!-- Header Top Begin -->
	<div class="header-top">
		<div class="container">
			<div class="ht-right">
				<!-- Login And Logout Begin -->
				<security:authorize access="isAnonymous()">
					<a href='<c:url value="/login" />' class="login-panel">
						<i class="fa fa-user"></i> 
						Login
					</a>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<div class="login-panel">
						<div class="login">
							<div>
								<c:choose>
									<c:when test="${lang=='en'}">
										<a><%=CustomSuccesHandler.getPrincipal().getFullName()%></a>
									</c:when>
									<c:otherwise>
										<a><%=CustomSuccesHandler.getPrincipal().getFullName()%></a>
									</c:otherwise>
								</c:choose>
							</div>
							<ul>
								<li><a href='<c:url value="/profile" />'>Profile</a></li>
								<li><a href='<c:url value="/change-password" />'>Update Password</a></li>
								<li><a href='<c:url value="/history" />'>History</a></li>
							</ul>
						</div>
						<i>|</i>
						<a class="logout" href='<c:url value="logout" />'>Logout</a>
					</div>
				</security:authorize>
				<!-- Login And Logout End -->
				<!-- Language Begin -->
				<div class="lan-selector">
					<div class="header__top__right__language">
						<div>
							<c:choose>
								<c:when test="${lang=='en'}">
									<a>English</a>
								</c:when>
								<c:otherwise>
									<a>VietNam</a>
								</c:otherwise>
							</c:choose>
						</div>
						<span class="arrow_carrot-down"></span>
						<ul>
							<li><a href="?language=en">English</a></li>
							<li><a href="?language=vi_VN">VietNam</a></li>

						</ul>
					</div>
				</div>
				<!-- Language End -->
			</div>
		</div>
	</div>
	<!-- Header Top End -->
	<!-- Header Inner Begin -->
	<div class="container">
		<div class="inner-header">
			<div class="row">
				<!-- Logo Begin -->
				<div class="col-lg-2 col-md-2">
					<div class="logo">
						<a href="./*">
							<img src='<c:url value="/template/web/img/logo.png" />' alt="">
						</a>
					</div>
				</div>
				<!-- Logo End -->
				<!-- Search Begin -->
				<div class="col-lg-7 col-md-7">
					<div class="advanced-search">
						<!-- <button type="button" class="category-btn">All Categories</button> -->
						<div class="input-group">
							<input id="inputSearch" name="inputSearch" type="text" placeholder="What do you need?" />
							<button type="button">
								<i class="ti-search"></i>
							</button>
						</div>
					</div>
				</div>
				<!-- Search End -->
				<!-- Cart Begin -->
				<div class="col-lg-3 text-right col-md-3">
					<ul class="nav-right">
						<li class="cart-icon">
							<i class="icon_bag_alt"></i>
							<a class="iconTotalQuantyCart" href="#">  ${TotalQuantyCart }</a>
							<div class="cart-hover">
								<div class="select-items">
									<table id="table">
										<tbody id="tableTbodyIconCart">
											<c:forEach var="item" items="${Cart }">
												<tr>
													<td class="si-pic">
														<img src='<c:url value="/template/web/img/products/${item.value.product.image }" />' alt="">
													</td>
													<td class="si-text">
														<div class="product-selected">
															<div>${item.value.product.name }</div>
															<div>x${item.value.quanty }</div>
															<div>
																<fmt:formatNumber pattern="#,##0 vnđ" value="${item.value.totalPrice }" />
															</div>
														</div>
													</td>
													<td class="si-close">
														<a onclick="deleteCart(${item.key })">
															<i class="ti-close"></i>
														</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="select-total">
									<span>total:</span>
									<h5 class="totalPriceIconCart">
										<fmt:formatNumber pattern="#,##0 vnđ" value="${TotalPriceCart }" />
									</h5>
								</div>
								<div class="select-button">
									<a href='<c:url value="/cart" />' class="primary-btn view-card">View Card</a> 
									<a href='<c:url value="/order" />' class="primary-btn checkout-btn">Order</a>
								</div>
							</div>
						</li>
						<li class="cart-price">
							<fmt:formatNumber pattern="#,##0 vnđ" value="${TotalPriceCart }" />
						</li>
					</ul>
				</div>
				<!-- Cart End -->
			</div>
		</div>
	</div>
	<!-- Header Inner End -->
	
	<!-- Header Menu Bar Begin -->
	<div class="nav-item">
		<div class="container">
			<nav class="nav-menu mobile-menu">
				<ul>
					<li class="active">
						<a href='<c:url value="/home" />'>Home</a>
					</li>
					<li>
						<a href='<c:url value="/product-shop" />'>Shop</a>
					</li>
					<li>
						<a href='<c:url value="/blog" />'>Blog</a>
					</li>
					<li>
						<a href='<c:url value="/contact" />'>Contact</a>
					</li>
				</ul>
			</nav>
			<div id="mobile-menu-wrap"></div>
		</div>
	</div>
	<!-- Header Menu Bar End -->
</header>
</body>
</html>