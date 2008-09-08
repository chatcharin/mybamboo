<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
    String idcustomer = request.getParameter("idcustomer");
    String buy        = request.getParameter("allprice");
    String type       = request.getParameter("typeprice");
    String weight     = request.getParameter("allwieght");
    Vector errors     = new Vector();
    Class.forName(driver);
    Connection con    = DriverManager.getConnection(url, user, pw);
    Statement stmt    = con.createStatement();
    String sql;
/*        String tmp = date.replace('/',':');
    String ndate[] = tmp.split(":");

    String cdate   = ndate[2]+"-"+ndate[1]+"-"+ndate[0]; */
    ResultSet rs=null;
    //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
    sql ="insert into store values(null,"+
            weight+","
            +type+
            ",now());" ;
    stmt.execute(sql);
    sql ="select max(store_id) from store";
    rs = stmt.executeQuery(sql);
    rs.next();
    String newid = rs.getString("max(store_id)").toString();
    rs.close();
    sql ="INSERT INTO `rice`.`account`"+
            " (`account_id`, `buy`, `sale`,"+
            " `date`, `weight`, `customer_id`,"+
            " `employee_id`, `store_id`)" +
            " VALUES (null,"+buy+
            ",0.0,now(),"+weight+
            ","+idcustomer+
            ","+session.getAttribute("employee_id")+
            ","+newid+")";
    stmt.execute(sql);
    stmt.close();
    con.close();
%>
<jsp:forward page="purchaseview.jsp"></jsp:forward>