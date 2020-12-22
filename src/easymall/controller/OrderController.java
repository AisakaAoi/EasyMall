package easymall.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import easymall.pojo.MyCart;
import easymall.service.CartService;
import easymall.service.OrderService;
import easymall.service.ProductsService;

@Controller("orderController")
@RequestMapping("/order")
public class OrderController extends BaseController{
	
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductsService productsService;
	
	@RequestMapping("order_add")
	public String order_add(String cartIds, Model model) {
		// 1.将购物车中所有选中商品的cartID组合起来的字符串拆分为数组
		String[] arrCartIds = cartIds.split(",");
		List<MyCart> carts = new ArrayList<MyCart>();
		
		// 2.遍历数组，根据cartID编号查找购物车，添加到carts中
		for (String cid : arrCartIds) {
			Integer cartID = Integer.parseInt(cid);
			MyCart cart = cartService.findByCartID(cartID);
			carts.add(cart);
		}
		model.addAttribute("carts", carts);
		model.addAttribute("cartIds", cartIds);
		return ("order_add");
	}
	
	
}
