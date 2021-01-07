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
		// ������Ʒ�������е���Ʒ�б�
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
//	��Ʒ����  ����prod_list
	@RequestMapping("/prodlist")
	public String prodlist(Model model) {
		List<Category> categorys = productsService.allcategorys();
		model.addAttribute("categorys", categorys);
		// ����map ���ڴ�Ų�ѯ����
		Map<String, Object> map = new HashMap<>();
		map.put("minPrice", 0);
		map.put("maxPrice", 999999999);
		// ����������ѯ������������Ʒ��Ϣ
		List<Products> products = productsService.prodlist(map);
		// ��ѯ�����¶��ǰ��
		model.addAttribute("products", products);
		return "admin/prod_list";
		
	}
//	��Ʒ����  ɾ����Ʒ
	@RequestMapping("/delprod")
	public String delprod(String pid,Model model) {
		productsService.deleteproduct(pid);
		return "redirect:/admin/prodlist";
	}
}
