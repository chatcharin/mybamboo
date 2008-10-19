<%@ page pageEncoding="UTF-8" %>
    <form  method="post" action="index.jsp"> 
    <tr> 
      <td  background="template/image/rice.jpg" bgcolor="#C891FF">
        <div align="center" class="style54">
          user login
        </div> 
      </td> 
    </tr> 
    <tr> 
      <td><div align="center">ชื่อเข้าสู่ระบบ</div></td> 
    </tr> 
    <tr> 
      <td><div align="center"> 
          <input name="j_username" type="text" id="j_username" size="15">
        </div></td> 
    </tr> 
    <tr> 
      <td><div align="center">รหัสผ่าน</div></td> 
    </tr> 
    <tr> 
      <td><div align="center"> 
          <input name="j_password" type="password" id="j_password" size="15">
        </div></td> 
    </tr> 
    <tr> 
      <td><div align="center"> 
          <input name="ck" type="hidden" id="ck" value="yes">
          <input name="Submit" type="submit"  value="Login"> 
        </div></td> 
    </tr> 
    </form>  
