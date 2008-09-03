<%@page contentType="text/html"%>
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
    sql="select * from customer limit "+pages+","+limit;
    rs=stmt.executeQuery(sql);
    out.print("<table>" +
         "<tr>" +
         "<td>รหัส</td>" +
         "<td>ชื่อ</td>" +
         "<td>นามสกุล</td>" +
         "<td>เพศ</td>" +
         "<td>อายุ</td>" +
         "<td>ตำบล</td>" +
         "<td>อำเภอ</td>" +
         "<td>จังหวัด</td>" +
         "<td>เบอร์โทร</td>" +
         "<td>รหัสบัตรประชาชน</td>" +
         "<td>ทะเบียนรถ</td>" +
         "<td>ชนิดลูกค้า</td>" +
         "</tr>");
      for(int i=0;i<30;i++){
        out.println("<tr>");
        if(rs.next()){
          out.print("<td>" + rs.getString("customer_id") + "</td>\n" +
                    "<td>" + rs.getString("name") + "</td>\n" +
                    "<td>" + rs.getString("lastname") + "</td>\n" +
                    "<td>" + rs.getString("sex") + "</td>\n" +
                    "<td>" + rs.getString("age") + "</td>\n" +
                    "<td>" + rs.getString("district") + "</td>\n");
                    "<td>" + rs.getString("district2") + "</td>\n" +
                    "<td>" + rs.getString("province") + "</td>\n" +
                    "<td>" + rs.getString("tel") + "</td>\n" +
                    "<td>" + rs.getString("idcard") + "</td>\n" +
                    "<td>" + rs.getString("car") + "</td>\n" +
                    "<td>" + rs.getString("type") + "</td>\n");
          out.print("<td><a href=\"editcontent.jsp?content_id="+rs.getString("content_id")+"\" >แก้ไข</a></td>\n");
          out.print("<td><a href=\"deletecontent.jsp?content_id="+rs.getString("content_id")+"\" >ลบ</a></td>\n");
       }
       out.println("</tr>");
      }
    out.println("</table>");
            //page next 1 2 3 4 ....

%>