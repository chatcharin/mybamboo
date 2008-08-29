<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%   String menu_id = request.getParameter("menu_id");
     String menu_name = request.getParameter("menu_name");
     String menu_type = request.getParameter("menu_type");
     String detail = request.getParameter("detail");
     String link = request.getParameter("link");
     String menu_content = request.getParameter("menu_content");
     String status = null;
            status = request.getParameter("status");
     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, pw);
     Statement stmt = con.createStatement();
     String sql;
     if(status==null)
       status="0";
     ResultSet rs=null;
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
     sql ="UPDATE  `menu` set "+
             " `menu_name`='"+
             menu_name+"', `menu_type`='"+
             menu_type+"', `menu_detail`='"+
             detail+"', `menu_link`='"+
             link+"', `menu_content`='"+
             menu_content+"', `menu_status`="+
             status+" " +
             " where menu_id ="+ menu_id;
     out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
%>
<jsp:forward page="menu.jsp"></jsp:forward>
<!-- ตรวจสอบ ว่า error หรือไม่  -->