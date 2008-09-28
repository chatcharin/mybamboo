<%@page pageEncoding="UTF-8"%>
<%
     String update = null;
     update = request.getParameter("update");
     if(update!=null){
     String customer_id   = request.getParameter("customer_id");
     String name          = request.getParameter("name");
     String lastname      = request.getParameter("lastname");
     String car           = request.getParameter("car");
     String idcar         = request.getParameter("idcar");
     String sex           = request.getParameter("sex");
     String type          = request.getParameter("type");
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
     sql ="UPDATE  `customer` set "+
          " `name`='"+ name+
          "', `lastname`='"+ lastname+
          "', `sex`='"+sex+
          "', `age`='"+age+
          "', `address`='"+address+
          "', `type`='"+type+
          "', `car`='"+car+
          "', `idcar`='"+idcar+
          "', `tel`='"+tel+
          "', `idcard`='"+idcard+ 
          "' where customer_id ="+ customer_id;
   //   out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
     }
%>