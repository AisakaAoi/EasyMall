package easymall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import easymall.po.Category;
import easymall.po.Products;
import easymall.pojo.MyCategory;

@Repository("productsDao")
@Mapper
public interface ProductsDao {
	// 查找商品列表
	public List<Category> allcategorys();
	// 查找商品
	public List<Products> prodlist(Map<String, Object> map);
	// 根据pid查找单个商品
	public Products oneProduct(String pid);
//	根据pid查找单个商品类别
	public Category oneCategory(String pid);
	// 根据分类查找商品
	public List<Products> proclass(Integer category);
	
	public void save(Products products);
	
	public Object findByImgurl(String imgurl);
//	根据pid删除商品
	public void deleteproduct(String pid);
//	根据id删除商品类别
	public void deletecategory(String id);
//	添加商品类别
	public void savecategory(Category category);
//	修改商品
	public void update(Products products);
//	修改商品类别
	public void updateCategory(Category category);
}
