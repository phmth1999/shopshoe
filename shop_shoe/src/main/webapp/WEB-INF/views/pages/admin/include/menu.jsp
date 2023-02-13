<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jsp"%>

<nav id="sidebar" class="sidebar responsive ace-save-state">
	<script type="text/javascript">
		try {
			ace.settings.loadState('sidebar')
		} catch (e) {
		}
	</script>
	<!-- NAV Manager Order Begin -->
	<ul class="nav nav-list">
		<li>
			<a href="#" class="dropdown-toggle"> 
				<span class="menu-text"></span> 
				Manager Order
			</a> 
			<b class="arrow"></b>
			<ul class="submenu">
				<li>
					<a href="<c:url value='/admin/order'/>"> List Order </a>
				</li>
			</ul>
		</li>
	</ul>
	<!-- NAV Manager Order ENd -->
	
	<!-- NAV Manager Account Begin -->
	<ul class="nav nav-list">
		<li>
			<a href="#" class="dropdown-toggle"> 
				<span class="menu-text"></span> 
				Manager Account
			</a> 
			<b class="arrow"></b>
			<ul class="submenu">
				<li>
					<a href="<c:url value='/admin/account'/>"> List Account </a>
				</li>
			</ul>
		</li>
	</ul>
	<!-- NAV Manager Account End -->
	
	<!-- NAV Manager Product Begin -->
	<ul class="nav nav-list">
		<li>
			<a href="#" class="dropdown-toggle"> 
				<span class="menu-text"></span> 
				Manager Product
			</a> 
			<b class="arrow"></b>
			<ul class="submenu">
				<li>
					<a href="<c:url value='/admin/product'/>"> List Product </a>
				</li>
			</ul>
		</li>
	</ul>
	<!-- NAV Manager Product End -->
	
	<div class="sidebar-toggle sidebar-collapse">
		<i class="glyphicon glyphicon-th-list" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div> 
	
</nav>
