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
	<div class="list ticket" style="height: 450px;">
		<form action="submitOrder" method="post">
			<h3 style="height: auto;">填写收货地址</h3>
			<div class="form" style="padding-top: 20px;">
				<p>
					<label for="from_city" style="font-size: 16px; font-weight: normal;">收货人</label>
					<input type="text" name="reciever" id="" placeholder="" autocomplete="off">
				</p>
				<p>
					<label for="from_city" style="font-size: 16px; font-weight: normal;">手机号码</label>
					<input type="text" name="mobile" id="" placeholder="" autocomplete="off">
				</p>
				<p>
					<label for="from_city" style="font-size: 16px; font-weight: normal;vertical-align: top;">收货地址</label>
					<textarea rows="2" cols="20" name="address"></textarea>
				</p>
				<p>
					<label for="from_city" style="font-size: 16px; font-weight: normal;vertical-align: top;">备注</label>
					<textarea rows="2" cols="20" name="remark"></textarea>
				</p>
				<p>
					<label for="">&nbsp; </label>
					<button type="submit" class="submit" id="submit-btn">提交</button>
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