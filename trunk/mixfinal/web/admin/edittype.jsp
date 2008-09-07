<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>  
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp" %>
<% 
      String id = request.getParameter("id_rice");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="select * from riceprice where id_rice="+id;
      ResultSet rs=null;
      rs=stmt.executeQuery(sql); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<% if(rs.next()){ %>
<!--%@ include file="ck_session_customer.jsp"% -->
    <td width="614" valign="top" bgcolor="#FFFFFF">
      <form action="updateprice.jsp">
      <table width="578" height="536" border="0" align="center">
      <tr>
        <td height="26" background="56235623.jpg">
          <div align="center" class="style66">แก้ไขราคา</div></td>
          <td>
            <embed src="http://www.clocklink.com/clocks/5003-green.swf?TimeZone=ICT&amp;Place=&amp;DateFormat=yyyy+/+mm+/+dd+DDD&amp;TimeFormat=hh:mm:ss+TT&amp;"  width="240" height="20" align="right" wmode="transparent" type="application/x-shockwave-flash">
            </embed>
          </td>
      </tr>
      <tr>
        <td height="26">
          <input size="20" type="text"
          style="display:none"
          name="id_rice"
          value="<% out.print(rs.getString("id_rice")); %>" />
        </td>
        <td></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ชื่อ</div>
        </td>
        <td>
          <input type="text" name="nametype"
          value="<% out.print(rs.getString("nametype")); %>" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">คำอธิบาย</div>
          </td>
        <td>
          <input type="text" name="description"
          value="<% out.print(rs.getString("description")); %>" />
          </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ราคา</div>
          </td>
        <td>
          <input name="price" type="text" size="2"
          value="<% out.print(rs.getString("price")); %>"/>
          <span class="style45">บาท</span>
        </td>
      </tr>
      
      <tr>
        <td height="23"></td>
        <td><input type="submit" name="Submit" value="  แก้ไข  " /> <input type="submit" name="Submit22" value="  ยกเลิก  " /></td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
<%
     }
    rs.close();
    stmt.close();
    con.close();
 %>