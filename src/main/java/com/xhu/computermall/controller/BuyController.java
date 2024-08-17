package com.xhu.computermall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.xhu.computermall.controller.vo.CartVo;
import com.xhu.computermall.controller.vo.OrderVo;
import com.xhu.computermall.dao.mapper.CategoryMapper;
import com.xhu.computermall.dao.mapper.CommentMapper;
import com.xhu.computermall.dao.mapper.FavoriteMapper;
import com.xhu.computermall.dao.model.Cart;
import com.xhu.computermall.dao.model.Favorite;
import com.xhu.computermall.dao.model.Product;
import com.xhu.computermall.dao.model.TOrder;
import com.xhu.computermall.dao.model.User;
import com.xhu.computermall.service.CartService;
import com.xhu.computermall.service.OrderService;
import com.xhu.computermall.service.ProductService;
import com.xhu.computermall.service.UserService;
import com.xhu.utils.page.PageView;

@Controller
@RequestMapping("/buy")
public class BuyController {

	@Autowired
	private UserService userService;
	@Autowired
	private CommentMapper commMapper;
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private FavoriteMapper favMapper;
	
	@RequestMapping("cart")
	public ModelAndView cart(HttpSession session) {
		ModelAndView mav = new ModelAndView("cart");
		if(session.getAttribute("currUser")==null) {
			mav.setViewName("redirect:/tologin");
			return mav;
		}
		User user = (User) session.getAttribute("currUser");
		List<Cart> cartList = cartService.loadCart(user.getUserId());
		List<CartVo> voList = new ArrayList<>();
		for (Cart cart : cartList) {
			CartVo vo = new CartVo();
			vo.setCart(cart);
			vo.setProduct(productService.findProduct(cart.getProductId()));
			voList.add(vo);
		}
		mav.addObject("cartList", voList);
		return mav;
	}
	
	@RequestMapping("removeProduct")
	public String removeProduct(HttpSession session, Integer cartId) {
		if(session.getAttribute("currUser")==null) {
			return "redirect:/tologin";
		}
		User user = (User) session.getAttribute("currUser");
		cartService.removeCart(cartId);
		return "redirect:cart";
	}
	
	/**
	 * 添加到购物车
	 * @param session
	 * @param response
	 * @param productId
	 */
	@RequestMapping("addCart")
	public void addCart(HttpSession session, HttpServletResponse response, Integer productId) {
		JSONObject json = new JSONObject();
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			if(session.getAttribute("currUser")==null) {
				json.put("code", 401);
				pw.print(json.toJSONString());
			}else {
				cartService.addToCart(productId, session);
				json.put("code", 200);
				json.put("msg", "添加成功");
				pw.print(json.toJSONString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 添加收藏
	 * @param session
	 * @param response
	 * @param productId
	 */
	@RequestMapping("addFav")
	public void addFavorite(HttpSession session, HttpServletResponse response, Integer productId) {
		JSONObject json = new JSONObject();
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			if(session.getAttribute("currUser")==null) {
				json.put("code", 401);
				pw.print(json.toJSONString());
			}else {
				User user = (User) session.getAttribute("currUser");
				Favorite fav = new Favorite();
				fav.setProductId(productId);
				fav.setUserId(user.getUserId());
				List<Favorite> list = favMapper.select(fav);
				if(list != null && list.size()>0) {
				}else {					
					favMapper.insertSelective(fav);
				}
				json.put("code", 200);
				json.put("msg", "收藏成功");
				pw.print(json.toJSONString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("delFav")
	public void delFavorite(HttpSession session, HttpServletResponse response, Integer productId) {
		JSONObject json = new JSONObject();
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			if(session.getAttribute("currUser")==null) {
				json.put("code", 401);
				pw.print(json.toJSONString());
			}else {
				User user = (User) session.getAttribute("currUser");
				Favorite fav = new Favorite();
				fav.setProductId(productId);
				fav.setUserId(user.getUserId());
				List<Favorite> list = favMapper.select(fav);
				if(list != null && list.size()>0) {
					Favorite fav0 = list.get(0);
					favMapper.deleteByPrimaryKey(fav0.getFavoriteId());
				}
				json.put("code", 200);
				json.put("msg", "删除成功");
				pw.print(json.toJSONString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("modifyCart")
	public void modifyCart(HttpSession session, HttpServletResponse response, Integer cartId, Integer qty) {
		JSONObject json = new JSONObject();
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			if(session.getAttribute("currUser")==null) {
				json.put("code", 401);
				pw.print(json.toJSONString());
			}else {
				cartService.modifyCart(cartId, qty);
				Cart cart = cartService.selectCartById(cartId);
				Product product = productService.findProduct(cart.getProductId());
				json.put("code", 200);
				json.put("msg", "修改成功");
				json.put("newQty", cart.getQuantity());
				DecimalFormat df = new DecimalFormat("#0.0");
				json.put("newAmt", df.format(cart.getQuantity()*product.getPrice()));
				pw.print(json.toJSONString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("book")
	public ModelAndView book(HttpSession session, String[] selCart) {
		ModelAndView mav = new ModelAndView("book");
		if(session.getAttribute("currUser")==null) {
			mav.setViewName("redirect:/tologin");
			return mav;
		}
		session.setAttribute("CART_SELECETED_IDS", selCart);
		return mav;
	}
	
	@RequestMapping("submitOrder")
	public String submitOrder(HttpSession session, String reciever, String mobile, String remark, String address) {
		if(session.getAttribute("currUser")==null) {
			return "redirect:/tologin";
		}
		String[] selCart = (String[]) session.getAttribute("CART_SELECETED_IDS");
		TOrder order = new TOrder();
		order.setMobile(mobile);
		order.setFullAddress(address);
		order.setReceiveName(reciever);
		order.setRemark(remark);
		User user = (User) session.getAttribute("currUser");
		Integer orderId = orderService.generateOrder(selCart, user, order);
		return "redirect:topay?oid="+orderId;
	}
	
	@RequestMapping("topay")
	public ModelAndView toPayPage(HttpSession session, Integer oid) {
		ModelAndView mav = new ModelAndView("pay");
		if(session.getAttribute("currUser")==null) {
			mav.setViewName("redirect:/tologin");
			return mav;
		}
		TOrder order = orderService.findOrderById(oid);
		orderService.updateOrder(order);
		mav.addObject("oid", order.getOrderId());
		mav.addObject("total", order.getTotalPrice());
		return mav;
	}
	
	@RequestMapping("pay")
	public String pay(HttpSession session, Integer oid) {
		if(session.getAttribute("currUser")==null) {
			return "redirect:/tologin";
		}
		TOrder order = orderService.findOrderById(oid);
		order.setStatus(2);
		orderService.updateOrder(order);
		return "redirect:/order/myorders";
	}
	
	/**
	 * 我的订单列表 
	 * @param session
	 * @return
	 */
	@RequestMapping("myorders")
	public ModelAndView myOrders(HttpSession session, PageView<OrderVo> page) {
		ModelAndView mav = new ModelAndView("myorders");
		if(session.getAttribute("currUser")==null) {
			mav.setViewName("redirect:/tologin");
			return mav;
		}
		User user = (User) session.getAttribute("currUser");
		List<OrderVo> list = orderService.findMyorders(page.getFirstResult(), page.getMaxresult(), user.getUserId());
		page.setRecords(list);
		page.setTotalrecord(orderService.findMyOrdersCount(user.getUserId()));
		mav.addObject("page", page);
		return mav;
	}
}
