<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="template/header.jsp"></jsp:include>    
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp" %>
<% 
      String id = request.getParameter("account_id");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="select * from account where account_id="+id;
      ResultSet rs=null;
      rs=stmt.executeQuery(sql); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<% if(rs.next()){ %>
<div style="width:300px;">
  <form action="updatebuy.jsp" >
     <input size="20" type="text"  style="display:none" name="account_id" value="<% out.print(rs.getString("account_id")); %>" />
     <div align="right">
      จำนวนเงิน: <input size="20" type="text" name="buy" value="<% out.print(rs.getString("buy")); %>" /><br>
        วันที่ซื้อ: <input size="20" disabled type="text" name="date" value="<% out.print(rs.getString("date")); %>" /><br>
        น้ำหนัก: <input size="20"  type="text" name="wieght" value="<% out.print(rs.getString("weight")); %>" /><br>
       รหัสผู้ซื้อ: <input size="20" type="text"  name="customer_id" value="<% out.print(rs.getString("customer_id")); %>" /><br>
      รหัสผู้ขาย: <input size="20" type="text" disabled  name="employee_id" value="<% out.print(rs.getString("employee_id")); %>" /><br>
      รหัสคลังสินค้า: <input size="20" type="text" disabled  name="employee_id" value="<% out.print(rs.getString("employee_id")); %>" /><br>
      <input type="submit" value="แก้ไข" />
      <input type="reset"  value="ยกเลิก"> 
     </div>
</form>
</div>
<%
     }
    rs.close();
    stmt.close();
    con.close();
 %>
 <jsp:include page="template/footer.jsp"></jsp:include>