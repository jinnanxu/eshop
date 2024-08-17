package com.xhu.computermall.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.computermall.controller.vo.ItemVo;
import com.xhu.computermall.controller.vo.OrderVo;
import com.xhu.computermall.dao.mapper.CartMapper;
import com.xhu.computermall.dao.mapper.CommentMapper;
import com.xhu.computermall.dao.mapper.ExpressMapper;
import com.xhu.computermall.dao.mapper.ItemMapper;
import com.xhu.computermall.dao.mapper.ProductMapper;
import com.xhu.computermall.dao.mapper.TOrderMapper;
import com.xhu.computermall.dao.mapper.UserMapper;
import com.xhu.computermall.dao.model.Cart;
import com.xhu.computermall.dao.model.Comment;
import com.xhu.computermall.dao.model.Express;
import com.xhu.computermall.dao.model.Item;
import com.xhu.computermall.dao.model.Product;
import com.xhu.computermall.dao.model.TOrder;
import com.xhu.computermall.dao.model.User;
import com.xhu.computermall.service.OrderService;
import com.xhu.utils.TimeNumberUtils;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private TOrderMapper mapper;
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private ItemMapper itemMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ExpressMapper expMapper;
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public Integer generateOrder(String[] cartIds, User user, TOrder order) {
		order.setUserId(user.getUserId());
		order.setOrderTime(new Date());
		order.setStatus(1);
		order.setOrderCode(TimeNumberUtils.getLocalTrmSeqNum());
		mapper.insertSelective(order);
		double totalPrice = 0;
		for(int i=0; i<cartIds.length; i++) {
			Integer cid = Integer.parseInt(cartIds[i]);
			Cart cart = cartMapper.selectByPrimaryKey(cid);
			Product p = productMapper.selectByPrimaryKey(cart.getProductId());
			Item item = new Item();
			item.setIscomment(0);
			item.setOrderId(order.getOrderId());
//			item.setPrice(cart.getQuantity()*p.getPrice());
			item.setQutity(cart.getQuantity());
			item.setProductId(cart.getProductId());
			item.setPrice(p.getPrice());
			itemMapper.insertSelective(item);
			totalPrice+=item.getPrice();
			cartMapper.deleteByPrimaryKey(cid);
			p.setSaleCount(p.getSaleCount()+1);
			productMapper.updateByPrimaryKeySelective(p);
		}
		order.setTotalPrice(totalPrice);
		mapper.updateByPrimaryKeySelective(order);
		return order.getOrderId();
	}

	@Override
	public TOrder findOrderById(Integer tid) {
		return mapper.selectByPrimaryKey(tid);
	}

	@Override
	public OrderVo findOrderVoById(Integer tid) {
		TOrder to = this.findOrderById(tid);
		OrderVo vo = new OrderVo();
		vo.setOrder(to);
		User user = userMapper.selectByPrimaryKey(to.getUserId());
		vo.setUser(user);
		List<ItemVo> itemVos = new ArrayList<>();
		Item itemRecord = new Item();
		itemRecord.setOrderId(to.getOrderId());
		List<Item> items = itemMapper.select(itemRecord);
		String productStr = "";
		for (int j=0; j<items.size(); j++) {
			Item it = items.get(j);
			ItemVo ivo = new ItemVo();
			ivo.setItem(it);
			ivo.setProduct(productMapper.selectByPrimaryKey(it.getProductId()));
			productStr += ivo.getProduct().getName()+";";
			itemVos.add(ivo);
		}
		vo.setItemVos(itemVos );
//		if(productStr.endsWith(";")) {
//			productStr = productStr.substring(0, productStr.length()-2)+"……";
//		}
		vo.setProductStr(productStr);
		return vo;
	}

	@Override
	public List<TOrder> findOrders(int start, int end) {
		Example example = new Example(TOrder.class);
//		Criteria crt = example.createCriteria();
//		crt.andEqualTo("", "");
		example.orderBy("orderTime").desc();
		return mapper.selectByExampleAndRowBounds(example, new RowBounds(start, end));
	}

	@Override
	public Integer findOrdersCount() {
		return mapper.selectCount(new TOrder());
	}

	@Override
	public List<TOrder> findMyOrders(int start, int end, int userId) {
		Example example = new Example(TOrder.class);
		Criteria crt = example.createCriteria();
		crt.andEqualTo("userId", userId);
		example.orderBy("orderTime").desc();
		return mapper.selectByExampleAndRowBounds(example, new RowBounds(start, end));
	}

	@Override
	public Integer findMyOrdersCount(int userId) {
		Example example = new Example(TOrder.class);
		Criteria crt = example.createCriteria();
		crt.andEqualTo("userId", userId);
		return mapper.selectCountByExample(example);
	}

	@Override
	public void updateOrder(TOrder order) {
		mapper.updateByPrimaryKeySelective(order);
	}

	@Override
	public List<OrderVo> findMyorders(int start, int end, int userId) {
		List<TOrder> list = this.findMyOrders(start, end, userId);
		return parseOrderVo(list);
	}

	private List<OrderVo> parseOrderVo(List<TOrder> list) {
		List<OrderVo> voList = new ArrayList<>();
		for (TOrder to : list) {
			OrderVo vo = new OrderVo();
			vo.setOrder(to);
			User user = userMapper.selectByPrimaryKey(to.getUserId());
			vo.setUser(user);
			List<ItemVo> itemVos = new ArrayList<>();
			Item itemRecord = new Item();
			itemRecord.setOrderId(to.getOrderId());
			List<Item> items = itemMapper.select(itemRecord);
			String productStr = "";
			for (int j=0; j<items.size(); j++) {
				Item it = items.get(j);
				ItemVo ivo = new ItemVo();
				ivo.setItem(it);
				ivo.setProduct(productMapper.selectByPrimaryKey(it.getProductId()));
				productStr += ivo.getProduct().getName()+";";
				itemVos.add(ivo);
			}
			vo.setItemVos(itemVos );
//			if(productStr.endsWith(";")) {
//				productStr = productStr.substring(0, productStr.length()-2)+"……";
//			}
			vo.setProductStr(productStr);
			voList.add(vo);
		}
		return voList;
	}
	
	@Override
	public List<OrderVo> findOrderVos(int start, int end) {
		List<TOrder> list = this.findOrders(start, end);
		return parseOrderVo(list);
	}

	@Override
	public List<OrderVo> findOrderVo(String orderNo) {
		TOrder record = new TOrder();
		record.setOrderCode(orderNo);
		List<TOrder> list = mapper.select(record);
		return parseOrderVo(list);
	}

	@Override
	public void saveExpress(int orderId, String no) {
		Express exp = new Express();
		exp.setExpressNo(no);
		exp.setExpTime(new Date());
		exp.setOrderId(orderId);
		exp.setCurrLocation("商家已发货");
		expMapper.insertSelective(exp);
	}

	@Override
	public void addExpress(int orderId, String txt) {
		Express exp = new Express();
		TOrder order = this.findOrderById(orderId);
		exp.setExpressNo(order.getExpNo());
		exp.setExpTime(new Date());
		exp.setOrderId(orderId);
		exp.setCurrLocation(txt);
		exp.setExpressNo(order.getExpNo());
		expMapper.insertSelective(exp);
	}

	@Override
	public List<Product> findNotCommentProducts(int oid) {
		Item item = new Item();
		item.setOrderId(oid);
		item.setIscomment(0);
		List<Item> items = itemMapper.select(item );
		List<Product> products = new ArrayList<>();
		for (Item it : items) {
			products.add(productMapper.selectByPrimaryKey(it.getProductId()));
		}
		return products;
	}

	/**
	 * 发表评论，并且更新对应的item与订单状态，防止一个订单多次评论
	 */
	@Override
	public void publishComment(int userId, int pid, int oid, String content) {
		Comment comment = new Comment();
		comment.setContent(content);
		comment.setProductId(pid);
		comment.setPublishTime(new Date());
		comment.setUser(userId);
		comment.setOrderId(oid);
		commentMapper.insertSelective(comment);
		//更新订单item的评论状态
		Item item = new Item();
		item.setOrderId(oid);
		item.setProductId(pid);
		List<Item> items = itemMapper.select(item );
		for (Item item2 : items) {
			item2.setIscomment(1);
			itemMapper.updateByPrimaryKeySelective(item2);
		}
		//检查订单中是否所有商品都已经评论，如果是，则将状态改为5
		Item item3 = new Item();
		item3.setOrderId(oid);
		item3.setIscomment(0);
		int uncommentCnt = itemMapper.selectCount(item3);
		if(uncommentCnt == 0) {
			TOrder order = this.findOrderById(oid);
			order.setStatus(5);
			this.updateOrder(order);
		}
	}

}
