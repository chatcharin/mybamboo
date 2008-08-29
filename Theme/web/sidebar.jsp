<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="admin/config.jsp"%>
<%
      Class.forName(driver);
      Connection con=DriverManager.getConnection(url,user,pw);
      Statement stmt=con.createStatement();
      String sql;ResultSet rs=null;
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
      sql="select menu_id,menu_name from menu where menu_status = 1 ;";
      rs=stmt.executeQuery(sql);
          out.println("<ul class=\"navlist\"> \n");
      while(rs.next()){
         out.print("<li><a href=\"page.jsp?menu_id=" + rs.getString("menu_id") + "\">" +
                   "<span>" + rs.getString("menu_name") + "</span></a></li>\n");
       }
      out.println("<li><a href=\"admin/\"><span>Admin</span></a></li>\n </ul> \n");
     rs.close();
     stmt.close();
     con.close();
%>