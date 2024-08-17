<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>电脑配件在线销售平台</title>
	<jsp:include page="meta.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper-3.4.2.min.css">
	<style type="text/css">
		.swiper-container {
		    width: 1200px;
		    height: 400px;
		} 
	</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- <div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide" style="background: url('/mall/images/pic1.jpg');"></div>
        <div class="swiper-slide" style="background: url('/mall/images/pic5.jpg');"></div>
        <div class="swiper-slide" style="background: url('/mall/images/pic3.jpg');"></div>
        <div class="swiper-slide" style="background: url('/mall/images/pic2.jpg');"></div>
        <div class="swiper-slide" style="background: url('/mall/images/pic4.jpg');"></div>
        <div class="swiper-slide" style="background: url('/mall/images/pic6.jpg');"></div>
    </div>
    如果需要分页器
    <div class="swiper-pagination"></div>
    如果需要导航按钮
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div> -->
<div id="tour" class="index-section">
	<section class="center">
		<h3>所有分类</h3>
		<p>&nbsp;</p>
	</section>
	<c:forEach items="${categorys }" var="category">
		<figure class="product">
				<a href="/mall/product-list?cat=${category.categoryId }">
					<c:if test="${category.pic ne null }"><img src="${category.pic }" alt=""></c:if>
					<c:if test="${category.pic eq null }"><img src="/mall/images/default.jpg" alt=""></c:if>
				</a>
				<figcaption>
					<p class="title">
						<strong><a href="/mall/pdetail?id=${category.categoryId }">${category.name }</a></strong>
					</p>
				</figcaption>
			<%-- <div class="type type-2">${vo.product.subTitle }</div> --%>
		</figure>
	</c:forEach>
	<%-- <section class="center">
		<ul class="pagination">
           	<c:if test="${page.currentpage gt 1 }">
			    <li><a href="/music/music-list?currentpage=${page.currentpage-1 }&mtype=${mtype}">&laquo;</a></li>
           	</c:if>
		    <c:forEach var="s"  begin="1" end="${page.totalpage }">
		    	<li <c:if test="${page.currentpage eq s }">class="active"</c:if>>
		    		<a href="/music/music-list?currentpage=${s }&mtype=${mtype}">${s }</a>
		    	</li>
		    </c:forEach>
		    <c:if test="${ page.currentpage lt page.totalpage }">
		    	<li><a href="/music/music-list?currentpage=${page.currentpage+1 }&mtype=${mtype}">&raquo;</a></li>
		    </c:if>
		</ul>
		<c:if test="${page.currentpage eq page.totalpage }">
		<p>已全部加载</p>
		</c:if>
	</section> --%>
</div>

<footer id="footer">
	<div class="bottom">Copyright © 电脑配件在线销售平台 | 浙ICP 备120110119 号| 经营许可证：L-YC-BK12345</div>
</footer>
<script src="${pageContext.request.contextPath}/lib/swiper-3.4.2.jquery.min.js"></script>
<script type="text/javascript">
var mySwiper = new Swiper ('.swiper-container', {
	autoplay: 3000,//可选选项，自动滑动
    loop: true,
    
    // 如果需要分页器
    pagination: '.swiper-pagination',
    
    // 如果需要前进后退按钮
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    
  })
</script>
</body>
</html>