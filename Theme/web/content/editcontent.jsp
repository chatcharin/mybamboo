
<%@ page import ="java.sql.*,java.util.*"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>
<% 
      String id = request.getParameter("menu_id");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      sql ="select * from menu where menu_id="+id;
      ResultSet rs=null;
      rs=stmt.executeQuery(sql); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<% if(rs.next()){ %>
<div style="width:300px;">
  ID:<% out.print(rs.getString("menu_id")); %> <br>
  <form action="updatemenu.jsp" >
      <input size="20" type="text"  style="display:none" name="menu_id" value="<% out.print(rs.getString("menu_id")); %>" />
     <div align="right">
       Menu Name: <input size="20" type="text" name="menu_name" value="<% out.print(rs.getString("menu_name")); %>"  /><br>
       Menu Type: <select name="menu_type">
                    <option value="content" >Menu for Content</option>
                    <option value="link" >Menu for link</option>
                  </select><br>
     </div>
     <div align="left"> Menu Detail:</div>
     <div align="right">
       <textarea name="detail" cols="23" rows="5"><% rs.getString("menu_detail"); %></textarea><br>
      Link :<input type="text" size="20" name="link" value="<% out.print(rs.getString("menu_link"));%>" /><br>
           <input size="20" type="text"  style="display:none" name="menu_content" value="<% out.print(rs.getString("menu_content")); %>" />
     Status :<input type="checkbox" name="status" value="<% out.print(rs.getString("menu_status")); %>" /><br>
      <input type="submit" value=" Update " />
      <input type="reset" value="Reset"> 
     </div>
</form>
</div>
<% }

 %>