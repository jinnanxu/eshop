<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl>
			<dt><i class="Hui-iconfont" style="font-size: 18px;">&#xe620;&nbsp;</i>&nbsp;商品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="/mall/admin/productmgr" title="">商品列表</a></li>
					<li><a href="/mall/admin/toaddproduct" title="">商品上架</a></li>
					<li><a href="/mall/admin/categorymgr" title="">分类管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt><i class="Hui-iconfont" style="font-size: 18px;">&#xe627;&nbsp;</i>&nbsp;订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="/mall/admin/ordermgr" title="">订单列表</a></li>
					<li><a href="/mall/admin/expmgr" title="">物流信息</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt><i class="Hui-iconfont" style="font-size: 18px;">&#xe60d;&nbsp;</i>&nbsp;用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="/mall/admin/usermgr" title="">用户列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt><i class="Hui-iconfont" style="font-size: 18px;">&#xe62e;&nbsp;</i>&nbsp;管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="/mall/admin/adminprofiole" title="">我的信息</a></li>
					<li><a href="/mall/admin/adminmgr" title="">管理员列表</a></li>
					<li><a href="/mall/admin/toaddadmin" title="">新增管理员</a></li>
				</ul>
			</dd>
		</dl>

	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>