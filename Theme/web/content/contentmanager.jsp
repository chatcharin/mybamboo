<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<div style="width:300px;">
  <form action="addcontent.jsp" >
     <div align="right">
      Content Name: <input size="20" type="text" name="menu_name"  /><br>
      Content Type: <select name="menu_type">
                    <option value="content" >Menu for Content</option>
                    <option value="link">Menu for link</option>
                  </select><br>
     </div>
     <div align="left"> Content Detail:</div>
     <div align="right">
       <textarea name="detail" cols="23" rows="5"></textarea><br>
      Link :<input type="text" size="20" name="link" /><br>
      Status :<input type="checkbox" name="status" value="1" /><br>
      <input type="submit" value=" Add " />
      <input type="reset" value="Reset"> 
     </div>
</form>
</div>