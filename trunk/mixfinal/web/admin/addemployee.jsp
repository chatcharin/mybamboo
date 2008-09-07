<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%@page pageEncoding="UTF-8"%>
<%
      String name = request.getParameter("name");
      String lastname = request.getParameter("lastname");
      String age = request.getParameter("age");
      String sex = request.getParameter("sex");
      String address = request.getParameter("address");     
      String tel = request.getParameter("tel");
      String idcard = request.getParameter("idcard");
      String access = request.getParameter("access");
      String username = request.getParameter("username");
      String passwd = request.getParameter("passwd");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql = "insert into employee values(null,'"+name+
            "','"+lastname+
            "','"+access+
            "','"+passwd+
            "','"+username+
            "','"+sex+
            "','"+address+
            "','"+tel+
            "','"+age+
            "','"+idcard+
            "')";
      stmt.executeUpdate(sql);
      stmt.close();
      con.close();
  %>
  <jsp:forward page="employeeview.jsp"></jsp:forward>