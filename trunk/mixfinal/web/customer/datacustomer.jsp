<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>  
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp" %>
<%@ include file="updatecustomer.jsp" %>
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
      <div id="navcontainer">
             <ul id="navlist">
               <!-- CSS Tabs -->
               <li><a href="index.jsp">หน้าแรก</a></li>
               <li><a href="index.jsp?pages=createcustomer">สร้างข้อมูลลูกค้า</a></li>
               <li ><a href="index.jsp?pages=customerview">ข้อมูลลูกค้าทั้งหมด</a></li>
               <li id="active"><a id="current" href="#">ข้อมูลรายบุคคล</a></li>
               <li><a  href="#">แก้ไขข้อมูล</a></li>
             </ul>
       </div>
       <br>
      <form action="updatecustomer.jsp">
      <table width="100%"  height="536" border="0" >
      <tr>
        <td height="26" background="56235623.jpg">
          <div align="center" class="style66">ข้อมูลผู้ใช้</div></td>
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
          <div align="right" class="style45">อายุ</div>
          </td>
        <td>
          <% out.print(rs.getString("age")); %>
          <span class="style45">ปี</span>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">เพศ</div>
        </td>
        <td>
             <%  out.print(rs.getString("sex"));%>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ที่อยู่</div>
        </td>
        <td>
          <span class="style30">
             <% out.print(rs.getString("address")); %> 
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
          <% out.print(rs.getString("tel")); %>
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
          <div align="right" class="style45">idcar</div>
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
    </form>
<%
     }
    rs.close();
    stmt.close();
    con.close();
 %>