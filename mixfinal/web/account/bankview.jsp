package bank;


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp"%>
<%@ include file="deleteaccount.jsp" %>
<%@ include file="../ck_session_customer.jsp" %>
<!-- ให้ ใช้ text field เก็บค่า แล้ว ห้ามแก้ไข ไว้ -->
<% if(state){ %>
         <div id="navcontainer">
             <ul id="navlist">
               <!-- CSS Tabs -->
               <li><a href="index.jsp">หน้าแรก</a></li>
               <li id="active"><a id="current" href="index.jsp?pages=accountview">บัญชีซื้อขายทั้งหมด</a></li>
               <li><a href="#">รายละเอียดบัญชีหนี้สิน</a></li>
               <li><a  href="#">แก้ไขข้อมูล</a></li>
             </ul>
         </div>
         <br>
<%

//deposit account
//deposit_id
//bankname
//accountnumber
//value
//table current account
// count row from table div by display in pages
// limit =  page nuber * pagedisplay
// end   =  limit + pagedisplay
    /*  Create two Table for Table
         CREATE TABLE `rice`.`bank` (
        `bank_id` INT NOT NULL AUTO_INCREMENT ,
        `bankname` VARCHAR( 60 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL ,
        `accountnumber` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL ,
        `value` DOUBLE NOT NULL DEFAULT '0.0',
        PRIMARY KEY ( `bank_id` )
        ) ENGINE = MYISAM

         CREATE TABLE `rice`.`acountbank` (
        `accountbank_id` INT NOT NULL AUTO_INCREMENT ,
        `bank_id` INT NOT NULL ,
        `status` VARCHAR( 40 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
        `value` DOUBLE NOT NULL ,
        PRIMARY KEY ( `accountbank_id` )
        ) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci
     */
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
    sql="select * from bank limit "+pages+","+limit;
    rs=stmt.executeQuery(sql);
    out.print("<table  id=\"gradient-style\" width=\"100%\">" +
              "<thead><tr>" +
              "<th scope=\"col\" >รหัส/th>" +
              "<th scope=\"col\" >ชื่อบัญชี</th>" +
              "<th scope=\"col\" >เลขบัญชี</th>" +
              "<th scope=\"col\" >จำนวนเงิน</th>" +
              "<th scope=\"col\" >รายละเอียด</th>" +
              "<th scope=\"col\" >ดูข้อมูล</th>" +
              "<th scope=\"col\" >แก้ไข</th>" +
              "<th scope=\"col\" >ลบ</th>" +
              "</tr></thead><tbody>");
    %>
    // ระบุการเป็นเจ้าหนี้ลูกหนี้ ว่าเป้น Customer หรือ Rooot
    // ระบุลูกหนี้ด้วยว่าเป้น Customer หรือ Root
    <%
      for(int i=0;i<30;i++){
        out.println("<tr>");
        if(rs.next()){
          out.print("<td>" + rs.getString("bank_id") + "</td>\n" +
                    "<td>" + rs.getString("bankname") + "</td>\n"+
                    "<td>" + rs.getString("accountnumber") + "</td>\n"+
                    "<td>" + String.valueOf(rs.getDouble("value")) + "</td>\n"+
                    "<td>" + rs.getString("Detail") + "</td>\n");
          out.print("<td><a href=\"index.jsp?pages=databank&bank_id="+rs.getString("bank_id")+"\" >ดูข้อมูล</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=editbank&bank_id="+rs.getString("bank_id")+"\" >แก้ไข</a></td>\n");
          out.print("<td><a href=\"index.jsp?pages=accountview&delete=1&bank_id="+rs.getString("bank_id")+"\" >ลบ</a></td>\n");
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
<% } %>