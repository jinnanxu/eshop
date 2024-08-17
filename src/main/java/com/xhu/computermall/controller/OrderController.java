package com.xhu.computermall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xhu.computermall.controller.vo.ExpressVo;
import com.xhu.computermall.controller.vo.OrderVo;
import com.xhu.computermall.dao.mapper.ExpressMapper;
import com.xhu.computermall.dao.model.Express;
import com.xhu.computermall.dao.model.Product;
import com.xhu.computermall.dao.model.TOrder;
import com.xhu.computermall.dao.model.User;
import com.xhu.computermall.service.OrderService;
import com.xhu.utils.page.PageView;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private ExpressMapper expMapper;
	
	@RequestMapping("myorders")
	public ModelAndView orderList(PageView<OrderVo> page, HttpSession session) {
		ModelAndView mav = new ModelAndView("myorders");
		if(session.getAttribute("currUser")==null) {
			mav.setViewName("redirect:/tologin");
			return mav;
		}
		User user = (User) session.getAttribute("currUser");
		List<OrderVo> voList = orderService.findMyorders(page.getFirstResult(), page.getMaxresult(), user.getUserId());//.findOrderVos(page.getFirstResult(), page.getMaxresult());
		page.setRecords(voList);
		page.setTotalrecord(orderService.findOrdersCount());
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping("cancel")
	public String cancel(Integer oid, Integer status) {
		TOrder order = orderService.findOrderById(oid);
		order.setStatus(status);
		orderService.updateOrder(order);
		return "redirect:myorders";
	}
	
	@RequestMapping("orderdetail")
	public ModelAndView orderDetail(Integer oid) {
		ModelAndView mav = new ModelAndView("myorder-detail");
		OrderVo orderVo = orderService.findOrderVoById(oid);
		Example example = new Example(Express.class);
		Criteria crt = example.createCriteria();
		crt.andEqualTo("orderId", oid);
		example.orderBy("expTime").desc();
		List<Express> list = expMapper.selectByExample(example);
		List<ExpressVo> voList = new ArrayList<>();
		for (Express exp : list) {
			ExpressVo vo = new ExpressVo();
			vo.setExp(exp);
			vo.setOrder(orderService.findOrderById(exp.getOrderId()));
			voList.add(vo);
		}
		mav.addObject("expList", voList);
		mav.addObject("vo", orderVo);
		return mav;
	}
	
	@RequestMapping("tocomment")
	public ModelAndView toComment(HttpSession session, Integer oid) {
		ModelAndView mav = new ModelAndView("comment");
		if(session.getAttribute("currUser")==null) {
			mav.setViewName("redirect:/tologin"); 
			return mav;
		}
		List<Product> products = orderService.findNotCommentProducts(oid);
		mav.addObject("count", products.size());
		mav.addObject("products", products);
		mav.addObject("oid", oid);
		return mav;
	}
	
	@RequestMapping("publishComment")
	public String publishComment(HttpSession session, Integer oid, Integer pid, String content) {
		if(session.getAttribute("currUser")==null) {
			return "redirect:/tologin";
		}
		User user = (User) session.getAttribute("currUser");
		orderService.publishComment(user.getUserId(), pid, oid, content);
		return "redirect:myorders";
	}
}
