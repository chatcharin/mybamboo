<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="header.jsp"%>
<%@ include file="config.jsp"%>
<%
Vector errors=new Vector();
String j_username=request.getParameter("j_username");
String j_password=request.getParameter("j_password");
Class.forName(driver);
Connection con=DriverManager.getConnection(url,user,pw);
Statement stmt=con.createStatement();
String sql;ResultSet rs=null;
if(j_username.equals("")||j_password.equals("")){
errors.add("ตรวจสอบ username หรือ password");
}else{ 
//ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
sql="select * from customer where username ='"+j_username+"' and password='"+j_password+"'";
rs=stmt.executeQuery(sql);
if(rs.next()){
session.setAttribute("status","customer");
session.setAttribute("j_username",j_username);
session.setAttribute("j_fname",rs.getString("fname"));
session.setAttribute("j_lname",rs.getString("lname"));
session.setAttribute("j_email",rs.getString("email"));
session.setAttribute("cus_id",rs.getString("cus_id"));
}else{
errors.add("ชื่อ username หรือ password ไม่ถูกต้อง");
}
}
if(errors.size()>0){
%><%@ include file="ckError.jsp"%><%
}else{
response.sendRedirect("customer.jsp");
}
%>