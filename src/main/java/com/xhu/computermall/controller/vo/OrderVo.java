package com.xhu.computermall.controller.vo;

import java.util.List;

import com.xhu.computermall.dao.model.Item;
import com.xhu.computermall.dao.model.TOrder;
import com.xhu.computermall.dao.model.User;

public class OrderVo {

	private TOrder order;
	private User user;
	private List<ItemVo> itemVos;
	private String productStr;
	
	public TOrder getOrder() {
		return order;
	}
	public void setOrder(TOrder order) {
		this.order = order;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<ItemVo> getItemVos() {
		return itemVos;
	}
	public void setItemVos(List<ItemVo> itemVos) {
		this.itemVos = itemVos;
	}
	public String getProductStr() {
		return productStr;
	}
	public void setProductStr(String productStr) {
		this.productStr = productStr;
	}
	
}
