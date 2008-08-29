<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
      String id = request.getParameter("menu_id");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="delete from menu where menu_id="+id;
      stmt.executeUpdate(sql);  
%>
<jsp:forward page="menu.jsp"></jsp:forward>