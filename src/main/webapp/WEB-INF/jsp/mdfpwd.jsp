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
		<form action="mdfpwd" method="post" onsubmit="return checkPwd();">
			<h2 style="height: auto;">修改密码</h2>
			<div class="form" style="padding-top: 20px;">
				<p>
					<label for="from_city">手机号码</label>
					<input type="text" name="" id="" value="${user.mobile }" disabled="disabled">
				</p>
				<p>
					<label for="from_city">昵称</label>
					<input type="text" name="" id="" value="${user.nickName }"  disabled="disabled">
				</p>
				<p>
					<label for="to_date">新密码 </label>
					<input type="password" name="pwd" id="pwd1">
				</p>
				<p>
					<label for="to_date">确认密码 </label>
					<input type="password" id="pwd2">
				</p>
				<p>
					<label for="">&nbsp; </label>
					<a href="#" onclick="javascript: history.go(-1);"><button class="btn btn-warning">返回</button></a>
					<a href="tomdfpwd"><button class="btn btn-primary">修改密码</button></a>
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
<script type="text/javascript">
function checkPwd(){
	var p1 = $("#pwd1").val();
	var p2 = $("#pwd2").val();
	if(p1 != p2){
		alert("两次输入的密码不一致！");
		return false;
	}else{
		return true;
	}
}
</script>
</body>
</html>