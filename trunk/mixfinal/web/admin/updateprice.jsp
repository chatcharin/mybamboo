<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp"%> 
<%
     String id_rice      = request.getParameter("id_rice");
     String nametype     = request.getParameter("nametype");
     String description  = request.getParameter("description");
     String price        = request.getParameter("price");
     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, pw); 
     Statement stmt = con.createStatement();
     String sql;
     ResultSet rs=null;
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
     sql ="UPDATE  `riceprice` set "+
          " `nametype`='"+ nametype+
          "', `description`='"+ description+
          "', `price`="+price+
          " where id_rice ="+ id_rice;
   //   out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
%>
<jsp:forward page="setting.jsp"></jsp:forward >
<!-- ตรวจสอบ ว่า error หรือไม่  -->