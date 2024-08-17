<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>商品评论-电脑配件在线销售平台</title>
	<jsp:include page="meta.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper-3.4.2.min.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="" class="index-section">
	<form action="publishComment" method="post">
	<section class="comment">
		<h4 style="color: #087eff;">选择要评论的商品</h4>
		<div>
			<select name="pid" style="height: 32px;">
				<c:forEach items="${products }" var="p">
					<option value="${p.productId }">${p.name }</option>
				</c:forEach>
			</select>
		</div>
	</section>	
	<section class="comment">
		<h4 style="color: #087eff;">请输入评论内容</h4>
		<ul>
			<c:if test="${sessionScope.currUser eq null }">
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
					<%-- <div class="user-info">
						<p class="user-name">${sessionScope.currUser.nickName }<p>
						<p class="ptime">${sessionScope.currUser.mobile }</p>
					</div> --%>
					<div class="comment-cnt">
						<textarea rows="3" cols="70" name="content"></textarea>
						<input type="hidden" name="oid" value="${oid }">
					</div>
					<div class="submit-btn"><input type="submit" class="btn btn-primary btn-lg" value="发表评论"></div>
				</li>
			</c:if>
		</ul>
	</section>
	</form>
</div>


<footer id="footer">
	<div class="bottom">Copyright © 电脑配件在线销售平台 | 浙ICP 备120110119 号| 经营许可证：L-YC-BK12345</div>
</footer>
<script src="${pageContext.request.contextPath}/lib/swiper-3.4.2.jquery.min.js"></script>
<script type="text/javascript">


</script>
</body>
</html>