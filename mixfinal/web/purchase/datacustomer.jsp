<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>  
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp" %>
<% 
      String id = request.getParameter("customer_id");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="select * from customer where customer_id="+id;
      ResultSet rs=null;
      rs=stmt.executeQuery(sql); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<% if(rs.next()){ %>
<!--%@ include file="ck_session_customer.jsp"% -->
      <table width="100%">
      <tr>
        <td height="26">
          <a href="<% out.print(rs.getString("customer_id")); %>" />
        </td>
        <td></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ชื่อ</div>
        </td>
        <td>
              <% out.print(rs.getString("name")); %>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">นามสกุล</div>
          </td>
        <td>
        <% out.print(rs.getString("lastname")); %>
         </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">หมายเลขบัตรประจำตัวประชาชน</div>
          </td>
        <td>
          <span class="style30">
          <% out.print(rs.getString("idcard")); %>"
          </span>
        </td>
      </tr>    
      <tr>
        <td height="23">
          <span class="style23"></span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ชนิดลูกค้า</div>
        </td>
        <td>
            <% 
                out.print(rs.getString("type"));
           %>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">รถ</div>
        </td>
        <td>
          <% out.print(rs.getString("car")); %>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ทะเบียนรถ</div>
        </td>
        <td>
         <% out.print(rs.getString("idcar")); %>           
        </td>
      </tr>
      <tr>
        <td height="23"></td>
        <td></td>
      </tr>
    </table>
<%
     }
    rs.close();
    stmt.close();
    con.close();
 %>