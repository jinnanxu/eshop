package com.xhu.computermall.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.computermall.dao.mapper.CartMapper;
import com.xhu.computermall.dao.model.Cart;
import com.xhu.computermall.dao.model.Product;
import com.xhu.computermall.dao.model.User;
import com.xhu.computermall.service.CartService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public void addToCart(int productId, HttpSession session) {
		User user = (User) session.getAttribute("currUser");
		Cart record = new Cart();
		record.setProductId(productId);
		record.setUserId(user.getUserId());
		List<Cart> existCart = cartMapper.select(record );
		if(existCart.size() > 0) {
			Cart cart = existCart.get(0);
			cart.setQuantity(cart.getQuantity()+1);
			cartMapper.updateByPrimaryKeySelective(cart);
		}else {
			Cart cart = new Cart();
			cart.setQuantity(1);
			cart.setProductId(productId);
			cart.setUserId(user.getUserId());
			cartMapper.insertSelective(cart);
		}
	}

	@Override
	public void modifyCart(int cartId, int quantity) {
		Cart cart = cartMapper.selectByPrimaryKey(cartId);
		if(quantity > 0) {
			cart.setQuantity(cart.getQuantity()+1);
		}else {			
			cart.setQuantity(cart.getQuantity()-1);
		}
		cartMapper.updateByPrimaryKeySelective(cart);
	}

	@Override
	public List<Cart> loadCart(int userId) {
		Example record = new Example(Cart.class);
		Criteria crt = record.createCriteria();
		crt.andEqualTo("userId", userId);
		record.orderBy("cartId").desc();
		return cartMapper.selectByExample(record);
	}

	@Override
	public Cart selectCartById(Integer cartId) {
		return cartMapper.selectByPrimaryKey(cartId);
	}

	@Override
	public void removeCart(int cartId) {
		cartMapper.deleteByPrimaryKey(cartId);
	}

}
