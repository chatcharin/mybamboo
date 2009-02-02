package credit_1;

package credit;

<%@page pageEncoding="UTF-8"%>
<%
      String delete = null;
      delete = request.getParameter("delete");
      if(delete!=null){
      String id = request.getParameter("bank_id");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="delete from bank where bank_id="+id;
      stmt.executeUpdate(sql);
      stmt.close();
      con.close();
      }
%>