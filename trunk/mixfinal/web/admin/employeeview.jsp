<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp"%>
<%@ include file="deleteemployee.jsp" %>
<%@ include file="addemployee.jsp" %>
     <div id="navcontainer" align="center">
             <ul id="navlist">
               <!-- CSS Tabs -->
               <li><a href="index.jsp">หน้าแรก</a></li>
               <li ><a href="index.jsp?pages=createemployee">สร้างข้อมูลผู้ใช้</a></li>
               <li id="active"><a id="current" href="index.jsp?pages=employeeview">ข้อมูลผู้ใช้ทั้งหมด</a></li>
               <li><a href="#">ข้อมูลรายบุคคล</a></li>
               <li><a href="#">แก้ไขข้อมูล</a></li>
             </ul>
       </div>
<%
    String pages=null;
           pages=request.getParameter("page");
    String limit=null;
           limit=request.getParameter("limit");
    Class.forName(driver);
    Connection con=DriverManager.getConnection(url,user,pw);
    Statement stmt=con.createStatement();
    String sql;ResultSet rs=null;
    if(limit==null)
    {
      pages="0";
      limit="10";
    }
   //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
    sql="select * from employee limit "+pages+","+limit;
    rs=stmt.executeQuery(sql);
    out.print("<table id=\"gradient-style\" width=\"100%\">" +
         "<tr>" +
         "<th>รหัส</th>" +
         "<th>ชื่อ</th>" +
         "<th>นามสกุล</th>" +
         "<th>ชื่อผู้ใช้</th>" +
         "<th>รหัสผ่าน</th>" +
         "<th>เพศ</th>" +
         "<th>อายุ</th>" +
         "<th>รหัสบัตรประชาชน</th>" +
         "<th>ดูข้อมูล</th>" +
         "<th>แก้ไข</th>" +
         "<th>ลบ</th>" +
         "</tr></thead><tbody>");
      for(int i=0;i<30;i++){
        out.println("<tr>");
        if(rs.next()){
          out.print("<td>" + rs.getString("employee_id") + "</td>\n" +
                    "<td>" + rs.getString("name") + "</td>\n" +
                    "<td>" + rs.getString("lastname") + "</td>\n" +
                    "<td>" + rs.getString("username") + "</td>\n" +
                    "<td>" + rs.getString("passwd") + "</td>\n" +
                    "<td>" + rs.getString("sex") + "</td>\n" +
                //    "<td>" + rs.getString("access") + "</td>\n" +
                    "<td>" + rs.getString("age") + "</td>\n" +
                    "<td>" + rs.getString("idcard") + "</td>\n");
          out.print("<td><a href=\"index.jsp?pages=dataemployee&employee_id="+rs.getString("employee_id")+"\" >ดูข้อมูล</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=editemployee&employee_id="+rs.getString("employee_id")+"\" >แก้ไข</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=employeeview&employee_id="+rs.getString("employee_id")+"\" >ลบ</a></td>\n");
       }
       out.println("</tr>");
      }
    out.println("</tbody>");
            //page next 1 2 3 4 ....
%>
<tfoot>
    	<tr>
        	<td colspan="4" class="rounded-foot-left"><em>The above data were fictional and made up, please do not sue me</em></td>
                <td></td>
                <td></td>
                <td class="rounded-foot-right">&nbsp;</td>
        </tr>
    </tfoot>
</table>