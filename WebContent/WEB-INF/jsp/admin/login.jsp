<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EasyMall后台登录</title>
</head>
<body>
<form action="${ pageContext.request.contextPath }/user/adminlogin" method="POST">			
			<table>
				<tr>	
				 	
					<td class="tdx">用户名：</td>
					<td><input type="text" name="adminname" value="${ admin.adminname }"/></td>
				</tr>
				<tr>
					<td class="tdx">密&nbsp;&nbsp; 码：</td>
					<td><input type="password" name="adminpwd" value=""/></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align:center">
						<input type="submit" value="登录"/>
					</td>	
				</tr>
				<tr><td colspan="2" style="color:red;text-align:center;font-height:bold;">
				${message}</td></tr>
			</table>
		</form>		
</body>
</html>