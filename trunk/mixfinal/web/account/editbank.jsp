package credit_1;

package credit;

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>  
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp" %>
<% 
      String id = request.getParameter("bank_id");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="select * from bank where bank_id="+id;
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
               <li><a href="index.jsp?pages=accountview">บัญชีธนาคาร</a></li>
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
          name="bank_id"
          value="<% out.print(rs.getString("bank_id")); %>" />
          <input size="10" type="text"
          style="display:none"
          name="update" value="1" />
          <input style="display:none" type="text" name="pages" value="bankview" />
        </td>
        <td></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ชื่อบัญชี</div>
        </td>
        <td>
          <input type="text" name="bankname"
                 value="<% out.print(rs.getString("bankname")); %>" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">เลขบัณชี</div>
          </td>
        <td>
          <input type="text" name="accountnumber"
                 value="<% out.print(rs.getString("accoutnumber")); %>" />
          </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">จำนวนเงิน</div>
          </td>
        <td>
          <input name="value" type="text"
          value="<% 
          out.print(rs.getString("value"));
          %>"/>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">รายละเอียด</div>
        </td>
        <td>
          <input type="text" name="detail"
                 value="<% out.print(rs.getString("detail")); %>" />
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