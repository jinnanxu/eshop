package com.xhu.computermall.controller;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.xhu.computermall.dao.mapper.AdminMapper;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xhu.computermall.controller.vo.ExpressVo;
import com.xhu.computermall.controller.vo.OrderVo;
import com.xhu.computermall.controller.vo.ProductVo;
import com.xhu.computermall.dao.mapper.CategoryMapper;
import com.xhu.computermall.dao.mapper.ExpressMapper;
import com.xhu.computermall.dao.mapper.TOrderMapper;
import com.xhu.computermall.dao.model.Admin;
import com.xhu.computermall.dao.model.Category;
import com.xhu.computermall.dao.model.Express;
import com.xhu.computermall.dao.model.Product;
import com.xhu.computermall.dao.model.TOrder;
import com.xhu.computermall.dao.model.User;
import com.xhu.computermall.service.AdminService;
import com.xhu.computermall.service.OrderService;
import com.xhu.computermall.service.ProductService;
import com.xhu.computermall.service.UserService;
import com.xhu.utils.page.PageView;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ExpressMapper expMapper;
	@Autowired
	private TOrderMapper orderMapper;
	@Autowired
	private AdminMapper adminMapper;

	@RequestMapping("login")
	public String loginPage() {
		return "admin/login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("currAdmin");
		return "admin/login";
	}
	
	@RequestMapping("login-form")
	public ModelAndView loginForm(String username, String pwd, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:home");
		Admin admin = adminService.findAdmin(username, pwd);
		if(admin == null) {
			mav.addObject("msg", "用户名或密码错误");
			mav.setViewName("admin/login");
		}else {
			session.setAttribute("currAdmin", admin);
			admin.setLastLogin(new Date());
			adminMapper.updateByPrimaryKeySelective(admin);
		}
		return mav;
	}
	
	@RequestMapping("home")
	public String home() {
		return "admin/home";
	}
	
	@RequestMapping("usermgr")
	public ModelAndView userList(PageView<User> page) {
		ModelAndView mav = new ModelAndView("admin/user-list");
		List<User> list = userService.findUsers(page.getFirstResult(), page.getMaxresult());
		page.setRecords(list);
		page.setTotalrecord(userService.findUserCount());
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping("toupdateuser")
	public ModelAndView toUserModify(Integer uid) {
		ModelAndView mav = new ModelAndView("admin/user-update");
		User user = userService.findUser(uid);
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping("updateuser")
	public String updateUser(User user) {
		userService.updateUser(user);
		return "redirect:usermgr";
	}
	
	@RequestMapping("deleteuser")
	public String deleteUser(Integer uid) {
		userService.deleteUser(uid);
		return "redirect:usermgr";
	}
	
	@RequestMapping("productmgr")
	public ModelAndView productList(PageView<ProductVo> page) {
		ModelAndView mav = new ModelAndView("admin/product-list");
		List<Product> list = productService.findProducts(page.getFirstResult(), page.getMaxresult());
		List<ProductVo> voList = new ArrayList<>();
		for (Product product : list) {
			ProductVo vo = new ProductVo();
			vo.setProduct(product);
			vo.setCategory(categoryMapper.selectByPrimaryKey(product.getCategory()));
			voList.add(vo);
		}
		page.setRecords(voList);
		page.setTotalrecord(productService.findProductCount());
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping("toaddproduct")
	public ModelAndView toAddProduct() {
		ModelAndView mav = new ModelAndView("admin/product-add");
		Category record = new Category();
		record.setIsDelete(0);
		List<Category> list = categoryMapper.select(record);
		mav.addObject("categorys", list);
		return mav;
	}
	
	@RequestMapping("saveProduct")
	public String saveProduct(@RequestParam("file") MultipartFile file, Product product, HttpServletRequest request) {
		//保存文件
		if(file != null && file.getSize() > 0) {
			System.out.println("上传的文件名："+file.getOriginalFilename());
			String uuid = UUID.randomUUID().toString();
			String folder = request.getSession().getServletContext().getRealPath("/upload")+File.separator;
			System.out.println("存储的文件路径："+folder);
			String filePath = folder+uuid+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println(filePath);
			InputStream is = null;// 附件输入流
			DataOutputStream out = null;
			try {
				out = new DataOutputStream(new FileOutputStream(filePath));// 存放文件的绝对路径
				is = file.getInputStream();
				byte[] b = new byte[is.available()];
				is.read(b);
				out.write(b);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				File tmpFile = new File(filePath);
				String picUrl = ServerUploadUtil.uploadToServer(file.getOriginalFilename(), tmpFile);
//				room.setImg(picUrl);
				product.setPic(picUrl);
			}
		}
		product.setViewCount(0);
		product.setSaleCount(0);
		product.setPublishTime(new Date());
		//存入数据库
		productService.saveProduct(product);
		return "redirect:productmgr";
	}
	
	@RequestMapping("pdetail")
	public ModelAndView detail(Integer mid) {
		ModelAndView mav = new ModelAndView("admin/product-detail");
		Product product = productService.findProduct(mid);
		ProductVo vo = new ProductVo();
		vo.setProduct(product);
		vo.setCategory(categoryMapper.selectByPrimaryKey(product.getCategory()));
		mav.addObject("vo", vo);
		return mav;
	}
	
	@RequestMapping("toupdateproduct")
	public ModelAndView toUpdateProduct(Integer mid) {
		ModelAndView mav = new ModelAndView("admin/product-update");
		Product product = productService.findProduct(mid);
		ProductVo vo = new ProductVo();
		vo.setProduct(product);
		vo.setCategory(categoryMapper.selectByPrimaryKey(product.getCategory()));
		Category record = new Category();
		record.setIsDelete(0);
		List<Category> list = categoryMapper.select(record);
		mav.addObject("categorys", list);
		mav.addObject("vo", vo);
		return mav;
	}
	
	@RequestMapping("updateProduct")
	public String updateProduct(@RequestParam(value = "file", required = false) MultipartFile file, Product product, HttpServletRequest request) {
		if(file != null && file.getSize() != 0 && !StringUtils.isBlank(file.getName())) {
			//保存图片文件
			System.out.println("上传的文件名："+file.getOriginalFilename());
			String uuid = UUID.randomUUID().toString();
			String folder = request.getSession().getServletContext().getRealPath("/upload")+File.separator;
			System.out.println("存储的文件路径："+folder);
			String filePath = folder+uuid+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println(filePath);
			InputStream is = null;// 附件输入流
			DataOutputStream out = null;
			try {
				out = new DataOutputStream(new FileOutputStream(filePath));// 存放文件的绝对路径
				is = file.getInputStream();
				byte[] b = new byte[is.available()];
				is.read(b);
				out.write(b);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				File tmpFile = new File(filePath);
				String picUrl = ServerUploadUtil.uploadToServer(file.getOriginalFilename(), tmpFile);
				product.setPic(picUrl);
			}
		}
		productService.updateProduct(product);
		return "redirect:productmgr";
	}
	
	@RequestMapping("deleteproduct")
	public String deleteProduct(Integer mid, Integer status) {
		Product product = productService.findProduct(mid);
		product.setStatus(status);
		productService.updateProduct(product);
		return "redirect:productmgr";
	}

	@RequestMapping("categorymgr")
	public ModelAndView categoryList(PageView<Category> page) {
		ModelAndView mav = new ModelAndView("admin/category-list");
		List<Category> list = categoryMapper.selectByRowBounds(new Category(), new RowBounds(page.getFirstResult(), page.getMaxresult()));
		page.setRecords(list);
		page.setTotalrecord(categoryMapper.selectCount(new Category()));
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping("saveCategory")
	public String saveCategory(@RequestParam("file") MultipartFile file, String name, HttpServletRequest request) {
		Category cat = new Category();
		//保存文件
		if(file != null && file.getSize() > 0) {
			System.out.println("上传的文件名："+file.getOriginalFilename());
			String uuid = UUID.randomUUID().toString();
			String folder = request.getSession().getServletContext().getRealPath("/upload")+File.separator;
			System.out.println("存储的文件路径："+folder);
			String filePath = folder+uuid+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println(filePath);
			InputStream is = null;// 附件输入流
			DataOutputStream out = null;
			try {
				out = new DataOutputStream(new FileOutputStream(filePath));// 存放文件的绝对路径
				is = file.getInputStream();
				byte[] b = new byte[is.available()];
				is.read(b);
				out.write(b);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				File tmpFile = new File(filePath);
				String picUrl = ServerUploadUtil.uploadToServer(file.getOriginalFilename(), tmpFile);
//						room.setImg(picUrl);
				cat.setPic(picUrl);
			}
		}
		cat.setName(name);
		cat.setIsDelete(0);
		categoryMapper.insertSelective(cat);
		return "redirect:categorymgr";
	}
	
	@RequestMapping("toupdatecategory")
	public ModelAndView toCategoryModify(Integer uid) {
		ModelAndView mav = new ModelAndView("admin/category-update");
		Category category = categoryMapper.selectByPrimaryKey(uid);
		mav.addObject("category", category);
		return mav;
	}
	
	@RequestMapping("updatecategory")
	public String updateCategory(@RequestParam("file") MultipartFile file, HttpServletRequest request, Category category) {
		if(file != null && file.getSize() > 0) {
			System.out.println("上传的文件名："+file.getOriginalFilename());
			String uuid = UUID.randomUUID().toString();
			String folder = request.getSession().getServletContext().getRealPath("/upload")+File.separator;
			System.out.println("存储的文件路径："+folder);
			String filePath = folder+uuid+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println(filePath);
			InputStream is = null;// 附件输入流
			DataOutputStream out = null;
			try {
				out = new DataOutputStream(new FileOutputStream(filePath));// 存放文件的绝对路径
				is = file.getInputStream();
				byte[] b = new byte[is.available()];
				is.read(b);
				out.write(b);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (is != null) {
					try {
						is.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				File tmpFile = new File(filePath);
				String picUrl = ServerUploadUtil.uploadToServer(file.getOriginalFilename(), tmpFile);
//						room.setImg(picUrl);
				category.setPic(picUrl);
			}
		}
		categoryMapper.updateByPrimaryKeySelective(category);
		return "redirect:categorymgr";
	}
	
	/**
	 * 订单管理
	 * @param page
	 * @return
	 */
	@RequestMapping("ordermgr")
	public ModelAndView orderList(PageView<OrderVo> page) {
		ModelAndView mav = new ModelAndView("admin/order-list");
		List<OrderVo> voList = orderService.findOrderVos(page.getFirstResult(), page.getMaxresult());
		page.setRecords(voList);
		page.setTotalrecord(orderService.findOrdersCount());
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping("searchOrder")
	public ModelAndView searchOrder(PageView<OrderVo> page, String orderNo) {
		ModelAndView mav = new ModelAndView("admin/order-list");
		List<OrderVo> voList = orderService.findOrderVo(orderNo);
		page.setRecords(voList);
		page.setTotalrecord(voList.size());
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping("orderdetail")
	public ModelAndView orderDetail(Integer oid) {
		ModelAndView mav = new ModelAndView("admin/order-detail");
		OrderVo orderVo = orderService.findOrderVoById(oid);
		mav.addObject("vo", orderVo);
		return mav;
	}
	
	@RequestMapping("tosendorder")
	public ModelAndView toSendOrder(Integer oid) {
		ModelAndView mav = new ModelAndView("admin/order-send");
		OrderVo orderVo = orderService.findOrderVoById(oid);
		mav.addObject("vo", orderVo);
		return mav;
	}

	/**
	 * 订单发货
	 * @param oid
	 * @return
	 */
	@RequestMapping("sendOrder")
	public String sendOrder(Integer oid, String expressNo) {
		TOrder order = orderService.findOrderById(oid);
		order.setStatus(3);
		order.setExpNo(expressNo);
		orderService.updateOrder(order);
		orderService.saveExpress(oid, expressNo);
		return "redirect:ordermgr";
	}
	
	@RequestMapping("updateOrderStatus")
	public String sendOrder(Integer oid, Integer status) {
		TOrder order = orderService.findOrderById(oid);
		order.setStatus(status);
		orderService.updateOrder(order);
		return "redirect:ordermgr";
	}
	
	@RequestMapping("toupdateexp")
	public ModelAndView toUpdateExp(Integer oid) {
		ModelAndView mav = new ModelAndView("admin/order-exp");
		OrderVo orderVo = orderService.findOrderVoById(oid);
		mav.addObject("vo", orderVo);
		return mav;
	}
	
	@RequestMapping("updateExp")
	public String updateExp(Integer oid, String expText) {
		orderService.addExpress(oid, expText);
		return "redirect:ordermgr";
	}
	
	@RequestMapping("expmgr")
	public ModelAndView expressList(PageView<ExpressVo> page) {
		ModelAndView mav = new ModelAndView("admin/exp-list");
		Example example = new Example(Express.class);
		example.orderBy("expTime").desc();
		List<Express> list = expMapper.selectByExampleAndRowBounds(example, new RowBounds(page.getFirstResult(), page.getMaxresult()));
		List<ExpressVo> voList = new ArrayList<>();
		for (Express exp : list) {
			ExpressVo vo = new ExpressVo();
			vo.setExp(exp);
			vo.setOrder(orderService.findOrderById(exp.getOrderId()));
			voList.add(vo);
		}
		page.setRecords(voList);
		page.setTotalrecord(expMapper.selectCountByExample(example));
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping("expdetail")
	public ModelAndView expDetail(Integer oid) {
		ModelAndView mav = new ModelAndView("admin/exp-detail");
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
		return mav;
	}

	/* *********************管理员信息管理**************************/
	@RequestMapping("adminmgr")
	public ModelAndView adminList(PageView<Admin> page) {
		ModelAndView mav = new ModelAndView("admin/admin-list");
		List<Admin> list = adminMapper.selectByRowBounds(new Admin(),new RowBounds(page.getFirstResult(), page.getMaxresult()));
		page.setRecords(list);
		page.setTotalrecord(adminMapper.selectCount(new Admin()));
		mav.addObject("page", page);
		return mav;
	}

	/**
	 * 进入管理列表页面
	 * @return
	 */
	@RequestMapping("toaddadmin")
	public String toAddAdmin() {
		return "admin/admin-add";
	}

	/**
	 * 新增管理员
	 * @param admin
	 * @return
	 */
	@RequestMapping("saveAdmin")
	public String saveNews(Admin admin) {
		adminMapper.insertSelective(admin);
		return "redirect:adminmgr";
	}

	/**
	 * 更新管理员信息
	 * @param admin
	 * @return
	 */
	@RequestMapping("updateAdmin")
	public String updateAdmin(Admin admin) {
		adminMapper.updateByPrimaryKeySelective(admin);
		return "redirect:adminmgr";
	}

	/**
	 * 管理员修改个人信息
	 * @param admin
	 * @return
	 */
	@RequestMapping("updateProfile")
	public String updateProfile(Admin admin) {
		adminMapper.updateByPrimaryKeySelective(admin);
		return "redirect:adminprofiole";
	}

	/**
	 * 管理员进入个人信息页面
	 * @param session
	 * @return
	 */
	@RequestMapping("adminprofiole")
	public ModelAndView adminProfile(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/admin-profile");
		if(session.getAttribute("currAdmin")==null) {
			mav.setViewName("redirect:login");
			return mav;
		}
		Admin admin = (Admin) session.getAttribute("currAdmin");//
		admin = adminMapper.selectByPrimaryKey(admin.getAdminId());
		mav.addObject("admin", admin);
		return mav;
	}

	/**
	 * 进入 更新管理员页面
	 * @param uid
	 * @return
	 */
	@RequestMapping("toupdateadmin")
	public ModelAndView toupdateadmin(Integer uid) {
		ModelAndView mav = new ModelAndView("admin/admin-update");
		Admin admin = adminMapper.selectByPrimaryKey(uid);
		mav.addObject("admin", admin);
		return mav;
	}

	/**
	 * 删除管理员
	 * @param uid
	 * @param currentpage
	 * @return
	 */
	@RequestMapping("deleteadmin")
	public String deleteAdmin(Integer uid, Integer currentpage) {
		adminMapper.deleteByPrimaryKey(uid);
		return "redirect:mgr?currentpage="+currentpage;
	}
	/* *********************管理员信息管理END**************************/
}
