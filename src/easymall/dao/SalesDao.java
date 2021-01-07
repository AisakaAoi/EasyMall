package easymall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import easymall.pojo.MySales;

@Repository("salesDao")
@Mapper
public interface SalesDao {
	 public int sales(MySales mySales);
	 public List<MySales> allSales();
}
