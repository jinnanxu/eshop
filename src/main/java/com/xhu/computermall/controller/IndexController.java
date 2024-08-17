package com.xhu.computermall.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xhu.computermall.controller.vo.CommentVo;
import com.xhu.computermall.controller.vo.ProductVo;
import com.xhu.computermall.dao.mapper.CategoryMapper;
import com.xhu.computermall.dao.mapper.CommentMapper;
import com.xhu.computermall.dao.model.Category;
import com.xhu.computermall.dao.model.Comment;
import com.xhu.computermall.dao.model.Product;
import com.xhu.computermall.dao.model.User;
import com.xhu.computermall.service.ProductService;
import com.xhu.computermall.service.UserService;
import com.xhu.utils.MD5Util;
import com.xhu.utils.page.PageView;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private CommentMapper commMapper;
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryMapper categoryMapper;
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index2");
		List<Product> hotProduct = productService.findHotProduct();
		List<ProductVo> voList = new ArrayList<>();
		for (Product product : hotProduct) {
			ProductVo vo = new ProductVo();
			vo.setProduct(product);
			vo.setCategory(categoryMapper.selectByPrimaryKey(product.getCategory()));
			voList.add(vo);
		}
//		for (Product m : newProduct) {
//			m.setRemark(HtmlFilterUtil.Html2Text(m.getRemark()));
//		}
//		List<Product> hotProduct = productService.findHotProduct();
//		for (Product m : hotProduct) {
//			m.setRemark(HtmlFilterUtil.Html2Text(m.getRemark()));
//		}
//		mav.addObject("newProduct", newProduct);
		mav.addObject("hotProduct", voList);
		return mav;
	}
	
	/**
	 * 产品列表
	 * @return
	 */
	@RequestMapping("product-list")
	public ModelAndView hotel(PageView<ProductVo> page, @RequestParam(name = "cat", required = false) Integer category) {
		ModelAndView mav = new ModelAndView("product-all");
		List<Product> list;
		if(category!=null) {
			list = productService.findProductByCategory(category, page.getFirstResult(), page.getMaxresult());
			List<ProductVo> voList = new ArrayList<>();
			for (Product product : list) {
				ProductVo vo = new ProductVo();
				vo.setProduct(product);
				vo.setCategory(categoryMapper.selectByPrimaryKey(product.getCategory()));
				voList.add(vo);
			}
			page.setRecords(voList);
			page.setTotalrecord(productService.findProductCountByCategory(category));
		}else {
			list = productService.findProducts(page.getFirstResult(), page.getMaxresult());
			List<ProductVo> voList = new ArrayList<>();
			for (Product product : list) {
				ProductVo vo = new ProductVo();
				vo.setProduct(product);
				vo.setCategory(categoryMapper.selectByPrimaryKey(product.getCategory()));
				voList.add(vo);
			}
			page.setRecords(voList);
			page.setTotalrecord(productService.findProductCount());
		}
		
		Category cat = categoryMapper.selectByPrimaryKey(category);
		mav.addObject("catName", cat.getName());
		mav.addObject("page", page);
		mav.addObject("cat", category);
		return mav;
	}
	
	@RequestMapping("tologin")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("currUser");
		return "redirect:index";
	}
	
	@RequestMapping("login")
	public ModelAndView login(String username, String pwd, HttpSession session) {
		ModelAndView mav = new ModelAndView("login");
		pwd = MD5Util.md5Encrypt32Upper(pwd);
		User user = userService.findUser(username, pwd);
		if(user != null) {
			session.setAttribute("currUser", user);
			mav.setViewName("redirect:index");
		}else {
			mav.addObject("msg", "手机号或密码错误");
		}
		return mav;
	}
	
	@RequestMapping("toreg")
	public String toReg() {
		return "regist";
	}
	
	@RequestMapping("regist")
	public String regist(User user) {
		user.setPwd(MD5Util.md5Encrypt32Upper(user.getPwd()));
		userService.saveUser(user);
		return "redirect:tologin";
	}
	
	@RequestMapping("profile")
	public ModelAndView profile(HttpSession session) {
		ModelAndView mav = new ModelAndView("profile");
		User user = (User) session.getAttribute("currUser");
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping("tomdfpwd")
	public ModelAndView tomdfpwd(HttpSession session) {
		ModelAndView mav = new ModelAndView("mdfpwd");
		User user = (User) session.getAttribute("currUser");
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping("toupload")
	public ModelAndView toupload(HttpSession session) {
		ModelAndView mav = new ModelAndView("upload");
		User user = (User) session.getAttribute("currUser");
		mav.addObject("currUser", user);
		return mav;
	}
	
	@RequestMapping("mdfpwd")
	public ModelAndView mdfpwd(HttpSession session, String pwd) {
		ModelAndView mav = new ModelAndView("redirect:profile");
		User user = (User) session.getAttribute("currUser");
		pwd = MD5Util.md5Encrypt32Upper(pwd);
		user.setPwd(pwd);
		userService.updateUser(user);
		session.setAttribute("currUser", user);
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping("mdfprofile")
	public String mdfprofile(User user, HttpSession session) {
		userService.updateUser(user);
		session.setAttribute("currUser", user);
		return "redirect:profile";
	}
	
	/**
	 * 查看详情
	 * @param id
	 * @return
	 */
	@RequestMapping("pdetail")
	public ModelAndView productDetail(Integer id, String type, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Product product = productService.findProduct(id);
		product.setViewCount(product.getViewCount()+1);
		productService.updateProduct(product);
		mav.addObject("product", product);
		Comment record = new Comment();
		record.setProductId(id);
		List<Comment> comments = commMapper.select(record );
		ProductVo pvo = new ProductVo();
		List<CommentVo> cvoList = new ArrayList<>();
		for (Comment cmt : comments) {
			CommentVo vo = new CommentVo();
			vo.setComment(cmt);
			vo.setUser(userService.findUser(cmt.getUser()));
			cvoList.add(vo);
		}
		pvo.setComments(cvoList);
		pvo.setProduct(product);
		pvo.setCategory(categoryMapper.selectByPrimaryKey(product.getCategory()));
		mav.addObject("productVo", pvo);
		mav.addObject("commentCnt", comments.size());
		//查找推荐商品
		List<Product> rec = productService.findRecommendProducts(id);
		mav.addObject("recProduct", rec);
		mav.addObject("recProductCnt", rec.size());
		mav.setViewName("product-detail");
		return mav;
	}
	

	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("myfav")
	public ModelAndView myfav(HttpSession session) {
		ModelAndView mav = new ModelAndView("myfav");
		if(session.getAttribute("currUser")==null) {
			mav.setViewName("redirect:/tologin");
			return mav;
		}
		User user = (User) session.getAttribute("currUser");
		List<Product> hotProduct = productService.findMyFavs(user);
		List<ProductVo> voList = new ArrayList<>();
		for (Product product : hotProduct) {
			ProductVo vo = new ProductVo();
			vo.setProduct(product);
			vo.setCategory(categoryMapper.selectByPrimaryKey(product.getCategory()));
			voList.add(vo);
		}
		mav.addObject("hotProduct", voList);
		return mav;
	}
	
	@RequestMapping("categorys")
	public ModelAndView categorys() {
		ModelAndView mav = new ModelAndView("all-category");
		List<Category>categorys = categoryMapper.selectAll();
		mav.addObject("categorys", categorys);
		return mav;
	}
	
}
