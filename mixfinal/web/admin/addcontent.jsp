<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
     String content_name = request.getParameter("content_name");
     String content_type = request.getParameter("content_type");
     String content_title = request.getParameter("content_title");
     String menu_id       = request.getParameter("menu_id");
     String content_intro = request.getParameter("content_intro");
     String content_text  = request.getParameter("content_text");
     String comment_id    = null;     
            comment_id    = request.getParameter("comment_id");
     String status        = null;     
            status = request.getParameter("status");
     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, pw);
     Statement stmt = con.createStatement();
     String sql;
     ResultSet rs=null;
     if(status == null)
       status ="0";
     if(comment_id==null)
       comment_id ="0";
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
     sql ="INSERT INTO `cms`.`content` (`content_id`,`menu_id`, `content_title`" +
          ", `content_type`, `level`, `content_pos`,`content_intro`, `content_text`" +
          ",`comment_id`, `status`,`athor`,`dateedit`) VALUES (null,'"+menu_id+"','"+content_title+"','"+
          content_type+"',0,0,'"+content_intro+"','"+content_text+
          "',"+comment_id+","+status+",'',Now())";
   //  out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
%>
<jsp:forward page="index.jsp"></jsp:forward>
<!-- jsp:forward page="contentview.jsp"><!--/jsp:forward>
<!-- ตรวจสอบ ว่า error หรือไม่  -->
