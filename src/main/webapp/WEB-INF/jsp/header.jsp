<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<header id="header">
	<div class="center">
		<a href="/mall/index"><h1 class="logo">购物网</h1></a>
		<nav class="link">
			<h2 class="none">网站导航</h2>
			<ul id="userInfo">
				<!-- <li><a href="/mall/index">首页</a></li> -->
				<li><a href="/mall/categorys">商品分类</a></li>
				<li><a href="/mall/buy/cart">购物车</a></li>
				<li><a href="/mall/order/myorders">我的订单</a></li>
				<li><a href="/mall/myfav">我的收藏</a></li>
				<li><a href="/mall/profile">个人信息</a></li>
				<c:choose>
					<c:when test="${sessionScope.currUser ne null }">
						<li><a href="/mall/logout" class="">登出</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/mall/tologin">登录&nbsp;</a></li>
						<li><a href="/mall/toreg">注册</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</header>