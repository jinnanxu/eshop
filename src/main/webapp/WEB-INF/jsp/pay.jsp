<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<title>电脑配件在线销售平台</title>
	<jsp:include page="meta.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/column.css">
	<style type="text/css">
		#container #submit-btn{
			font-size: 16px;
		    height: 35px;
		    line-height: 35px;
		    width: 100px;
		}
		#container .form input{
			font-size: 16px;
		}
		#container .form textarea {
		    width: 250px;
		    background-color: #fff;
		    border-radius: 4px;
		    border: 1px solid #ccc;
		    color: #666;
		    padding: 5px;
		    margin: 0 0 0 16px;
		    font-size: 18px;
		    line-height: 25px;
		}
	</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="container">
	<div class="list ticket" style="">
			<h3 style="height: auto;">订单已生成，请扫码支付：<span style="color:#f90;"><fmt:formatNumber value="${total }" pattern="#,#00.00#"/></span>元</h3>
			<div class="form" style="padding-top: 20px;">
				<div>
					<img alt="" src="/mall/images/pay.jpg" width="250">
				</div>
				<p>
					<label for="">&nbsp; </label>
				</p>
				<p>
					<a href="/mall/buy/pay?oid=${oid }"><button class="submit" id="submit-btn">已支付</button></a>
				</p>
				<p>
					<label for="">&nbsp; </label>
				</p>
				<p>
					<label for="">&nbsp; </label>
				</p>
			</div>
	</div>
</div>

<footer id="footer">
	<div class="bottom">Copyright © 电脑配件在线销售平台 | 浙ICP 备120110119 号| 经营许可证：L-YC-BK12345</div>
</footer>

</body>
</html>