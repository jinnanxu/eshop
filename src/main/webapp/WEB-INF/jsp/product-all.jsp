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
		<h3>${catName }</h3>
		<p>&nbsp;</p>
	</section>
	<c:forEach items="${page.records }" var="vo">
		<figure class="product">
				<a href="/mall/pdetail?id=${vo.product.productId }">
					<c:if test="${vo.product.pic ne null }"><img src="${vo.product.pic }" alt=""></c:if>
					<c:if test="${vo.product.pic eq null }"><img src="/mall/images/default.png" alt=""></c:if>
				</a>
				<figcaption>
					<p class="title">
						<strong><a href="/mall/pdetail?id=${vo.product.productId }">${vo.product.name }</a></strong>
					</p>
					<p class="artist">
						${vo.category.name } <span class="mpd">销量&nbsp;${vo.product.saleCount }</span>
					</p>
					<p class="profile"><a href="/mall/pdetail?id=${vo.product.productId }">${vo.product.subTitle }</a></p>
					<div class="buy-div">
						<span class="price"><span class="currency">￥</span><fmt:formatNumber value="${vo.product.price }" pattern="#,#00.00#"/></span>
						<div class="buy-btn" onclick="addCart(${vo.product.productId });"><i class="Hui-iconfont Hui-iconfont-cart2-selected"></i>加入购物车</div>
					</div>
				</figcaption>
			<%-- <div class="type type-2">${vo.product.subTitle }</div> --%>
		</figure>
	</c:forEach>
	<section class="center">
		<ul class="pagination">
           	<c:if test="${page.currentpage gt 1 }">
			    <li><a href="/mall/product-list?currentpage=${page.currentpage-1 }&cat=${cat}">&laquo;</a></li>
           	</c:if>
		    <c:forEach var="s"  begin="1" end="${page.totalpage }">
		    	<li <c:if test="${page.currentpage eq s }">class="active"</c:if>>
		    		<a href="/mall/product-list?currentpage=${s }&cat=${cat}">${s }</a>
		    	</li>
		    </c:forEach>
		    <c:if test="${ page.currentpage lt page.totalpage }">
		    	<li><a href="/mall/product-list?currentpage=${page.currentpage+1 }&cat=${cat}">&raquo;</a></li>
		    </c:if>
		</ul>
		<c:if test="${page.currentpage eq page.totalpage }">
		<p>已全部加载</p>
		</c:if>
	</section>
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