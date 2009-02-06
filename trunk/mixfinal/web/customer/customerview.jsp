<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp"%>
<%@ include file="deletecustomer.jsp" %>
<%@ include file="addcustomer.jsp" %>
<%@ include file="../ck_session_customer.jsp" %>
<!-- ให้ ใช้ text field เก็บค่า แล้ว ห้ามแก้ไข ไว้ -->
<% if(state){ %>
         <div id="navcontainer">
             <ul id="navlist">
               <!-- CSS Tabs -->
               <li><a href="index.jsp">หน้าแรก</a></li>
               <li><a href="index.jsp?pages=createcustomer">สร้างข้อมูลลูกค้า</a></li>
               <li id="active"><a id="current" href="index.jsp?pages=customerview">ข้อมูลลูกค้าทั้งหมด</a></li>
               <li><a href="#">ข้อมูลรายบุคคล</a></li>
               <li><a  href="#">แก้ไขข้อมูล</a></li>
             </ul>
         </div>
         <br>
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
    sql="select * from customer limit "+pages+","+limit;
    rs=stmt.executeQuery(sql);
    out.print("<table  id=\"gradient-style\" width=\"100%\">" +
              "<thead><tr>" +
              "<th scope=\"col\" >รหัส</th>" +
              "<th scope=\"col\" >ชื่อ</th>" +
              "<th scope=\"col\" >นามสกุล</th>" +
              "<th scope=\"col\" >ชนิดลูกค้า</th>" +
              "<th scope=\"col\" >ดูข้อมูล</th>" +
              "<th scope=\"col\" >แก้ไข</th>" +
              "<th scope=\"col\" >ลบ</th>" +
              "</tr></thead><tbody>");
    %>
    <%
      for(int i=0;i<30;i++){
        out.println("<tr>");
        if(rs.next()){
          out.print("<td>" + rs.getString("customer_id") + "</td>\n" +
                    "<td>" + rs.getString("name") + "</td>\n" +
                    "<td>" + rs.getString("lastname") + "</td>\n" +
                    "<td>" + rs.getString("type") + "</td>\n" );
          out.print("<td><a href=\"index.jsp?pages=datacustomer&customer_id="+rs.getString("customer_id")+"\" >ดูข้อมูล</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=editcustomer&customer_id="+rs.getString("customer_id")+"\" >แก้ไข</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=customerview&delete=1&customer_id="+rs.getString("customer_id")+"\" >ลบ</a></td>\n");
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
<% } %>