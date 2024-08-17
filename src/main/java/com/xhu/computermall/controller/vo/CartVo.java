package com.xhu.computermall.controller.vo;

import com.xhu.computermall.dao.model.Cart;
import com.xhu.computermall.dao.model.Product;

public class CartVo {

	private Product product;
	private Cart cart;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
}
