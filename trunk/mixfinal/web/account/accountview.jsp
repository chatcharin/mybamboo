<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp"%>
<%@ include file="deleteaccount.jsp" %>
         <div id="navcontainer">
             <ul id="navlist">
               <!-- CSS Tabs -->
               <li><a href="index.jsp">หน้าแรก</a></li>
               <li id="active"><a id="current" href="index.jsp?pages=customerview">บัญชีซื้อขายทั้งหมด</a></li>
               <li><a href="#">รายละเอียดบัญชี</a></li>
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
    sql="select * from account limit "+pages+","+limit;
    rs=stmt.executeQuery(sql);
    out.print("<table  id=\"gradient-style\" width=\"100%\">" +
              "<thead><tr>" +
              "<th scope=\"col\" >รหัส</th>" +
              "<th scope=\"col\" >ซื้อ</th>" +
              "<th scope=\"col\" >ขาย</th>" +
              "<th scope=\"col\" >วันที่</th>" +
              "<th scope=\"col\" >น้ำหนัก</th>" +
              "<th scope=\"col\" >รหัสลูกค้า</th>" +
              "<th scope=\"col\" >รหัสพนักงาน</th>" +
              "<th scope=\"col\" >รหัสคลังสินค้า</th>" +
              "<th scope=\"col\" >ดูข้อมูล</th>" +
              "<th scope=\"col\" >แก้ไข</th>" +
              "<th scope=\"col\" >ลบ</th>" +
              "</tr></thead><tbody>");
    %>
    <%
      for(int i=0;i<30;i++){
        out.println("<tr>");
        if(rs.next()){
          out.print("<td>" + rs.getString("account_id") + "</td>\n" +
                    "<td>" + String.valueOf(rs.getDouble("buy")) + "</td>\n" +
                    "<td>" + String.valueOf(rs.getDouble("sale")) + "</td>\n");
          try{
          out.print("<td>" + String.valueOf(rs.getDate("account_date"))+ "</td>\n");
          }catch(Exception e){
          out.print("<td>0000-00-00</td>\n");
          }
          out.print("<td>" + String.valueOf(rs.getDouble("weight")) + "</td>\n" );
          out.print("<td><a href=\"index.jsp?pages=datacustomer&customer_id="+rs.getString("customer_id")+"\" >"+rs.getString("customer_id")+"</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=dataemployee&employee_id="+rs.getString("employee_id")+"\" >"+rs.getString("employee_id")+"</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=datastore&store_id="+rs.getString("store_id")+"\" >"+rs.getString("store_id")+"</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=dataacount&account_id="+rs.getString("account_id")+"\" >ดูข้อมูล</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=editaccount&account_id="+rs.getString("account_id")+"\" >แก้ไข</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=accountview&delete=1&account_id="+rs.getString("account_id")+"\" >ลบ</a></td>\n");
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
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td class="rounded-foot-right"></td>
        </tr>
    </tfoot>
</table>