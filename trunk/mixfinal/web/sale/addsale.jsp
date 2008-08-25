<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%
            String user = "root";
            String pw   = "admin";
            String driver = "org.gjt.mm.mysql.Driver";
            String url = "jdbc:mysql://localhost/rice?characterEncoding=UTF-8";
            String id = request.getParameter("id");
            Vector errors = new Vector();
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, pw);
            Statement stmt = con.createStatement();
            String sql;
            //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
            sql ="INSERT INTO `rice`.`account` (`account_id`, `buy`, `sale`, `date`, `weight`, `customer_id`, `employee_id`, `store_id`)" +
                    " VALUES (null,"+session.getAttribute("employee_id");
            
            sql ="INSERT INTO `rice`.`account` (`account_id`, `buy`, `sale`, `date`, `weight`, `customer_id`, `employee_id`, `store_id`)" +
                    " VALUES (null,"+session.getAttribute("employee_id");
            stmt.execute(sql);
            stmt.close();
            con.close();
%>