<%@ page pageEncoding="UTF-8" %>
<form name="logout" action="index.jsp" method="post">
     <tr> 
         <td  background="template/image/rice.jpg" bgcolor="#C891FF">
           <div align="center" class="style54">
            LOGOUT
           </div>
         </td>
    </tr>
    <tr>
      <td><div align="center">ยินดีต้อนรับ</div></td>
    </tr>
    <tr>
      <td><div align="center">คุณ <%=session.getAttribute("j_fname")%> <%=session.getAttribute("j_lname")%></div></td>
    </tr>
    <tr>
      <td><div align="center">
          <input  type="button" value="Logout" onclick="logouts()">
      </div></td>
    </tr>
</form>