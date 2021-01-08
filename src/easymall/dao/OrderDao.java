package easymall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import easymall.po.Orders;

@Repository("orderDao")
@Mapper
public interface OrderDao {
	// 添加订单
	void addOrder(Orders myOrder);
	// 显示订单
	List<Orders> findOrderByUserId(Integer user_id);
	// 订单删除
	void delorder(String id);
	// 订单支付
	void payorder(String id);
//	查询orders表里的所有订单信息
	List<Orders> findOrder();
//	发货处理
	void sendorder(String id);
//	确认收货
	void confirm(String id);
}
