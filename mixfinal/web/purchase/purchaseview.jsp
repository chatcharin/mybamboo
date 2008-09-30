<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp"%>
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
          sql="select * from account where sale=null limit "+pages+","+limit;
          rs=stmt.executeQuery(sql);
          out.print("<table>" +
               "<tr>" +
               "<td>รหัส</td>" +
               "<td>จำนวนเงิน</td>" +
               "<td>วันที่</td>" +
               "<td>น้ำหนัก</td>" +
               "<td>รหัสผู้ซื้อ</td>" +
               "<td>รหัสผู้ขาย</td>" +
               "<td>รหัสคลังสินค้า</td>" +
               "<td>แก้ไข</td>" +
               "<td>ลบ</td>" +
               "</tr>");
            for(int i=0;i<30;i++){
              out.println("<tr>");
              if(rs.next()){
                out.print("<td>" + rs.getString("account_id") + "</td>\n" +
                          "<td>" + rs.getString("sale") + "</td>\n" +
                          "<td>" + rs.getString("date") + "</td>\n" +
                          "<td>" + rs.getString("weight") + "</td>\n" +
                          "<td>" + rs.getString("customer_id") + "</td>\n" +
                          "<td>" + rs.getString("employee_id") + "</td>\n" +
                          "<td>" + rs.getString("store_id") + "</td>\n");
                out.print("<td><a href=\"editaccount.jsp?account_id="+rs.getString("account_id")+"\" >แก้ไข</a></td>\n");
                out.print("<td><a href=\"deletaccount.jsp?account_id="+rs.getString("account_id")+"\" >ลบ</a></td>\n");
             }
             out.println("</tr>");
            }
          out.println("</table>");
                  //page next 1 2 3 4 ....

%>