<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
      String id = request.getParameter("account_id");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="delete from account where account_id="+id;
      stmt.executeUpdate(sql);
      stmt.close();
      con.close();
%>
<jsp:forward page="index.jsp"></jsp:forward>