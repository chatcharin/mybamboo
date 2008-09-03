<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="template/header.jsp"></jsp:include>      
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<div style="width:300px;">
  <form action="addcontent.jsp" >
     <div align="right">
      Content Title: <input size="20" type="text" name="content_title"  /><br>
      Content Menu: <select name="menu_id">
                    <%
                    Class.forName(driver);
                    Connection con=DriverManager.getConnection(url,user,pw);
                    Statement stmt=con.createStatement();
                    String sql;ResultSet rs=null;
                   //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
                    sql="select menu_id,menu_name from menu ;";
                    rs=stmt.executeQuery(sql);
                        while(rs.next()){
                          out.print("<option value=\"" + rs.getString("menu_id") +
                                     "\">" + rs.getString("menu_name") + "</option>\n");
                       }
                    rs.close();
                    stmt.close();
                    con.close();
                      %>
                    </select>
     <!-- Menu Content   Selection option        -- >
                  <br>
     <!-- content type -->
     <!-- level        -->
     <!-- position     -->
     </div>
     <div align="left"> Content Intro:</div>
     <div align="right">
       <textarea name="content_intro" cols="23" rows="5"></textarea><br>
     </div>
     <div align="left"> Content Text:</div>
     <div align="right">
        <textarea name="content_text" cols="23" rows="5"></textarea><br> 
     Comment :<input type="checkbox" name="comment_id" value="1" /><br>
      Status :<input type="checkbox" name="status" value="1" /><br>
      <input type="submit" value=" Add " />
      <input type="reset" value="Reset"> 
     </div>
</form>
</div>
<jsp:include page="template/footer.jsp"></jsp:include>