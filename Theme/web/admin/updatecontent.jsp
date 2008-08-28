<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%> 
<%
     String content_id    = request.getParameter("content_id");
     String menu_id       = request.getParameter("menu_id");
     String content_title = request.getParameter("content_title");     
     String content_type  = request.getParameter("content_type");
     String level         = request.getParameter("level");
     String content_pos   = request.getParameter("content_pos");     
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
     if(status==null)
       status="0";
     ResultSet rs=null;
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
     sql ="UPDATE  `content` set "+
          " `menu_id`="+ menu_id+
          ", `content_title`='"+ content_title+
          "', `content_type`='"+content_type+
          "', `level`="+level+      
          ", `content_pos`="+content_pos+
          ", `content_intro`='"+content_intro+
          "', `content_text`='"+content_text+
          "', `status`="+status+
          " where content_id ="+ content_id;
     out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
%>
<jsp:forward page="contentview.jsp"></jsp:forward>
<!-- ตรวจสอบ ว่า error หรือไม่  -->