<%@page pageEncoding="UTF-8"%>
<%
     String update = null;
     update = request.getParameter("update");
     if(update!=null){
     String account_id   = request.getParameter("account_id");
     String buy           = request.getParameter("buy");
     String sale          = request.getParameter("sale");
     String account_date  = request.getParameter("account_date");
     String weight        = request.getParameter("weight");
     String customer_id   = request.getParameter("customer_id");
     String employee_id   = request.getParameter("employee_id");
     String store_id      = request.getParameter("store_id"); 
     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, pw); 
     Statement stmt = con.createStatement();
     String sql;
     ResultSet rs=null;
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
     sql ="UPDATE  `account` set "+
          " `buy`="+ buy+
          ", `sale`="+ sale+
          ", `account_date`='"+account_date+
          "', `weight`="+weight+
          ", `customer_id`="+customer_id+
          ", `employee_id`="+employee_id+
          ", `store_id`="+store_id+
          " where customer_id ="+ account_id;
   //   out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
     }
%>