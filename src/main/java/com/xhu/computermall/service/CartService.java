package com.xhu.computermall.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.xhu.computermall.dao.model.Cart;

public interface CartService {

	List<Cart> loadCart(int userId);
	
	void addToCart(int productId, HttpSession session);
	
	void modifyCart(int cartId, int quantity);
	
	Cart selectCartById(Integer cartId);
	
	void removeCart(int cartId);
}
