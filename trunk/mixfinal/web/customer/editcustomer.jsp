<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>  
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp" %>
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
    <td width="614" valign="top" bgcolor="#FFFFFF">
      <form action="updatecustomer.jsp">
      <table width="578" height="536" border="0" align="center">
      <tr>
        <td height="26" background="56235623.jpg">
          <div align="center" class="style66">ส่วนเพิมข้อมูลผู้ใช้</div></td>
          <td>
            <embed src="http://www.clocklink.com/clocks/5003-green.swf?TimeZone=ICT&amp;Place=&amp;DateFormat=yyyy+/+mm+/+dd+DDD&amp;TimeFormat=hh:mm:ss+TT&amp;"  width="240" height="20" align="right" wmode="transparent" type="application/x-shockwave-flash">
            </embed>
          </td>
      </tr>
      <tr>
        <td height="26">
          <input size="20" type="text"
          style="display:none"
          name="customer_id"
          value="<% out.print(rs.getString("customer_id")); %>" />
        </td>
        <td></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ชื่อ</div>
        </td>
        <td>
          <input type="text" name="name"
          value="<% out.print(rs.getString("name")); %>" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">นามสกุล</div>
          </td>
        <td>
          <input type="text" name="lastname"
          value="<% out.print(rs.getString("lastname")); %>" />
          </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">อายุ</div>
          </td>
        <td>
          <input name="age" type="text" size="2"
          value="<% out.print(rs.getString("age")); %>"/>
          <span class="style45">ปี</span>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">เพศ</div>
        </td>
        <td>
          <select name="sex">
           <option 
           <% if(rs.getString("sex").equals("ชาย"))
                out.print("selected=\"selected\"");
           %>>ชาย</option>
            <option
             <% if(rs.getString("sex").equals("หญิง"))
                out.print("selected=\"selected\"");
           %>>หญิง</option>
            <option
             <% if(rs.getString("sex").equals("เพศที่สาม"))
                out.print("selected=\"selected\"");
           %>>เพศที่สาม</option>
           </select>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ที่อยู่</div>
        </td>
        <td>
          <span class="style30">
            <textarea name="address" rows="4" cols="20">
             <% out.print(rs.getString("address")); %> 
            </textarea>
          </span>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style23">
            <span class="style51">เบอร์โทรศัพท์</span>
            </div>
          </td>
        <td>
          <input type="text" name="tel"
          value="<% out.print(rs.getString("tel")); %>" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">หมายเลขบัตรประจำตัวประชาชน</div>
          </td>
        <td>
          <span class="style30">
          <input name="idcard" type="text" maxlength="13"
          value="<% out.print(rs.getString("idcard")); %>" />
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
          <select name="type">
          <option
             <% if(rs.getString("type").equals("Employee"))
                out.print("selected=\"selected\"");
           %>>Employee</option>
          <option
            <% if(rs.getString("type").equals("Administrator"))
                out.print("selected=\"selected\"");
           %>>Administrator</option>
           <option
            <% if(rs.getString("type").equals("Administrator"))
                out.print("selected=\"selected\"");
           %>>Administrator</option>
        </select></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">รถ</div>
        </td>
        <td>
          <input type="text" name="car"
           value="<% out.print(rs.getString("car")); %>" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">idcar</div>
        </td>
        <td>
          <input type="text" name="idcar"
           value="<% out.print(rs.getString("idcar")); %>"/>
        </td>
      </tr>
      <tr>
        <td height="23"></td>
        <td></td>
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