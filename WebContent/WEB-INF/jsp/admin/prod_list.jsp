<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>商品管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<style type="text/css">
	body{
		font-family: "微软雅黑";
		background-color: #EDEDED;
	}
	h2{
		text-align: center;
	}
	table{ 
		margin: 0 auto; 
		/* width: 96%; */
		text-align: center;
		border-collapse:collapse;
	}
	td, th{ padding: 7px;}
	th{
		background-color: #DCDCDC;
	}
	th.ths{
		width: 100px;
	} 
	input.pnum{
		width:80px;
		height:25px;
		font-size: 18px;
		text-align:center;
	}
	
</style>

<!--引入jquery的js库-->
<script src="../js/jquery-1.4.2.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h2>商品管理</h2>
	<table border="1">
		<tr>
			<th>商品图片</th>
			<th width="200px">商品ID</th>
			<th class="ths">商品名称</th>
			<th class="ths">商品种类</th>
			<th class="ths">商品单价</th>
			<th class="ths">库存数量</th>
			<th>描述信息</th>
			<th width="50px">操 作</th>
		</tr>
		<!-- 模版数据 -->
		<c:forEach items="${products}" var="prod">
		<tr>
			<td>
				<img width="120px" height="120px" src="${pageContext.request.contextPath}${prod.imgurl}" alt="" >
			</td>	
			<td>${prod.id}</td>
			<td>${prod.name}</td>
			<td>${prod.category}</td>
			<td>${prod.price}</td>
			<td>${prod.pnum}</td>
			<td>${prod.description}</td>
			<td>
			<a class="upp" href="${pageContext.request.contextPath}/admin/upprod?pid=${prod.id}">修 改</a>
			<a class="del" href="${pageContext.request.contextPath}/admin/delprod?pid=${prod.id}">删 除</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
