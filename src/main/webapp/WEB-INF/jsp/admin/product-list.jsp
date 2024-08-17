<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../include/_meta.jsp"></jsp:include>
<title>电脑配件在线商城后台管理系统</title>
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
		商品管理
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="Hui-article">
		<article class="cl pd-20 container" style="padding-top: 0; width: 95%;">
			<a href="toaddproduct"><button class="btn btn-success btn-xs mt-20"><i class="Hui-iconfont" style="color: #fff;">&#xe642;</i>&nbsp;上传商品</button></a>
			<div class="mt-10">
				<table id="example" class="table table-bordered table-hover">
					<tbody>
						<tr class="info">
							<th></th>
							<th>商品名称</th>
							<th>类别</th>
							<th>上架日期</th>
							<th>单价(元)</th>
							<th>库存</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.records }" var="r" varStatus="row">
							<tr>
								<td>
									<c:if test="${not empty r.product.pic && !(r.product.pic eq null)  }"><img alt="" src="${r.product.pic }" width="50px" height="50px"></c:if>
								</td>
								<td>${r.product.name }</td>
								<td>${r.category.name }</td>
								<td><fmt:formatDate value="${r.product.publishTime}" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatNumber value="${r.product.price }" pattern="#,#00.00#"/></td>
								<td>${r.product.quantity }</td>
								<td>
									<c:if test="${r.product.status eq 1}"><span class="c-success">正常</span></c:if>
									<c:if test="${r.product.status eq -1}"><span class="c-warning">已下架</span></c:if>
								</td>
								<%-- <td><p class="longtxt" title="${r.content }">${r.content }</p></td> --%>
								<td>
									<a href="/mall/admin/pdetail?mid=${r.product.productId }"><button class="btn btn-success btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe695;</i>&nbsp;详情</button></a>
									<a href="/mall/admin/toupdateproduct?mid=${r.product.productId }"><button class="btn btn-primary btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe60c;</i>&nbsp;修改</button></a>
									<c:if test="${r.product.status eq 1}">
									<a href="#" onclick="delcfm(${r.product.productId}, -1);"><button class="btn btn-danger btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe6de;</i>&nbsp;下架</button></a>
									</c:if>
									<c:if test="${r.product.status eq -1}">
									<a href="#" onclick="delcfm(${r.product.productId}, 1);"><button class="btn btn-success btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe6dc;</i>&nbsp;上架</button></a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p align="right">
				<font >当前页:第${pageView.currentpage}页 | 总记录数:${pageView.totalrecord}条 | 每页显示:${pageView.maxresult}条 | 总页数:${pageView.totalpage}页</font>　
				 <c:choose>
				<c:when test="${pageView.currentpage==1}"><font color="#FFFFFF">第1页</font></c:when>
				<c:otherwise><a href="/mall/admin/productmgr?currentpage=1">第1页</a></c:otherwise>
				</c:choose>
				<c:if test="${pageView.currentpage>2}"><a href="/mall/admin/productmgr?currentpage=${pageView.currentpage-1}">上一页</a></c:if>
				<c:if test="${pageView.currentpage!=1&&pageView.currentpage!=pageView.totalpage}"><b><font>第${pageView.currentpage}页</font></b></c:if>
				<c:if test="${pageView.currentpage<pageView.totalpage}"><a href="/mall/admin/productmgr?currentpage=${pageView.currentpage+1}">下一页</a></c:if>
				<c:choose>
				<c:when test="${pageView.currentpage<pageView.totalpage}"><a href="/mall/admin/productmgr?currentpage=${pageView.totalpage}">末页</a></c:when>
				<c:otherwise><font color="#FFFFFF">末页</font></c:otherwise>
				</c:choose>
				<br/></p>
			</div>
		</article>
	</div>
</section>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="../../include/_footer.jsp"></jsp:include>
<!--/_footer /作为公共模版分离出去-->
<!-- 信息删除确认 -->  
<div class="modal fade" id="delcfmModel">  
  <div class="modal-dialog">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title">提示信息</h4>  
      </div>  
      <div class="modal-body">  
        <p id="msgTip"></p>  
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="url"/>  
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
         <a  onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>  
      </div>  
    </div><!-- /.modal-content -->  
  </div><!-- /.modal-dialog -->  
</div><!-- /.modal --> 

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
	function delcfm(rid, status) {  
		if(status == -1){
			$("#msgTip").text("确定下架该商品？");
		}else if(status == 1){
			$("#msgTip").text("确定上架该商品？");
		}
	    $('#url').val("/mall/admin/deleteproduct?mid="+rid+"&status="+status);//给会话中的隐藏属性URL赋值  
	    $('#delcfmModel').modal();  
	}  
	function urlSubmit(){  
	 var url=$.trim($("#url").val());//获取会话中的隐藏属性URL  
	 window.location.href=url;    
	}  
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>