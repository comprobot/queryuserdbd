<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SQL example </title>
</head>
<body>
<%
	if (request.getParameter("username") == null) {
        out.println("Please enter your name.");
    } else {
        out.println("Hello <b>"+request.getParameter("username")+"</b>!");
		String userdb = request.getParameter("username");
		String pass = request.getParameter("pass");
		


		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con=(Connection)DriverManager.getConnection("jdbc:mysql://10.131.33.153:3306/sampledb", userdb, pass);
		PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT * from userdb");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			String username=rs.getString("username");
			String password=rs.getString("pass");
			out.println("Username "+username+" Pass "+password+"<hr>");
		}
		
		
		
    }
	
	
	

%>
</body>
</html>