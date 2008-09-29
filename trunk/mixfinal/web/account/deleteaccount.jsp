<%@page pageEncoding="UTF-8"%>
<%
      String delete = null;
      delete = request.getParameter("delete");
      if(delete!=null){
      String id = request.getParameter("account_id");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="delete from account where account_id="+id;
      stmt.executeUpdate(sql);
      stmt.close();
      con.close();
      }
%>