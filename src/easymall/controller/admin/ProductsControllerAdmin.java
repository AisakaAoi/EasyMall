package easymall.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import easymall.po.Category;
import easymall.po.Products;
import easymall.pojo.MyProducts;
import easymall.service.ProductsService;

@Controller("productsControllerAdmin")
@RequestMapping("/admin")
public class ProductsControllerAdmin {

	@Autowired
	private ProductsService productsService;
	
	@RequestMapping("/addprod")
	public String addprod(Model model) {
		// 查找商品表中所有的商品列表
		List<Category> categorys = productsService.allcategorys();
		model.addAttribute("categorys", categorys);
		model.addAttribute("myproducts", new MyProducts());
		return "admin/add_prod";
	}
	
	@RequestMapping("/save")
	public String save(@Valid @ModelAttribute MyProducts myproducts, HttpServletRequest request, Model model) throws Exception {
		String msg = productsService.save(myproducts, request);
		model.addAttribute("msg", msg);
		return "redirect:/admin/addprod";
	}
//	商品管理  返回prod_list
	@RequestMapping("/prodlist")
	public String prodlist(Model model) {
		List<Category> categorys = productsService.allcategorys();
		model.addAttribute("categorys", categorys);
		// 创建map 用于存放查询条件
		Map<String, Object> map = new HashMap<>();
		map.put("minPrice", 0);
		map.put("maxPrice", 999999999);
		// 根据条件查询符合条件的商品信息
		List<Products> products = productsService.prodlist(map);
		// 查询结果暴露给前端
		model.addAttribute("products", products);
		return "admin/prod_list";
		
	}
//	商品管理  删除商品
	@RequestMapping("/delprod")
	public String delprod(String pid,Model model) {
		productsService.deleteproduct(pid);
		return "redirect:/admin/prodlist";
	}
}
