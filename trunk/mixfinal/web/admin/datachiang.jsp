<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
          Class.forName(driver);
          Connection con=DriverManager.getConnection(url,user,pw);
          Statement stmt=con.createStatement();
          String sql;ResultSet rs=null;
         //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
          sql="select * from riceprice";
          rs=stmt.executeQuery(sql);
            out.println("{columns : [" +
                    "{ label : 'รหัส', id : 'id_rice'}," +
                    "{ label :'ชนิดข้าว', id : 'nametype'}," +
                    "{ label : 'รายละเอียด', id : 'description'}," +
                    "{ label : 'ราคา', id : 'price'}," +
                    "],");

            out.println("rows: [");
            for(int i=0;i<3;i++){
              if(rs.next()){
                out.print("{ id_rice: '" + rs.getString("id_rice") + "'," +
                        "nametype: '" + rs.getString("nametype") + "'," +
                        "description: '" + rs.getString("description") + "'," +
                        "price: '" + rs.getString("price") + "'}");
                if (i < 2) {
                    out.println(",");
                } else {
                    out.println();
                }
            }}
            out.println("] }");
%>
