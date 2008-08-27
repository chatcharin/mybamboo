
<%@ page import ="java.sql.*,java.util.*"%>
<%@page pageEncoding="UTF-8"%>
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
  ID:<% out.print(rs.getString("content_id")); %> <br>
  <form action="updatecontent.jsp" >
      <input size="20" type="text"  style="display:none" name="content_id" value="<% out.print(rs.getString("content_id")); %>" />
     <div align="right">
       content Name: <input size="20" type="text" name="content_name" value="<% out.print(rs.getString("content_name")); %>"  /><br>
       content Type: <select name="content_type">
                    <option value="content" >content for Content</option>
                    <option value="link" >content for link</option>
                  </select><br>
     </div>
     <div align="left"> content Detail:</div>
     <div align="right">
       <textarea name="detail" cols="23" rows="5"><% rs.getString("content_detail"); %></textarea><br>
      Link :<input type="text" size="20" name="link" value="<% out.print(rs.getString("content_link"));%>" /><br>
           <input size="20" type="text"  style="display:none" name="content_content" value="<% out.print(rs.getString("content_content")); %>" />
     Status :<input type="checkbox" name="status" value="<% out.print(rs.getString("content_status")); %>" /><br>
      <input type="submit" value=" Update " />
      <input type="reset" value="Reset"> 
     </div>
</form>
</div>
<% }

 %>