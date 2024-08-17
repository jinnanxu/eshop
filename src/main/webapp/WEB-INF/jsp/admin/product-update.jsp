<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../include/_meta.jsp"></jsp:include>
<title>电脑配件在线商城后台管理系统</title>
<style>
#editor .w-e-text-container{
	height: 350px !important;
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
		更新商品
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="Hui-article">
		<article class="cl pd-20" style="width:80%;">
		<form action="updateProduct" method="post" class="form form-horizontal" onsubmit="return getEditor();" enctype="multipart/form-data">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">分类：</label>
				<div class="formControls col-xs-8 col-sm-3">
					<select name="category" style="height: 30px; line-height: 30px;" class="input-text">
							<c:forEach items="${categorys }" var="cat">
							<option value="${cat.categoryId }" <c:if test="${cat.categoryId eq vo.product.category }">selected="selected"</c:if>>${cat.name }</option>
							</c:forEach>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">商品名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${vo.product.name }" placeholder="" id="" name="name">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">副标题：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${vo.product.subTitle }" placeholder="" name="subTitle">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">主图：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="btn-upload form-group">
					  <input class="input-text upload-url radius" type="text" name="uploadfile-1" id="uploadfile-1" readonly><a href="javascript:void();" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe642;</i>&nbsp;浏览文件</a>
					  <input type="file" multiple name="file" class="input-file" accept="image/gif,image/png,image/jpeg">
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">价格：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${vo.product.price }" placeholder="" name="price">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">库存：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${vo.product.quantity }" placeholder="" name="quantity">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">商品详情：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<div id="editor">${vo.product.describ }</div>
					<input type="hidden" id="content" name="describ">
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input type="hidden" name="status" value="${vo.product.status }">
					<input type="hidden" name="productId" value="${vo.product.productId }">
					<input class="btn btn-success radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
					<input class="btn btn-primary radius" type="reset" value="&nbsp;&nbsp;重设&nbsp;&nbsp;">
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
<script>
//JavaScript代码区域
var E = window.wangEditor
var editor = new E('#editor'); // 两个参数也可以传入 elem 对象，class 选择器
//开启debug模式
editor.customConfig.debug = true;
// 关闭粘贴内容中的样式
editor.customConfig.pasteFilterStyle = false
// 忽略粘贴内容中的图片
editor.customConfig.pasteIgnoreImg = true
// 使用 base64 保存图片
//editor.customConfig.uploadImgShowBase64 = true

// 上传图片到服务器
editor.customConfig.uploadFileName = 'myFile'; //设置文件上传的参数名称
editor.customConfig.uploadImgServer = '/mall/upload'; //设置上传文件的服务器路径
editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024; // 将图片大小限制为 3M
editor.customConfig.menus =[
    'head',  // 标题
    'bold',  // 粗体
    'fontSize',  // 字号
    'fontName',  // 字体
    'italic',  // 斜体
    'underline',  // 下划线
    'strikeThrough',  // 删除线
    'foreColor',  // 文字颜色
    'backColor',  // 背景颜色
    'link',  // 插入链接
    'image',  // 插入图片
    'list',  // 列表
    'justify',  // 对齐方式
    'table',  // 表格
    'undo',  // 撤销
    'redo'  // 重复
];
//自定义上传图片事件
editor.customConfig.uploadImgHooks = {
	before : function(xhr, editor, files) {
		
	},
	success : function(xhr, editor, result) {
		console.log("上传成功");
	},
	fail : function(xhr, editor, result) {
		console.log("上传失败,原因是"+result);
	},
	error : function(xhr, editor) {
		console.log("上传出错");
	},
	timeout : function(xhr, editor) {
		console.log("上传超时");
	}
}

editor.create()

function getEditor(){
	var content = editor.txt.html();
	$("#content").val(content);
	return true;
}

	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  //执行一个laydate实例
	  laydate.render({
	    elem: '#endtime' //指定元素
	   	,type: 'datetime'
	    ,format: 'yyyy-MM-dd HH:mm' //可任意组合
	  });
	});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>