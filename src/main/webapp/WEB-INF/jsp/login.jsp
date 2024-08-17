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
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div id="container">
	<div class="list ticket" style="height: 450px; margin: 0 auto;">
		<form action="/mall/login" method="post">
			<h2 style="height: auto;">用户登录&nbsp;&nbsp;<span style="color: red;">${msg }</span></h2>
			<div class="form left" style="padding-top: 20px;">
				<p>
					<label for="from_city">手机号</label>
					<input type="text" name="username" id="from_city" placeholder="请输入用户名" autocomplete="off">
				</p>
				<p>
					<label for="to_date">密码 </label>
					<input type="password" name="pwd" id="to_date" placeholder="登录密码">
				</p>
				<p>
					<label for="">&nbsp; </label>
					<button type="submit" class="submit">登录</button>
				</p>
			</div>
		</form>
	</div>
</div>

<footer id="footer">
	<div class="bottom">Copyright © 电脑配件在线销售平台 | 浙ICP 备120110119 号| 经营许可证：L-YC-BK12345</div>
</footer>

</body>
</html>