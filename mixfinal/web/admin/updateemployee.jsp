<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp"%> 
<%
     String employee_id   = request.getParameter("employee_id");
     String name          = request.getParameter("name");
     String lastname      = request.getParameter("lastname");
     String passwd        = request.getParameter("passwd");
     String username      = request.getParameter("username");
     String sex           = request.getParameter("sex");
     String access        = request.getParameter("access");
     String address       = request.getParameter("address"); 
     String age           = request.getParameter("age");
     String idcard        = request.getParameter("idcard");
     String tel           = request.getParameter("tel");
     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, pw); 
     Statement stmt = con.createStatement();
     String sql;
     ResultSet rs=null;
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
     sql ="UPDATE  `employee` set "+
          " `name`='"+ name+
          "', `lastname`='"+ lastname+
          "', `passwd`='"+passwd+
          "', `username`='"+username+
          "', `sex`='"+sex+
          "', `access`='"+access+
          "', `address`='"+address+
          "', `age`='"+age+
          "', `tel`='"+tel+
          "', `idcard`='"+idcard+ 
          "' where employee_id ="+ employee_id;
   //   out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
%>
<jsp:forward page="employeeview.jsp"></jsp:forward >
<!-- ตรวจสอบ ว่า error หรือไม่  -->