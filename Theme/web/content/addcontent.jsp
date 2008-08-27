<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
     String content_name = request.getParameter("content_name");
     String content_type = request.getParameter("content_type");
     String content_text = request.getParameter("content");
     String detail = request.getParameter("detail");
     String link = request.getParameter("link");
     String status = request.getParameter("status");
     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, pw);
     Statement stmt = con.createStatement();
     String sql;
     ResultSet rs=null;
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
     sql ="INSERT INTO `cms`.`content` (`menu_id`, `content_name`, `content_type`, `content_detail`, `content_link`, `content_text`, `content_status`)" +
          " VALUES (null,'"+content_name+"','"+content_type+"','"+detail+"','"+link+"','"+content_text+"',"+status+")";
     //out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
%>
<jsp:forward page="menuview.jsp"></jsp:forward>
<!-- ตรวจสอบ ว่า error หรือไม่  -->
