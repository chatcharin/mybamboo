<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
          Class.forName(driver);
          Connection con=DriverManager.getConnection(url,user,pw);
          Statement stmt=con.createStatement();
          String sql;ResultSet rs=null;
          sql="select price from riceprice";
          out.println("var price = new Array(3);");
          rs=stmt.executeQuery(sql);
          rs.next();
          out.println("price[0]='"+rs.getString("price")+"';");
          rs.next();
          out.println("price[1]='"+rs.getString("price")+"';");
          rs.next();
          out.println("price[2]='"+rs.getString("price")+"';");        
 %>
