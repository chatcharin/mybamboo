<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
     String menu_name = request.getParameter("menu_name");
     String menu_type = request.getParameter("menu_type");
     String detail = request.getParameter("detail");
     String link = request.getParameter("link");
     String status = request.getParameter("status");
     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, pw);
     Statement stmt = con.createStatement();
     String sql;
     ResultSet rs=null;
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
     sql ="INSERT INTO `cms`.`menu` (`menu_id`, `menu_name`, `menu_type`, `menu_detail`, `menu_link`, `menu_content`, `menu_status`)" +
          " VALUES (null,'"+menu_name+"','"+menu_type+"','"+detail+"','"+link+"',null,"+status+")";
     //out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
%>
<jsp:forward page="menu.jsp"></jsp:forward>
<!-- ตรวจสอบ ว่า error หรือไม่  -->
