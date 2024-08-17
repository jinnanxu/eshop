<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../include/_meta.jsp"></jsp:include>
<title>电脑配件在线商城后台管理系统</title>
<style>
#editor .w-e-text-container{
	height: 150px !important;
}
.form-horizontal .form-group{
	margin-left: 0 !important;
}
</style>
</head>
<body>
<!--_header 作为公共模版分离出去-->
<jsp:include page="../../include/admin_header.jsp"></jsp:include>
<!--/_header 作为公共模版分离出去-->
<!--_menu 作为公共模版分离出去-->
<jsp:include page="../../include/admin_menu.jsp"></jsp:include>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>
		订单信息管理
		<span class="c-gray en">&gt;</span>
		发货
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="Hui-article">
		<article class="cl pd-20" style="width:80%;">
		<form action="sendOrder" method="post" class="form form-horizontal">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">订单号：</label>
				<div class="formControls col-xs-8 col-sm-9">${vo.order.orderCode }
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">预订时间：</label>
				<div class="formControls col-xs-8 col-sm-9"><fmt:formatDate value="${vo.order.orderTime}" pattern="yyyy-MM-dd HH:mm"/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">订单总额：</label>
				<div class="formControls col-xs-8 col-sm-9"><strong class="c-warning"><fmt:formatNumber value="${vo.order.totalPrice }" pattern="#,#00.00#"/></strong>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">订单状态：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<c:if test="${vo.order.status eq -1}">
						<span class="badge badge-default  radius">已取消</span>
					</c:if>
					<c:if test="${vo.order.status eq 1}">
						<span class="badge badge-warning radius">待支付</span>
					</c:if>
					<c:if test="${vo.order.status eq 2}">
						<span class="badge badge-primary radius">已支付</span>&nbsp;
						<span class="badge badge-warning radius">待发货</span>
					</c:if>
					<c:if test="${vo.order.status eq 3}">
						<span class="badge badge-success radius">已发货</span>
					</c:if>
					<c:if test="${vo.order.status eq 4}">
						<span class="badge badge-default  radius">已完成</span>
					</c:if>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">收货人：</label>
				<div class="formControls col-xs-8 col-sm-9">${vo.order.receiveName }
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">收货地址：</label>
				<div class="formControls col-xs-8 col-sm-9">${vo.order.fullAddress }
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">手机号：</label>
				<div class="formControls col-xs-8 col-sm-9">${vo.order.mobile }
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">订单备注：</label>
				<div class="formControls col-xs-8 col-sm-9">${vo.order.remark }
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">快递单号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="请输入快递单号" id="" name="expressNo">
				</div>
			</div>
			
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<a class="btn btn-success radius" type="submit" href="javascript: window.history.go(-1);">&nbsp;&nbsp;返回&nbsp;&nbsp;</a>
					<input type="hidden" name="oid" value="${vo.order.orderId }">
					<input class="btn btn-success radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</article>
	</div>
</section>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="../../include/_footer.jsp"></jsp:include>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>