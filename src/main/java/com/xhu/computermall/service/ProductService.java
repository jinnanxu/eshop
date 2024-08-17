package com.xhu.computermall.service;

import java.util.List;

import com.xhu.computermall.dao.model.Product;
import com.xhu.computermall.dao.model.User;

public interface ProductService {

	List<Product> findProductByCategory(Integer cat, int start, int end);
	
	Integer findProductCountByCategory(Integer cat);
	
	void saveProduct(Product product);
	
	void updateProduct(Product product);
	
	void deleteProduct(Integer uid);
	
	List<Product> findProducts(int start, int end);
	
	Integer findProductCount();
	
	Product findProduct(Integer uid);
	
	/**
	 * 根据销量查找热门商品
	 * @return
	 */
	List<Product> findHotProduct();
	
	List<Product> findNewProduct();

	List<Product> findMyFavs(User user);
	
	/**
	 * 查找推荐商品
	 * @param pid
	 * @return
	 */
	List<Product> findRecommendProducts(int pid);
}
