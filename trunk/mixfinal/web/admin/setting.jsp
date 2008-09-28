<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp"%>  
    <div id="navcontainer" align="center">
             <ul id="navlist">
               <!-- CSS Tabs -->
               <li><a href="index.jsp">หน้าแรก</a></li>
               <li ><a href="index.jsp?pages=createemployee">สร้างชนิดข้าว</a></li>
               <li id="active"><a id="current" href="index.jsp?pages=employeeview">ข้อมูลชนิดข้าว</a></li>
               <li><a href="#">แก้ไขข้อมูล</a></li>
             </ul>
       </div>
<%
    Class.forName(driver);
    Connection con=DriverManager.getConnection(url,user,pw);
    Statement stmt=con.createStatement();
    String sql;ResultSet rs=null;
   //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
    sql="select * from riceprice ";
    rs=stmt.executeQuery(sql);
    out.print("<table id=\"gradient-style\" width=\"100%\">" +
         "<thead><tr>" +
         "<th>รหัส</th>" +
         "<th>ชื่อ</th>" +
         "<th>คำอธิบาย</th>" +
         "<th>ราคา</th>" +
         "<th>แก้ไข</th>" +
         "</tr></thead><tbody>");
      for(int i=0;i<30;i++){
        out.println("<tr>");
        if(rs.next()){
          out.print("<td>" + rs.getString("id_rice") + "</td>\n" +
                    "<td>" + rs.getString("nametype") + "</td>\n" +
                    "<td>" + rs.getString("description") + "</td>\n" +
                    "<td>" + rs.getString("price") + "</td>\n");
          out.print("<td><a href=\"index.jsp?pages=edittype&id_rice="+rs.getString("id_rice")+"\" >แก้ไข</a></td>\n");
       }
       out.println("</tr>");
      }
    out.println("</tbody>");
            //page next 1 2 3 4 ....

%>
<tfoot>
    	<tr>
        	<td colspan="4" class="rounded-foot-left"><em>The above data were fictional and made up, please do not sue me</em></td>
                <td class="rounded-foot-right">&nbsp;</td>
        </tr>
    </tfoot>
</table>