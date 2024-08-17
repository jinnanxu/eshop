package com.xhu.computermall.controller.vo;

import java.util.List;

import com.xhu.computermall.dao.model.Category;
import com.xhu.computermall.dao.model.Product;

public class ProductVo {

	private Product product;
	private List<CommentVo> comments;
	private Category category;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public List<CommentVo> getComments() {
		return comments;
	}
	public void setComments(List<CommentVo> comments) {
		this.comments = comments;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
}
