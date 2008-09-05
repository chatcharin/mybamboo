<%@ include file="ck_session_customer.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<form id="signup" name="form1" method="post" action="">
    <table>
        <tr>
            
            <td><label for="name">เพิ่มรายการลูกค้า </label></td>
            <td></td>
        </tr>
        <tr>
            <td align="right"><label  for="date">ชื่อ: </label></td>
            <td><input name="name" type="text" size="15" /></td>
        </tr>
        <tr>
            <td align="right"><label for="date">นามสกุล : </label></td>
            <td><input name="lastname" type="text" size="15" /></td>
        </tr>
        <tr>
            <td align="right"><label for="date">อายุ : </label></td>
            <td><input name="age" type="text" size="15" /></td>
        </tr>
        <tr>
            <td align="right" ><label for="loc">เพศ: </label></td>
            <td>
                <a:widget name="dojo.combobox"
   value="[
       {label : 'ชาย', value : 'AL'},
       {label : 'หญิง', value : 'CA'}
    ]" />
            </td>
        </tr>
        <tr>
            <td align="right"><label for="date">เบอร์โทรศัพท์: </label></td>
            <td><input name="tel" type="text" size="15" maxlength="5"  /></td>
        </tr>
        <tr>
            <td align="right"><label for="date">หมายเลขบัตรประจำตัวประชาชน: </label></td>
            <td><input  type="text" size="15" name="idcard" id="time"></td>
        </tr>
         <tr>
            <td align="right"><label for="date">หมายเลขทะเบียนรถ: </label></td>
            <td><input  type="text" size="15" name="car" id="time"></td>
        </tr>
         <tr>
            <td align="right"><label for="date">ตำบล: </label></td>
            <td><input  type="text" size="15" name="car" id="time"></td>
        </tr>
         <tr>
            <td align="right"><label for="date">อำเภอ: </label></td>
            <td><input  type="text" size="15" name="car" id="time"></td>
        </tr>
         <tr>
            <td align="right"><label for="date">จังหวัด: </label></td>
            <td><input  type="text" size="15" name="car" id="time"></td>
        </tr>
    </table>
</form>
<table>
    <tr>
        <td width="150" ></td>
            <td colspan="2" align="center">
                <input type="button" name="Submit2" value="  เพิ่ม   "  onclick="sentSignup('signup')"/>
            <input type="button" name="Submit4" value="  ยกเลิก "  onclick="crean('signup')"/></td>
        </tr>
</table>
