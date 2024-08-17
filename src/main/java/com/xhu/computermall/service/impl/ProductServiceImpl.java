package com.xhu.computermall.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.computermall.dao.mapper.FavoriteMapper;
import com.xhu.computermall.dao.mapper.ItemMapper;
import com.xhu.computermall.dao.mapper.ProductMapper;
import com.xhu.computermall.dao.model.Favorite;
import com.xhu.computermall.dao.model.Item;
import com.xhu.computermall.dao.model.Product;
import com.xhu.computermall.dao.model.TOrder;
import com.xhu.computermall.dao.model.User;
import com.xhu.computermall.service.OrderService;
import com.xhu.computermall.service.ProductService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;
	@Autowired
	private FavoriteMapper favMapper;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ItemMapper itemMpper;

	@Override
	public void saveProduct(Product product) {
		mapper.insertSelective(product);
	}

	@Override
	public void updateProduct(Product product) {
		mapper.updateByPrimaryKeySelective(product);
	}

	@Override
	public void deleteProduct(Integer uid) {
		Product p = mapper.selectByPrimaryKey(uid);
		p.setStatus(-1);
		mapper.updateByPrimaryKeySelective(p);
	}

	@Override
	public List<Product> findProducts(int start, int end) {
		Example example = new Example(Product.class);
//		Criteria crt = example.createCriteria();
//		crt.andEqualTo("", "");
		example.orderBy("publishTime").desc();
		return mapper.selectByExampleAndRowBounds(example, new RowBounds(start, end));
	}

	@Override
	public Integer findProductCount() {
		return mapper.selectCount(new Product());
	}

	@Override
	public Product findProduct(Integer uid) {
		return mapper.selectByPrimaryKey(uid);
	}

	@Override
	public List<Product> findProductByCategory(Integer cat, int start, int end) {
		Example record = new Example(Product.class);
		Criteria crt = record.createCriteria();
		if(cat != null) {			
			crt.andEqualTo("category", cat);
		}
		crt.andEqualTo("status", 1);
		record.orderBy("publishTime").desc();
		return mapper.selectByExampleAndRowBounds(record, new RowBounds(start, end));
	}

	@Override
	public Integer findProductCountByCategory(Integer cat) {
		Example record = new Example(Product.class);
		Criteria crt = record.createCriteria();
		if(cat != null) {			
			crt.andEqualTo("category", cat);
		}
		crt.andEqualTo("status", 1);
		return mapper.selectCountByExample(record);
	}

	@Override
	public List<Product> findHotProduct() {
		Example record = new Example(Product.class);
		Criteria crt = record.createCriteria();
		crt.andEqualTo("status", 1);
		record.orderBy("saleCount").desc();
		return mapper.selectByExampleAndRowBounds(record, new RowBounds(0, 8));
	}

	@Override
	public List<Product> findNewProduct() {
		Example record = new Example(Product.class);
		Criteria crt = record.createCriteria();
		crt.andEqualTo("status", 1);
		record.orderBy("publishTime").desc();
		return mapper.selectByExampleAndRowBounds(record, new RowBounds(0, 8));
	}

	@Override
	public List<Product> findMyFavs(User user) {
		Favorite fav = new Favorite();
		fav.setUserId(user.getUserId());
		List<Favorite> favs = favMapper.select(fav);
		List<Product> products = new ArrayList<>();
		for (Favorite f : favs) {
			products.add(mapper.selectByPrimaryKey(f.getProductId()));
		}
		return products;
	}

	@Override
	public List<Product> findRecommendProducts(int pid) {
		Item record = new Item();
		record.setProductId(pid);
		List<Item> itemList = itemMpper.select(record);
		List<TOrder> torders = new ArrayList<>();
		for (Item item : itemList) {
			torders.add(orderService.findOrderById(item.getOrderId()));
		}
		List<Product> tmp = new ArrayList<>();
		for (TOrder order : torders) {
			Item record2 = new Item();
			record2.setOrderId(order.getOrderId());
			List<Item> itemList2 = itemMpper.select(record2);
			for (Item item : itemList2) {
				if(item.getProductId() == pid) {
					continue;
				}
				tmp.add(this.findProduct(item.getProductId()));
			}
		}
		Collections.shuffle(tmp);
		return tmp;
	}

}
