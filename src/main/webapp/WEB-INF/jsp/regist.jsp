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
	<div class="list ticket" style="height: 450px;">
		<form action="regist" method="post">
			<h2 style="height: auto;">用户注册</h2>
			<div class="form" style="padding-top: 20px;">
				<p>
					<label for="from_city">手机号码</label>
					<input type="text" name="mobile" id="" placeholder="" autocomplete="off">
				</p>
				<p>
					<label for="from_city">昵称</label>
					<input type="text" name="nickName" id="" placeholder="" autocomplete="off">
				</p>
				<p>
					<label for="from_date">性别</label>
					<select class="" name="gender">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</p>
				<p>
					<label for="from_city">电子邮箱</label>
					<input type="text" name="email" id="" placeholder="" autocomplete="off">
				</p>
				<p>
					<label for="to_date">密码 </label>
					<input type="password" name="pwd" id="" placeholder="">
				</p>
				<p>
					<label for="">&nbsp; </label>
					<button type="submit" class="submit">注册</button>
				</p>
				<p>
					<label for="">&nbsp; </label>
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