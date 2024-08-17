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
	<style type="text/css">
		#container .ticket article{
		    text-align: left;
		    color: #666;
		    font-size: 14px;
		}
		#container .ticket .form-label{
			text-align: right;
		}
	</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="container">
	<div class="list ticket" style="">
			<h3 style="text-align: left; padding: 0; margin: 0; padding-left: 8px; border-left: 8px solid #2ca6e0;">订单详情</h3>
			<article class="cl pd-20" style="width:80%;">
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
						<c:if test="${vo.order.status ge 4}">
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
					<label class="form-label col-xs-4 col-sm-3">商品列表：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<c:forEach items="${vo.itemVos }" var="ivo">
							<p>${ivo.product.name }：<strong class="c-warning">${ivo.item.price  }</strong><strong>*${ivo.item.qutity }</strong></p>						
						</c:forEach>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">物流信息：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<c:if test="${vo.order.expNo eq null }">无物流信息</c:if>
						<c:if test="${vo.order.expNo ne null }">
							<c:forEach items="${expList }" var="r" varStatus="row">
								<p>
									<span style="color: #999;"><fmt:formatDate value="${r.exp.expTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									<span>${r.exp.currLocation }</span>
								</p>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<a class="btn btn-success radius" type="submit" href="javascript: window.history.go(-1);">&nbsp;&nbsp;返回&nbsp;&nbsp;</a>
					</div>
				</div>
		</article>
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
	    layer.confirm('确定取消该订单？', {icon: 3, title:'提示'}, 
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