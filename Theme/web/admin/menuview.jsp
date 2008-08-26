<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
          String pages=request.getParameter("page");
          String limit=request.getParameter("limit");
          Class.forName(driver);
          Connection con=DriverManager.getConnection(url,user,pw);
          Statement stmt=con.createStatement();
          String sql;ResultSet rs=null;
         //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
          sql="select * from menu limit "+pages+","+limit;
          rs=stmt.executeQuery(sql);
          out.print("<table>" +
               "<tr>" +
               "<td>รหัส</td>" +
               "<td>ชื่อ</td>" +
               "<td>ชนิด</td>" +
               "<td>รายละเอียด</td>" +
               "<td>ลิ้ง</td>" +
               "<td>เนื้อหา</td>" +
               "<td>สถานะ</td>" +
               "<td>แก้ไข</td>" +
               "<td>ลบ</td>" +
               "</tr>");
            for(int i=0;i<30;i++){
              out.println("<tr>");
              if(rs.next()){
                out.print("<td>" + rs.getString("menu_id") + "</td>\n" +
                        "<td>" + rs.getString("menu_name") + "</td>\n" +
                        "<td>" + rs.getString("menu_type") + "</td>\n" +
                        "<td>" + rs.getString("menu_detail") + "</td>\n" +
                        "<td>" + rs.getString("menu_link") + "</td>\n" +
                        "<td>" + rs.getString("menu_content") + "</td>\n" +
                        "<td>" + rs.getString("menu_status") + "</td>\n");
                out.print("<td><a href=\"editmenu.jsp?customer_id="+rs.getString("customer_id")+"\" >แก้ไข</a></td>\n");
                out.print("<td><a href=\"deletemenu.jsp?customer_id="+rs.getString("customer_id")+"\" >ลบ</a></td>\n");
             }
             out.println("</tr>");
            }
          out.println("</table>");
                  //page next 1 2 3 4 ....
%>