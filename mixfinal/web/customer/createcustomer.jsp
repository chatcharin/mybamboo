<!--%@ include file="ck_session_customer.jsp"% -->
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
       <div id="navcontainer" align="center">
             <ul id="navlist">
               <!-- CSS Tabs -->
               <li><a href="index.jsp">หน้าแรก</a></li>
               <li id="active"><a id="current" href="index.jsp?pages=createcustomer">สร้างข้อมูลลูกค้า</a></li>
               <li ><a href="index.jsp?pages=customerview">ข้อมูลลูกค้าทั้งหมด</a></li>
               <li><a href="#">ข้อมูลรายบุคคล</a></li>
               <li><a  href="#">แก้ไขข้อมูล</a></li>
             </ul>
       </div>
      <br>
      <table  width="100%" height="536" border="0" >
      <form action="index.jsp" >
      <tr>
        <td height="26" background="56235623.jpg">
          <div align="center" class="style66">ส่วนเพิมข้อมูลลูกค้า</div></td>
          <td>
            <embed src="http://www.clocklink.com/clocks/5003-green.swf?TimeZone=ICT&amp;Place=&amp;DateFormat=yyyy+/+mm+/+dd+DDD&amp;TimeFormat=hh:mm:ss+TT&amp;"  width="240" height="20" align="right" wmode="transparent" type="application/x-shockwave-flash">
            </embed>
          </td>
      </tr>
      <tr>
        <td height="26"></td>
        <td><input style="display:none" type="text" name="add" value="1" />
        <input style="display:none" type="text" name="pages" value="customerview" /></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ชื่อ</div>
        </td>
        <td>
          <input type="text" name="name" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">นามสกุล</div>
          </td>
        <td>
          <input type="text" name="lastname" />
          </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">อายุ</div>
          </td>
        <td>
          <input name="age" type="text" size="2" />
          <span class="style45">ปี</span>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">เพศ</div>
        </td>
        <td>
          <select name="sex">
            <option selected="selected">ระบุเพศ</option>
            <option>ชาย</option>
            <option>หญิง</option>
            <option>เพศที่สาม</option>
           </select>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ที่อยู่</div>
        </td>
        <td>
          <span class="style30">
            <textarea name="address" rows="4" cols="20">
            </textarea>
          </span>
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style23">
            <span class="style51">เบอร์โทรศัพท์</span>
            </div>
          </td>
        <td>
          <input type="text" name="tel" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">หมายเลขบัตรประจำตัวประชาชน</div>
          </td>
        <td>
          <span class="style30">
          <input name="idcard" type="text" maxlength="13" />
          </span>
        </td>
      </tr>
      <tr>
        <td height="23"><span class="style23"></span></td>
        <td></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ชนิดลูกค้า</div>
        </td>
        <td><select name="type">
            <option selected="selected">โรงสี</option>
            <option>ชาวนา</option>
            <option>คนทั่วไป</option>
        </select></td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">รถ</div>
        </td>
        <td>
          <input type="text" name="car" />
        </td>
      </tr>
      <tr>
        <td height="23">
          <div align="right" class="style45">ทะเบียน</div>
        </td>
        <td>
          <input type="text" name="idcar" />
        </td>
      </tr>
      <tr>
        <td height="23"></td>
        <td></td>
      </tr>
      <tr>
        <td height="23"></td>
        <td><input type="submit" name="Submit" value="  ยืนยัน  " /> <input type="submit" name="Submit22" value="  ยกเลิก  " /></td>
      </tr>
      </form>
    </table>   
 