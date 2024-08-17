<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../include/_meta.jsp"></jsp:include>
<title>电脑配件在线商城后台管理系统</title>
<style>
.container #example td{
	font-size: 12px;
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
		订单管理
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="Hui-article">
		<article class="cl pd-20 container" style="padding-top: 0; width: 99%; font-size: 12px;">
			<div class="mt-10">
				<p>&nbsp;</p>
				<div style="width: 300px; float: left; margin-bottom: 8px;">
					<form action="searchOrder" method="post">
					<input type="text" class="input-text" placeholder="请输入订单号" name="orderNo" style="width: 200px;" value="${pname }">
					<button class="btn btn-primary size-S" type="submit"><i class="Hui-iconfont" style="color: #fff;">&#xe665;</i>&nbsp;查询</button>
					</form>
				</div>
				<table id="example" class="table table-bordered table-hover">
					<tbody>
						<tr class="info">
							<th>订单号</th>
							<th>订单时间</th>
							<th>会员手机号</th>
							<th>商品概述</th>
							<th>订单总额(元)</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.records }" var="r" varStatus="row">
							<tr>
								<%-- <td>
									<c:if test="${not empty r.product.pic && !(r.product.pic eq null)  }"><img alt="" src="${r.product.pic }" width="50px" height="50px"></c:if>
								</td> --%>
								<td>${r.order.orderCode }</td>
								<td><fmt:formatDate value="${r.order.orderTime}" pattern="yyyy-MM-dd HH:mm"/></td>
								<td>${r.user.mobile }</td>
								<td><p class="longtxt" title="${r.productStr }" style="width: 120px;">${r.productStr }</p></td>
								<td><strong class=""><fmt:formatNumber value="${r.order.totalPrice }" pattern="#,#00.00#"/></strong></td>
								<td>
									<c:if test="${r.order.status eq -1}">
										<span class="badge badge-default  radius">已取消</span>
									</c:if>
									<c:if test="${r.order.status eq 1}">
										<span class="badge badge-warning radius">待支付</span>
									</c:if>
									<c:if test="${r.order.status eq 2}">
										<span class="badge badge-primary radius">已支付</span><br/>
										<span class="badge badge-warning radius">待发货</span>
									</c:if>
									<c:if test="${r.order.status eq 3}">
										<span class="badge badge-success radius">已发货</span>
									</c:if>
									<c:if test="${r.order.status ge 4}">
										<span class="badge badge-default  radius">已完成</span>
									</c:if>
								</td>
								<td>
									<a href="/mall/admin/orderdetail?oid=${r.order.orderId }"><button class="btn btn-success btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe695;</i>&nbsp;详情</button></a>
									<c:if test="${r.order.status eq 2}">
									<a href="/mall/admin/tosendorder?oid=${r.order.orderId }"><button class="btn btn-primary btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe603;</i>&nbsp;发货</button></a>
									</c:if>
									<c:if test="${r.order.status eq 1}">
									<button class="btn btn-danger btn-sm" onclick="delcfm(${r.order.orderId }, -1);"><i class="Hui-iconfont" style="color: #fff;">&#xe6a6;</i>&nbsp;取消</button>
									</c:if>
									<c:if test="${r.order.status eq 3}">
									<a href="/mall/admin/toupdateexp?oid=${r.order.orderId }"><button class="btn btn-warning btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe603;</i>&nbsp;更新物流</button></a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p align="right">
				<font >当前页:第${pageView.currentpage}页 | 总记录数:${pageView.totalrecord}条 | 每页显示:${pageView.maxresult}条 | 总页数:${pageView.totalpage}页</font>　
				 <c:choose>
				<c:when test="${pageView.currentpage==1}"><!-- <font color="#FFFFFF">第1页</font> --></c:when>
				<c:otherwise><a href="ordermgr?currentpage=1">第1页</a></c:otherwise>
				</c:choose>
				<c:if test="${pageView.currentpage>2}"><a href="ordermgr?currentpage=${pageView.currentpage-1}">上一页</a></c:if>
				<c:if test="${pageView.currentpage!=1&&pageView.currentpage!=pageView.totalpage}"><b><font>第${pageView.currentpage}页</font></b></c:if>
				<c:if test="${pageView.currentpage<pageView.totalpage}"><a href="ordermgr?currentpage=${pageView.currentpage+1}">下一页</a></c:if>
				<c:choose>
				<c:when test="${pageView.currentpage<pageView.totalpage}"><a href="ordermgr?currentpage=${pageView.totalpage}">末页</a></c:when>
				<c:otherwise><!-- <font color="#FFFFFF">末页</font> --></c:otherwise>
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
			$("#msgTip").text("确定取消该订单？");
		}else if(status == 1){
			//$("#msgTip").text("确定上架该商品？");
		}
	    $('#url').val("/mall/admin/updateOrderStatus?oid="+rid+"&status="+status);//给会话中的隐藏属性URL赋值  
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