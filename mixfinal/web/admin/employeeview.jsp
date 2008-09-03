<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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
    sql="select * from employee limit "+pages+","+limit;
    rs=stmt.executeQuery(sql);
    out.print("<table>" +
         "<tr>" +
         "<td>รหัส</td>" +
         "<td>ชื่อ</td>" +
         "<td>ชื่อผู้ใช้</td>" +
         "<td>รหัสผ่าน</td>" +
         "<td>เพศ</td>" +
         "<td>สถานะ</td>" +
         "<td>อายุ</td>" +
         "<td>รหัสบัตรประชาชน</td>" +
         "<td>แก้ไข</td>" +
         "<td>ลบ</td>" +
         "</tr>");
      for(int i=0;i<30;i++){
        out.println("<tr>");
        if(rs.next()){
          out.print("<td>" + rs.getString("employee_id") + "</td>\n" +
                    "<td>" + rs.getString("name") + "</td>\n" +
                    "<td>" + rs.getString("lastname") + "</td>\n" +
                    "<td>" + rs.getString("username") + "</td>\n" +
                    "<td>" + rs.getString("passwd") + "</td>\n" +
                    "<td>" + rs.getString("sex") + "</td>\n" +
                    "<td>" + rs.getString("status") + "</td>\n" +
                    "<td>" + rs.getString("age") + "</td>\n" +
                    "<td>" + rs.getString("idcard") + "</td>\n");
          out.print("<td><a href=\"editemployee.jsp?customer_id="+rs.getString("customer_id")+"\" >แก้ไข</a></td>\n");
          out.print("<td><a href=\"deletemployee.jsp?customer_id="+rs.getString("customer_id")+"\" >ลบ</a></td>\n");
       }
       out.println("</tr>");
      }
    out.println("</table>");
            //page next 1 2 3 4 ....

%>