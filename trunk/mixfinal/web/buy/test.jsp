<%@ taglib prefix="a" uri="http://jmaki/v1.0/jsp" %>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp"%>
<%
            Vector errors = new Vector();
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, pw);
            Statement stmt = con.createStatement();
            String sql;
            //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
            ResultSet rm = null;
            sql ="SELECT  IDENT_CURRENT('riceprice')" ;
            rm.next();
            out.print(rm.getString(0));
            stmt.close();
            con.close();

%><a:widget name="jmaki.charting.area" 
          value="{
                    xAxis : {
                    labels : [{ label : 'January'},
                              { label : 'February'},
                              { label : 'March'},
                              { label : 'April'},
                              { label : 'May'},
                              { label : 'June'},
                              { label : 'July'},
                              { label : 'August'},
                              { label : 'September'},
                              { label : 'October'},
                              { label : 'November'},
                              { label : 'December'}
                              ]
                              },
                    yAxis : {
                    labels : [{ label : '0', value : 0},
                              { label : '10s', value : 10},
                              { label : '20s', value : 20},
                              { label : '30s', value : 30},
                              { label : '40s', value : 40},
                              { label : '50s', value : 50}
                              ]
                              },
                              data : [
                   {label : 'Dataset 1', values : [25, 45, 25, 45, 50, 25, 35, 25, 25, 20, 35, 45] },
                   {label : 'Dataset 2', values : [20, 40, 30, 35, 45, 20, 25, 15, 20, 25, 30, 40] },
                   {label : 'Dataset 3', values : [15, 35, 15, 40, 30, 15, 20, 10, 15, 20, 30, 35] },           
                   {label : 'Dataset 4',  values :  [10, 25, 10,  5, 20,  5, 15,  5, 10, 15, 25, 30] }


                   ]
               }"/>
