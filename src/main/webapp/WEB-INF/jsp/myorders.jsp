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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.css" />
	<link href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
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
		#container .ticket td{
			padding: 2px 0;
			height: 20px;
		    line-height: 20px;
		    border: 1px solid #ddd;
		    text-align: center;
		    font-size: 12px;
		}
		
	</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="container">
	<div class="list ticket" style="">
			<h3 style="text-align: left; padding: 0; margin: 0; padding-left: 8px; border-left: 8px solid #2ca6e0;">我的订单</h3>
			<div class="form" style="padding-top: 10px;">
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
									<a href="/mall/order/orderdetail?oid=${r.order.orderId }"><button class="btn btn-primary btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe695;</i>&nbsp;详情</button></a>
									<c:if test="${r.order.status eq 1}">
									<a href="/mall/buy/topay?oid=${r.order.orderId }"><button class="btn btn-success btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe719;</i>&nbsp;支付</button></a>
									</c:if>
									<c:if test="${r.order.status eq 1}">
									<button class="btn btn-danger btn-sm" onclick="delcfm(${r.order.orderId }, -1);"><i class="Hui-iconfont" style="color: #fff;">&#xe6a6;</i>&nbsp;取消</button>
									</c:if>
									<c:if test="${r.order.status eq 3}">
										<button class="btn btn-success btn-sm" onclick="delcfm(${r.order.orderId }, 4);"><i class="Hui-iconfont" style="color: #fff;">&#xe6a7;</i>&nbsp;确认收货</button>
									</c:if>
									<c:if test="${r.order.status eq 4}">
										<a href="/mall/order/tocomment?oid=${r.order.orderId }"><button class="btn btn-success btn-sm"><i class="Hui-iconfont" style="color: #fff;">&#xe686;</i>&nbsp;评论</button></a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p align="right" style="font-size: 12px;">
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
	</div>
</div>
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

<footer id="footer">
	<div class="bottom">Copyright © 电脑配件在线销售平台 | 浙ICP 备120110119 号| 经营许可证：L-YC-BK12345</div>
</footer>
<script type="text/javascript">
	function delcfm(rid, status) {  
	    $('#url').val("/mall/order/cancel?oid="+rid+"&status="+status);//给会话中的隐藏属性URL赋值
	    var msg = '确定取消该订单？';
	    if(status==4){
			msg = '确定已收货？';
		}  
	    layer.confirm(msg, {icon: 3, title:'提示'}, 
	    	    function(index){
	    			urlSubmit();
	        		layer.close(index);
	        	}
			);
	}  
	function urlSubmit(){  
	 var url=$.trim($("#url").val());//获取会话中的隐藏属性URL  
	 window.location.href=url;    
	}  
</script>
</body>
</html>