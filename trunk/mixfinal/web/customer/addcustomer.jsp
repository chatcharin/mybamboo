<%@page pageEncoding="UTF-8"%>
<%
      String add = null;
      add = request.getParameter("add");
      if(add!=null){
      String name = request.getParameter("name");
      String lastname = request.getParameter("lastname");
      String age = request.getParameter("age");
      String sex = request.getParameter("sex");
      String address = request.getParameter("address");     
      String tel = request.getParameter("tel");
      String idcard = request.getParameter("idcard");
      String car = request.getParameter("car");
      String idcar = request.getParameter("idcar");
      String type = request.getParameter("type");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql = "insert into customer values(null,'"+name+
            "','"+lastname+
            "','"+sex+
            "','"+age+
            "','"+address+
            "','"+tel+
            "','"+idcard+
            "','"+car+
            "','"+idcar+
            "','"+type+
            "')";
      stmt.executeUpdate(sql);
      stmt.close();
      con.close();
      }
  %>