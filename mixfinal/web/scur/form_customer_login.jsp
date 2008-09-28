<%@ page pageEncoding="UTF-8" %>
    <form method="post" action="customer_login.jsp"> 
    <tr> 
      <td  background="image/rice.jpg" bgcolor="#C891FF"><center> 
          <font color="#FFFFF">
            <b>USER LOGIN </b> 
        </font>
        </center> 
      </td> 
    </tr> 
    <tr> 
      <td><div align="center">ชื่อเข้าสู่ระบบ</div></td> 
    </tr> 
    <tr> 
      <td><div align="center"> 
          <input name="j_username" type="text" id="j_username" size="20">
        </div></td> 
    </tr> 
    <tr> 
      <td><div align="center">รหัสผ่าน</div></td> 
    </tr> 
    <tr> 
      <td><div align="center"> 
          <input name="j_password" type="password" id="j_password" size="20">
        </div></td> 
    </tr> 
    <tr> 
      <td><div align="center"> 
          <input name="ck" type="hidden" id="ck" value="yes">
          <input name="Submit" type="submit"  value="Login"> 
        </div></td> 
    </tr> 
    </form>  
