<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="config.jsp" %>
<% 
      String id = request.getParameter("content_id");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="select * from content where content_id="+id;
      ResultSet rs=null;
      rs=stmt.executeQuery(sql); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<% if(rs.next()){ %>
<div style="width:300px;">
  <form action="updatecontent.jsp" >
     <input size="20" type="text"  style="display:none" name="content_id" value="<% out.print(rs.getString("content_id")); %>" />
     <div align="right">
      Content Title: <input size="20" type="text" name="content_title" value="<% out.print(rs.getString("content_title")); %>" /><br>
      Content Menu: <select name="menu_id">
                    <%
                    Class.forName(driver);
                    Connection conm=DriverManager.getConnection(url,user,pw);
                    Statement stmtm=con.createStatement();
                    String sqlm;ResultSet rsm=null;
                   //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
                    sqlm="select menu_id,menu_name from menu ;";
                    rsm=stmtm.executeQuery(sqlm);
                        while(rsm.next()){
                          out.print("<option value=\"" + rsm.getString("menu_id") +
                                     "\">" + rsm.getString("menu_name") + "</option>\n");
                       }
                    rsm.close();
                    stmtm.close();
                    conm.close();
                      %>
                    </select>
     <!-- Menu Content   Selection option        -- >
                  <br>
     <!-- content type -->
      <input size="20" type="text"  style="display:none" name="content_type" value="<% out.print(rs.getString("content_type")); %>" />
     <!-- level        -->
      <input size="20" type="text"  style="display:none" name="level" value="<% out.print(rs.getString("level")); %>" />
     <!-- position     -->
     <input size="20" type="text"  style="display:none" name="content_pos" value="<% out.print(rs.getString("content_pos")); %>" />
     </div> 
     <div align="left"> Content Intro:</div>
     <div align="right">
       <textarea name="content_intro" cols="23" rows="5"><% out.print(rs.getString("content_intro")); %></textarea><br>
     </div>
     <div align="left"> Content Text:</div>
     <div align="right">
        <textarea name="content_text" cols="23" rows="5"><% out.print(rs.getString("content_text")); %></textarea><br> 
     Comment :<input type="checkbox" name="comment_id" value="<% out.print(rs.getString("comment_id")); %>" /><br>
      Status :<input type="checkbox" name="status" value="<% out.print(rs.getString("status")); %>" /><br>
      <input type="submit" value=" Add " />
      <input type="reset" value="Reset"> 
     </div>
</form>
</div>
<%
     }
    rs.close();
    stmt.close();
    con.close();
 %>