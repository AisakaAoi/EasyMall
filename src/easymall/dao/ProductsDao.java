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
	// ������Ʒ�б�
	public List<Category> allcategorys();
	// ������Ʒ
	public List<Products> prodlist(Map<String, Object> map);
	// ����pid���ҵ�����Ʒ
	public Products oneProduct(String pid);
//	����pid���ҵ�����Ʒ���
	public Category oneCategory(String pid);
	// ���ݷ��������Ʒ
	public List<Products> proclass(Integer category);
	
	public void save(Products products);
	
	public Object findByImgurl(String imgurl);
//	����pidɾ����Ʒ
	public void deleteproduct(String pid);
//	����idɾ����Ʒ���
	public void deletecategory(String id);
//	�����Ʒ���
	public void savecategory(Category category);
//	�޸���Ʒ
	public void update(Products products);
//	�޸���Ʒ���
	public void updateCategory(Category category);
}
