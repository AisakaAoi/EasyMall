<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>管理商品类别</title>
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
	<h2>商品类别管理</h2>
	<table border="1">
		<tr>			
			<th width="200px">商品类别ID</th>
			<th class="ths">商品类别</th>
			<th class="ths">商品类别描述</th>
			<th width="50px">操 作</th>
		</tr>
		<!-- 模版数据 -->
		<c:forEach items="${categorys}" var="c">
		<tr>
			<td>${c.id}</td>
			<td>${c.name}</td>
			<td>${c.description}</td>
			<td><a class="" href="${pageContext.request.contextPath}/admin/delcategory?id=${c.id}">删 除</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
