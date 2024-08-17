<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>${productVo.product.name }-电脑配件在线销售平台</title>
	<jsp:include page="meta.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper-3.4.2.min.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="" class="index-section">
	<section class="product-detail">
		<div class="product-img" style="width: 300px;">		
			<img src="${productVo.product.pic }" alt="" width="220">
		</div>
		<div class="product-meta" style="display: inline-block; width: 590px;">
			<h3 style="padding: 15px 0 5px;">${productVo.product.name }</h3>
			<p style="color: #333; margin-top: 5px;">${productVo.product.subTitle }</p>
			<div class="music-meta">
				<!-- <p><span class="mgray">艺术家：</span></p> -->
				<p><span class="mgray">商品类别：</span>${productVo.category.name }</p>
				<p><span class="mgray">上架日期：</span><fmt:formatDate value="${productVo.product.publishTime}" pattern="yyyy-MM-dd"/></p>
				<p><span class="mgray">库存：</span>${productVo.product.quantity }</p>
				<p><span class="mgray">销量：</span>${productVo.product.saleCount }</p>
				<p><span class="mgray">浏览：</span>${productVo.product.viewCount }次</p>
				<div class="detail-buy">
					<div class="price"><span class="currency">￥</span><fmt:formatNumber value="${productVo.product.price }" pattern="#,#00.00#"/></div>
					<div class="buy-btn" onclick="addCart(${productVo.product.productId });"><i class="Hui-iconfont Hui-iconfont-cart2-selected"></i>&nbsp;加入购物车</div>&nbsp;
					<div class="buy-btn" onclick="addFav(${productVo.product.productId });" style="background: #f90;"><i class="Hui-iconfont Hui-iconfont-cang-selected"></i>&nbsp;收藏</div>
				</div>
			</div>
		</div>
	</section>
	<section class="center" style="margin-top: 20px;">
		<div class="detail" style="    width: 800px; padding: 0 10px; margin: 0 auto; border-top: 1px solid #ddd; line-height: 26px;text-align: justify;">
			${productVo.product.describ }
		</div>
	</section>
	
	<section class="comment">
		<h4 style="color: #087eff;">推荐商品</h4>
		<p style="color: #888;">
			<c:if test="${recProductCnt gt 0 }">
				购买了<span style="color: #f90;">&nbsp;${productVo.product.name }&nbsp;</span>的客户也购买了这些商品：
			</c:if>
			<c:if test="${recProductCnt eq 0 }">
				暂无推荐
			</c:if>
		</p>
		<c:forEach items="${recProduct }" var="vo">
			<figure class="product">
					<a href="/mall/pdetail?id=${vo.productId }">
						<c:if test="${vo.pic ne null }"><img src="${vo.pic }" alt=""></c:if>
						<c:if test="${vo.pic eq null }"><img src="/mall/images/default.png" alt=""></c:if>
					</a>
					<figcaption>
						<p class="title">
							<strong><a href="/mall/pdetail?id=${vo.productId }">${vo.name }</a></strong>
						</p>
						<div class="buy-div">
							<span class="price"><span class="currency">￥</span><fmt:formatNumber value="${vo.price }" pattern="#,#00.00#"/></span>
							<div class="buy-btn" onclick="addCart(${vo.productId });"><i class="Hui-iconfont Hui-iconfont-cart2-selected"></i>加入购物车</div>
						</div>
					</figcaption>
				<%-- <div class="type type-2">${vo.product.subTitle }</div> --%>
			</figure>
		</c:forEach>
	</section>
	
	<section class="comment">
		<h4 style="color: #087eff;">商品评论（${commentCnt }）</h4>
		<form action="publishComment" method="post">
		<ul>
			<%-- <c:if test="${sessionScope.currUser eq null }">
				<li>
				<div class="user-info">
					<p class="user-name">未登录<p>
					<p class="ptime"></p>
				</div>
				<div class="comment-cnt">
					<textarea rows="3" cols="60" name="" disabled="disabled">登录后可以发表评论</textarea>
				</div>
				<div class="submit-btn"><a href="/mall/tologin"><button class="btn btn-warning btn-lg">登录</button></a></div>
			</li>
			</c:if>
			<c:if test="${sessionScope.currUser ne null }">
				<li>
					<div class="user-info">
						<p class="user-name">${sessionScope.currUser.nickName }<p>
						<p class="ptime">${sessionScope.currUser.mobile }</p>
					</div>
					<div class="comment-cnt">
						<textarea rows="3" cols="60" name="content"></textarea>
						<input type="hidden" name="userId" value="${sessionScope.currUser.userId }">
						<input type="hidden" name="mid" value="${productVo.product.musicId }">
					</div>
					<div class="submit-btn"><input type="submit" class="btn btn-primary btn-lg" value="发表评论"></div>
				</li>
			</c:if> --%>
			<c:forEach items="${productVo.comments }" var="row">
				<li style="position: relative;">
					<div class="user-info">
						<p class="user-name">${row.user.nickName }<p>
						<!-- <p class="ptime">13789895555</p> -->
						<p class="ptime"><fmt:formatDate value="${row.comment.publishTime }" pattern="yyyy-MM-dd HH:mm"/></p>
					</div>
					<div class="comment-cnt">
						<p>${row.comment.content }</p>
					</div>
					<div style="position: absolute; right: 10px; top: 10px;">
						<%-- <c:if test="${user ne null }">
							<a href="deleteSecComm?cid=${row.commentId }&sid=${scenic.scenicId }" style="color: red;">删除</a>
						</c:if> --%>
					</div>
				</li>
			</c:forEach>
		</ul>
		</form>
	</section>
</div>


<footer id="footer">
	<div class="bottom">Copyright © 电脑配件在线销售平台 | 浙ICP 备120110119 号| 经营许可证：L-YC-BK12345</div>
</footer>
<script src="${pageContext.request.contextPath}/lib/swiper-3.4.2.jquery.min.js"></script>
<script type="text/javascript">


</script>
</body>
</html>