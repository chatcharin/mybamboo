<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp"%>  
 <td width="620" valign="top" bgcolor="#FFFFFF">
      <table width="550">
      <tr>
        <td width="202" background="56235623.jpg"><div align="center"><span class="style66">&#3626;&#3656;&#3623;&#3609;&#3585;&#3634;&#3619;&#3649;&#3585;&#3657;&#3652;&#3586;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3650;&#3611;&#3619;&#3649;&#3585;&#3619;&#3617;</span></div></td>
        <td width="336"><embed src="http://www.clocklink.com/clocks/5003-green.swf?TimeZone=ICT&amp;Place=&amp;DateFormat=yyyy+/+mm+/+dd+DDD&amp;TimeFormat=hh:mm:ss+TT&amp;"  width="240" height="20" align="right" wmode="transparent" type="application/x-shockwave-flash"> </embed></td>
      </tr>
<%
    Class.forName(driver);
    Connection con=DriverManager.getConnection(url,user,pw);
    Statement stmt=con.createStatement();
    String sql;ResultSet rs=null;
   //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
    sql="select * from riceprice ";
    rs=stmt.executeQuery(sql);
    out.print( "<tr>" +
         "<td>รหัส</td>" +
         "<td>ชื่อ</td>" +
         "<td>คำอธิบาย</td>" +
         "<td>ราคา</td>" +
         "<td>แก้ไข</td>" +
         "</tr>");
      for(int i=0;i<30;i++){
        out.println("<tr>");
        if(rs.next()){
          out.print("<td>" + rs.getString("id_rice") + "</td>\n" +
                    "<td>" + rs.getString("nametype") + "</td>\n" +
                    "<td>" + rs.getString("description") + "</td>\n" +
                    "<td>" + rs.getString("price") + "</td>\n");
          out.print("<td><a href=\"edittype.jsp?id_rice="+rs.getString("id_rice")+"\" >แก้ไข</a></td>\n");
       }
       out.println("</tr>");
      }
    out.println("</table>");
            //page next 1 2 3 4 ....

%>
    </td>