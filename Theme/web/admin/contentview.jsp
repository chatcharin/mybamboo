<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
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
          sql="select * from content limit "+pages+","+limit;
          rs=stmt.executeQuery(sql);
          out.print("<table>" +
               "<tr>" +
               "<td>รหัส</td>" +
               "<td>ชื่อเรื่อง</td>" +
               "<td>ลำดับ</td>" +
               "<td>ตำแหน่ง</td>" +
               "<td>ความเห็น</td>" +
               "<td>สถานะ</td>" +
               "<td>แก้ไข</td>" +
               "<td>ลบ</td>" +
               "</tr>");
            for(int i=0;i<30;i++){
              out.println("<tr>");
              if(rs.next()){
                out.print("<td>" + rs.getString("content_id") + "</td>\n" +
                          "<td>" + rs.getString("content_title") + "</td>\n" +
                          "<td>" + rs.getString("level") + "</td>\n" +
                          "<td>" + rs.getString("content_pos") + "</td>\n" +
                          "<td>" + rs.getString("comment_id") + "</td>\n" +
                          "<td>" + rs.getString("status") + "</td>\n");
                out.print("<td><a href=\"editcontent.jsp?content_id="+rs.getString("content_id")+"\" >แก้ไข</a></td>\n");
                out.print("<td><a href=\"deletecontent.jsp?content_id="+rs.getString("content_id")+"\" >ลบ</a></td>\n");
             }
             out.println("</tr>");
            }
          out.println("</table>");
                  //page next 1 2 3 4 ....

%>