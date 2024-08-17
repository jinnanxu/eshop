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
		商品信息管理
		<span class="c-gray en">&gt;</span>
		商品详情
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="Hui-article">
		<article class="cl pd-20" style="width:80%;">
		<form action="saveMusic" method="post" class="form form-horizontal" onsubmit="return getEditor();" enctype="multipart/form-data">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"></label>
				<div class="formControls col-xs-8 col-sm-9"><img alt="" src="${vo.product.pic }" width="200px">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">所属分类：</label>
				<div class="formControls col-xs-8 col-sm-9">${vo.category.name }
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">商品名称：</label>
				<div class="formControls col-xs-8 col-sm-9">${vo.product.name }
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">副标题：</label>
				<div class="formControls col-xs-8 col-sm-3">${vo.product.subTitle }
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">价格：</label>
				<div class="formControls col-xs-8 col-sm-9"><fmt:formatNumber value="${vo.product.price }" pattern="#,#00.00#"/>元
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">库存：</label>
				<div class="formControls col-xs-8 col-sm-9">${vo.product.quantity }
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">状态：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<c:if test="${vo.product.status eq 1}"><span class="c-success">正常</span></c:if>
					<c:if test="${vo.product.status eq -1}"><span class="c-warning">已下架</span></c:if>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">商品详情：</label>
				<div class="formControls col-xs-8 col-sm-9">${vo.product.describ }
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<a class="btn btn-success radius" type="submit" href="javascript: window.history.go(-1);">&nbsp;&nbsp;返回&nbsp;&nbsp;</a>
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