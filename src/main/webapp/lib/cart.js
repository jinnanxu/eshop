
/**
/ * 加入收藏夹
 * @param pid
 * @returns
 */
function addFav(pid) {
	console.log('dddd', pid)
	var url = '/mall/buy/addFav?productId='+pid
	$.get(
		url,
		{},
		function(data){
			console.log(data)
			if(data.code==401){
				window.location.href='/mall/tologin'
			}else{				
				layer.open({
					type : 0, // 弹窗类型 ：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
					title : [ '提示', 'font-size:14px;' ], // 数组第二项使用任意css代码
					content : '已加入收藏夹' // content属性丰富多样和type取值有关
						
				});
			}
		},
		'json'
	);
}

/**
 * 从收藏夹移除
 * @param pid
 * @returns
 */
function delFav(pid) {
	console.log('dddd', pid)
	var url = '/mall/buy/delFav?productId='+pid
	$.get(
		url,
		{},
		function(data){
			console.log(data)
			if(data.code==401){
				window.location.href='/mall/tologin'
			}else{				
				layer.open({
					type : 0, // 弹窗类型 ：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
					title : [ '提示', 'font-size:14px;' ], // 数组第二项使用任意css代码
					content : '已从收藏夹移除', // content属性丰富多样和type取值有关
					end : function() {
						location.reload();
					}
				});
			}
		},
		'json'
	);
}

/**
/ * 加入购物车
 * @param pid
 * @returns
 */
function addCart(pid) {
	var url = '/mall/buy/addCart?productId='+pid
	$.get(
		url,
		{},
		function(data){
			console.log(data)
			if(data.code==401){
				window.location.href='/mall/tologin'
			}else{
				
			}
		},
		'json'
	);
	layer.open({
		type : 0, // 弹窗类型 ：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
		title : [ '提示', 'font-size:14px;' ], // 数组第二项使用任意css代码
		content : '已加入购物车' // content属性丰富多样和type取值有关
		
	});
}

/**
 * 减少数量
 * @param cartId
 * @returns
 */
function reduceQty(cartId){
	var qty = $("#qty_"+cartId).attr('data-qty');
	console.log(qty);
	if(qty == 1){
		layer.open({
			type : 0, 
			title : [ '提示'], 
			content : '数量不能小于1！' // content属性丰富多样和type取值有关
		});
		return;
	}else{
		var url = '/mall/buy/modifyCart'
		$.post(
			url,
			{cartId: cartId, qty: -1},
			function(data){
				console.log(data)
				if(data.code==401){
					window.location.href='/mall/tologin'
				}else{
					$("#qty_"+cartId).text(data.newQty);
					$("#qty_"+cartId).attr('data-qty', data.newQty);
					$("#amt_"+cartId).text(data.newAmt);
					$("#amt_"+cartId).attr("data-amount", data.newAmt);
					reCompute();
				}
			},
			'json'
		);
	}
}

/**
 * 增加数量
 * @param cartId
 * @returns
 */
function addQty(cartId){
	var url = '/mall/buy/modifyCart'
		$.post(
			url,
			{cartId: cartId, qty: 1},
			function(data){
				console.log(data)
				if(data.code==401){
					window.location.href='/mall/tologin'
				}else{
					$("#qty_"+cartId).text(data.newQty);
					$("#qty_"+cartId).attr('data-qty', data.newQty);
					$("#amt_"+cartId).text(data.newAmt);
					$("#amt_"+cartId).attr("data-amount", data.newAmt);
					reCompute();
				}
			},
			'json'
		);
}

function reCompute(){
	var chk_value =[];//定义一个数组
	$('input[name="selCart"]:checked').each(function(){//遍历每一个名字为nodes的复选框，其中选中的执行函数
		chk_value.push($(this).val());//将选中的值添加到数组chk_value中
	});
	var selectId = chk_value.join(",");
	console.log(selectId);
	var total=0;
	for(var i=0; i<chk_value.length; i++){
		var cartId=chk_value[i]
		var amt = parseFloat($("#amt_"+cartId).attr("data-amount"));
		total=total+amt
	}
	console.log(total);
	$("#totalAmount").text(total.toFixed(1))
}

function checkCart(){
	var chk_value =[];//定义一个数组
	$('input[name="selCart"]:checked').each(function(){//遍历每一个名字为nodes的复选框，其中选中的执行函数
		chk_value.push($(this).val());//将选中的值添加到数组chk_value中
	});
	if(chk_value.length == 0){		
		layer.open({
			type : 0, 
			title : [ '提示'], 
			content : '未勾选任何商品！' // content属性丰富多样和type取值有关
		});
		return false;
	}
	return true;
}