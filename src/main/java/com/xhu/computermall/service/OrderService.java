package com.xhu.computermall.service;

import java.util.List;

import com.xhu.computermall.controller.vo.OrderVo;
import com.xhu.computermall.dao.model.Product;
import com.xhu.computermall.dao.model.TOrder;
import com.xhu.computermall.dao.model.User;

public interface OrderService {

	/**
	 * 生成订单
	 * @param cartIds
	 * @param user
	 */
	Integer generateOrder(String[] cartIds, User user, TOrder order);
	
	TOrder findOrderById(Integer tid);
	
	OrderVo findOrderVoById(Integer tid);
	
	void updateOrder(TOrder order);
	
	List<TOrder> findOrders(int start, int end);
	
	Integer findOrdersCount();
	
	List<TOrder> findMyOrders(int start, int end, int userId);
	
	Integer findMyOrdersCount(int userId);
	
	List<OrderVo> findMyorders(int start, int end, int userId);
	
	List<OrderVo> findOrderVos(int start, int end);
	
	List<OrderVo> findOrderVo(String orderNo);
	
	void saveExpress(int orderId, String no);
	
	void addExpress(int orderId, String txt);
	
	List<Product> findNotCommentProducts(int oid);
	
	void publishComment(int userId, int pid, int oid, String content);
}
