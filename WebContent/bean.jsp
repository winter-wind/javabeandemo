<%@page import="cc.bean.deom.Customers"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

 
	<jsp:useBean id="cstme" class="cc.bean.deom.Customers" scope="session"></jsp:useBean>
<!--从scope(session)中获取id(cstme) 属性值， 赋给class类型的id（cstme）变量  -->
	<!-- 相当于-->
	<%
		Customers customers = (Customers)session.getAttribute("customers");
	
		//如何属性为空，则创建一个
		if(customers == null){//如果为空创建一个新的实例
			customers = (Customers)Class.forName("cc.bean.deom.Customers").newInstance();
			session.setAttribute("customers", customers);
		}
		
	%>
	 
	
	<jsp:setProperty property="age" value="10" name="cstme"/>
	<!-- 	上为设置，下为读取						此为上面id的名字 -->
	age:<jsp:getProperty property="age" name="cstme"/>
	<!-- 相当于 -->
	<%
		customers.setAge("10");
	%>
	<br><br>
	非bean:
	<%= customers.getAge() %>
	
</body>
</html>