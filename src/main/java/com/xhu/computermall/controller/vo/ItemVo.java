package com.xhu.computermall.controller.vo;

import com.xhu.computermall.dao.model.Item;
import com.xhu.computermall.dao.model.Product;

public class ItemVo {

	private Item item;
	private Product product;
	
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
}
