package com.xhu.computermall.controller.vo;

import com.xhu.computermall.dao.model.Express;
import com.xhu.computermall.dao.model.TOrder;

public class ExpressVo {

	private Express exp;
	private TOrder order;
	
	public Express getExp() {
		return exp;
	}
	public void setExp(Express exp) {
		this.exp = exp;
	}
	public TOrder getOrder() {
		return order;
	}
	public void setOrder(TOrder order) {
		this.order = order;
	}
	
}
