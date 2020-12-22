package easymall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import easymall.dao.ProductsDao;
import easymall.po.Products;

@Service("productsService")
public class ProductsServiceImpl implements ProductsService {
	
	@Autowired
	private ProductsDao productsDao;

	@Override
	public List<String> allcategorys() {
		return productsDao.allcategorys();
	}

	@Override
	public List<Products> prodlist(Map<String, Object> map) {
		return productsDao.prodlist(map);
	}

	@Override
	public Products oneProduct(String pid) {
		return productsDao.oneProduct(pid);
	}

	@Override
	public List<Products> proclass(String proclass) {
		return productsDao.proclass(proclass);
	}

}
