<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>购物车-电脑配件在线销售平台</title>
	<jsp:include page="meta.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper-3.4.2.min.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="" class="index-section" style="margin: 10px auto;">
	<section class="cart">
		<form action="/mall/buy/book" method="get" onsubmit="return checkCart();">
		<ul>
			<li class="cart-item" id="first-li" style="height: 35px;">
				<div class="product-img">	</div>
				<div class="cart-meta">
					<p style="font-size: 14px;">商品名称</p>
				</div>
				<div class="cart-attr">单价</div>
				<div class="cart-attr">数量</div>
				<div class="cart-attr">小计</div>
				<div class="cart-attr">操作</div>
				<div class="cart-attr" style="width: 5%;">选择</div>
			</li>
			<c:forEach items="${cartList }" var="vo">
				<li class="cart-item">
					<div class="product-img">		
						<img src="${vo.product.pic }" alt="" width="120">
					</div>
					<div class="cart-meta">
						<p style="font-size: 16px; padding-bottom: 5px;">${vo.product.name }</p>
						<p style="color: #333; font-size: 12px;">${vo.product.subTitle }</p>
					</div>
					<div class="cart-attr price">${vo.product.price }</div>
					<div class="cart-attr">
						<span class="qty-btn" onclick="reduceQty(${vo.cart.cartId })">-</span><span class="qty-span" id="qty_${vo.cart.cartId }" data-qty="${vo.cart.quantity }">${vo.cart.quantity }</span><span class="qty-btn" onclick="addQty(${vo.cart.cartId })">+</span>
					</div>
					<div class="cart-attr price"  id="amt_${vo.cart.cartId }" data-amount="${vo.cart.quantity * vo.product.price }">${vo.cart.quantity * vo.product.price }</div>
					<div class="cart-attr"><a href="/mall/buy/removeProduct?cartId=${vo.cart.cartId }">删除</a></div>
					<div class="cart-chk"><input type="checkbox" name="selCart" value="${vo.cart.cartId }" onchange="reCompute();"></div>
				</li>
			</c:forEach>
		</ul>
		<div class="cart-total">
			<div class="total-amount"><span>合计：</span><span class="number" id="totalAmount">0.0</span></div>
			<div><input class="submit-btn" value="去结算" type="submit"></div>
		</div>
		</form>
	</section>
</div>


<footer id="footer">
	<div class="bottom">Copyright © 电脑配件在线销售平台 | ICP 备120110119 号| 经营许可证：L-YC-BK12345</div>
</footer>
<script src="${pageContext.request.contextPath}/lib/swiper-3.4.2.jquery.min.js"></script>
<script type="text/javascript">


</script>
</body>
</html>