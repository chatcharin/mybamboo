<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%   String content_id = request.getParameter("content_id");
     String content_name = request.getParameter("content_name");
     String content_type = request.getParameter("content_type");
     String detail = request.getParameter("detail");
     String link = request.getParameter("link");
     String content_content = request.getParameter("content_content");
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
     sql ="UPDATE  `content` set "+
             " `content_name`='"+
             content_name+"', `content_type`='"+
             content_type+"', `content_detail`='"+
             detail+"', `content_link`='"+
             link+"', `content_content`='"+
             content_content+"', `content_status`="+
             status+" " +
             " where content_id ="+ content_id;
     out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
%>
<jsp:forward page="contentview.jsp"></jsp:forward>
<!-- ตรวจสอบ ว่า error หรือไม่  -->