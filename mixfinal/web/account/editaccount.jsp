<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>  
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp" %>
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
<!--%@ include file="ck_session_customer.jsp"% -->
      <div id="navcontainer">
             <ul id="navlist">
               <!-- CSS Tabs -->
               <li><a href="index.jsp">หน้าแรก</a></li>
               <li><a href="index.jsp?pages=accountview">บัญชีซื้อขายทั้งหมด</a></li>
               <li><a href="#">รายละเอียดบัญชี</a></li>
               <li id="active"><a id="current" href="#">แก้ไขข้อมูล</a></li>
             </ul>
       </div>
       <br>
      
      <table width="100%"  height="536" border="0" >
      <form action="index.jsp">
      <tr>
        <td height="26" background="56235623.jpg">
          <div align="center" class="style66">แก้ไขบัญชี</div></td>
          <td>
            <embed src="http://www.clocklink.com/clocks/5003-green.swf?TimeZone=ICT&amp;Place=&amp;DateFormat=yyyy+/+mm+/+dd+DDD&amp;TimeFormat=hh:mm:ss+TT&amp;"  width="240" height="20" align="right" wmode="transparent" type="application/x-shockwave-flash">
            </embed>
          </td>
      </tr>
      <tr>
        <td height="26">
          <input size="15" type="text"
          style="display:none"
          name="account_id"
          value="<% out.print(rs.getString("account_id")); %>" />
          <input size="10" type="text"
          style="display:none"
          name="update" value="1" />
          <input style="display:none" type="text" name="pages" value="accountview" />
        </td>
        <td></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ซื้อ</div>
        </td>
        <td>
          <input type="text" name="buy"
                 value="<% out.print(rs.getDouble("buy")); %>" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ขาย</div>
          </td>
        <td>
          <input type="text" name="sale"
                 value="<% out.print(rs.getDouble("sale")); %>" />
          </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">วันที่</div>
          </td>
        <td>
          <input name="account_date" type="text"
          value="<% 
          try{
          out.print(rs.getDate("account_date")); 
          }catch(Exception e){
          out.print("0000-00-00"); 
          }%>"/>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">น้ำหนัก</div>
        </td>
        <td>
          <input type="text" name="weight"
                 value="<% out.print(rs.getDouble("weight")); %>" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style23">
            <span class="style51">รหัสลูกค้า</span>
            </div>
        </td>
        <td>
          <input  type="text" name="customer_id"
                 value="
                 <% out.print(rs.getInt("customer_id")); %>"
             />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style23">
            <span class="style51">รหัสพนักงาน</span>
            </div>
          </td>
        <td>
          <input type="text" name="employee_id"
          value="<% out.print(rs.getString("employee_id")); %>" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">รหัสคลังสินค้า</div>
          </td>
        <td>
          <span class="style30">
          <input name="store_id" type="text" maxlength="13"
          value="<% out.print(rs.getString("store_id")); %>" />
          </span>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">รหัสคลังสินค้า</div>
          </td>
        <td>
          <span class="style30">
          <input name="credit_id" type="text" maxlength="13"
          value="<% out.print(rs.getString("credit_id")); %>" />
          </span>
        </td>
      </tr>
      <tr>
        <td height="23"></td>
        <td><input type="submit" name="Submit" value="  แก้ไข  " /> <input type="button" name="Submit22" value="  ยกเลิก  " /></td>
      </tr>
      </form>
    </table>
<%
     }
    rs.close();
    stmt.close();
    con.close();
 %>