<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Shop Page</title>
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
<link href='<c:url value="/template/web/css/pages/component/footer.css"/>' rel="stylesheet">
<link href='<c:url value="/template/web/css/pages/component/header.css"/>' rel="stylesheet">
<link href='<c:url value="/template/web/css/pages/product.css"/>' rel="stylesheet">
</head>
<body>
	<%@include file="/WEB-INF/views/pages/web/include/homeHeader.jsp"%>
	
	<%@include file="/WEB-INF/views/pages/web/include/productShopContent.jsp"%>

	<%@include file="/WEB-INF/views/pages/web/include/homeFooter.jsp"%>
	
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