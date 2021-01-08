<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<div id="menu_bar">
	<div>
		<a href="${pageContext.request.contextPath}/admin/prodlist">> 商品管理</a>
		<a href="${pageContext.request.contextPath}/admin/addprod">添加</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/admin/categorylist">> 商品类别管理</a>
		<a href="${pageContext.request.contextPath}/admin/addcategory">添加</a>
	</div>
	<div><a href="${pageContext.request.contextPath}/admin/orderlist">> 订单管理</a></div>
	<div><a href="${pageContext.request.contextPath}/charts/sales">> 销售榜单</a></div>
	<div><a href="${pageContext.request.contextPath }/index.jsp">> 返回前台</a></div>
</div>