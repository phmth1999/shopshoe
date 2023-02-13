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
<link href='<c:url value="/template/web/css/pages/blog.css"/>' rel="stylesheet">
<!-- Css End -->
</head>
<body>
	<!-- Blog Section Begin -->
	<section class="blog-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
					<div class="blog-sidebar">
						<div class="search-form">
							<h4>Search</h4>
							<form action="#">
								<input type="text" placeholder="Search . . .  ">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
						<div class="blog-catagory">
							<h4>Categories</h4>
							<ul>
								<li><a href="#">Fashion</a></li>
								<li><a href="#">Travel</a></li>
								<li><a href="#">Picnic</a></li>
								<li><a href="#">Model</a></li>
							</ul>
						</div>
						<div class="recent-post">
							<h4>Recent Post</h4>
							<div class="recent-blog">
								<a href="#" class="rb-item">
									<!-- <div class="rb-pic">
										<img src="template/user/img/blog/recent-1.jpg" alt="">
									</div>
									<div class="rb-text">
										<h6>The Personality Trait That Makes...</h6>
										<p>
											Fashion <span>- May 19, 2019</span>
										</p>
									</div> -->
								</a> <a href="#" class="rb-item">
									<!-- <div class="rb-pic">
										<img src="template/user/img/blog/recent-2.jpg" alt="">
									</div>
									<div class="rb-text">
										<h6>The Personality Trait That Makes...</h6>
										<p>
											Fashion <span>- May 19, 2019</span>
										</p>
									</div> -->
								</a> <a href="#" class="rb-item">
									<!-- <div class="rb-pic">
										<img src="template/user/img/blog/recent-3.jpg" alt="">
									</div>
									<div class="rb-text">
										<h6>The Personality Trait That Makes...</h6>
										<p>
											Fashion <span>- May 19, 2019</span>
										</p>
									</div> -->
								</a> <a href="#" class="rb-item">
									<!-- <div class="rb-pic">
										<img src="template/user/img/blog/recent-4.jpg" alt="">
									</div>
									<div class="rb-text">
										<h6>The Personality Trait That Makes...</h6>
										<p>
											Fashion <span>- May 19, 2019</span>
										</p>
									</div> -->
								</a>
							</div>
						</div>
						<div class="blog-tags">
							<h4>Product Tags</h4>
							<div class="tag-item">
								<a href="#">Towel</a> <a href="#">Shoes</a> <a href="#">Coat</a>
								<a href="#">Dresses</a> <a href="#">Trousers</a> <a href="#">Men's
									hats</a> <a href="#">Backpack</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="row">
						<div class="col-lg-6 col-sm-6">
							<div class="blog-item">
								<div class="bi-pic">
									<img src="template/web/img/blog/blog-1.jpg" alt="">
								</div>
								<div class="bi-text">
									<a href='<c:url value="/blog-detail" />'>
										The Personality Trait That Makes People Happier
									</a>
									<p>
										travel <span>- May 19, 2019</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-sm-6">
							<div class="blog-item">
								<div class="bi-pic">
									<img src="template/web/img/blog/blog-2.jpg" alt="">
								</div>
								<div class="bi-text">
									<a href='<c:url value="/blog/1" />'>
										This was one of our first days in Hawaii last week.
									</a>
									<p>
										Fashion <span>- May 19, 2019</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-sm-6">
							<div class="blog-item">
								<div class="bi-pic">
									<img src="template/web/img/blog/blog-3.jpg" alt="">
								</div>
								<div class="bi-text">
									<a href='<c:url value="/blog/2" />'>
										Last week I had my first work trip of the year to Sonoma Valley
									</a>
									<p>
										travel <span>- May 19, 2019</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-sm-6">
							<div class="blog-item">
								<div class="bi-pic">
									<img src="template/web/img/blog/blog-4.jpg" alt="">
								</div>
								<div class="bi-text">
									<a href='<c:url value="/blog/3" />'>
										Happppppy New Year! I know I am a little late on this post
									</a>
									<p>
										Fashion <span>- May 19, 2019</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-sm-6">
							<div class="blog-item">
								<div class="bi-pic">
									<img src="template/web/img/blog/blog-5.jpg" alt="">
								</div>
								<div class="bi-text">
									<a href='<c:url value="/blog/4" />'>
										Absolue collection. The Lancome team has been one…
									</a>
									<p>
										Model <span>- May 19, 2019</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-sm-6">
							<div class="blog-item">
								<div class="bi-pic">
									<img src="template/web/img/blog/blog-6.jpg" alt="">
								</div>
								<div class="bi-text">
									<a href='<c:url value="/blog/5" />'>
										Writing has always been kind of therapeutic for me
									</a>
									<p>
										Fashion <span>- May 19, 2019</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="loading-more">
								<i class="icon_loading"></i> <a href="#"> Loading More </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->
	
	
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
	<!-- Js End -->
</body>
</html>