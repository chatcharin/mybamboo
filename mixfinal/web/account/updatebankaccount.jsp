package bankcredit;

package credit_1;

package account_1;

<%@page pageEncoding="UTF-8"%>
<%
     String update = null;
     update = request.getParameter("update");
     if(update!=null){
     String accountbank_id  = request.getParameter("accountbank_id");
     String bank_id         = request.getParameter("bank_id");
     String status          = request.getParameter("status");
     String value           = request.getParameter("value");
     String detail          = request.getParameter("detail");
     Class.forName(driver);
     Connection con = DriverManager.getConnection(url, user, pw); 
     Statement stmt = con.createStatement();
     String sql;
     ResultSet rs=null;
     //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
     sql ="UPDATE  `accountbank` set "+
          " `bank_id`="+bank_id+
          ", `status`="+status+
          ", `value`='"+value+
          "', `detail`="+detail+
          " where bank_id ="+ bank_id;
   //   out.print(sql);
     stmt.execute(sql);
     stmt.close();
     con.close();
     }
%>