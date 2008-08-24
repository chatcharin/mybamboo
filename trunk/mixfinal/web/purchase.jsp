<%@page pageEncoding="UTF-8"%>
<%@ include file="template/header.jsp"%>
<table width="813" border="2" align="center" bordercolor="#993300">  
  <tr>
      <td width="174" height="636" valign="top" bgcolor="#FFFFFF">
        <%@ include file="template/menu.jsp"%>
      </td>
  <td width="620" valign="top" bgcolor="#FFFFFF">
    <form id="purchase" >
      <table width="544" align="center">
      <tr>
        <td colspan="2" background="image/56235623.jpg" class="style28"><div align="center"><span class="style39">ส่วนการรับซื้อ</span></div></td>
        <td class="style28"></td>
        <td class="style28"><span class="style55">
          <embed src="http://www.clocklink.com/clocks/5003-green.swf?TimeZone=ICT&amp;Place=&amp;DateFormat=yyyy+/+mm+/+dd+DDD&amp;TimeFormat=hh:mm:ss+TT&amp;"  width="240" height="20" align="right" wmode="transparent" type="application/x-shockwave-flash"> </embed>
        </span></td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style1"><span class="style28">
          <span class="style85">ID ลูกค้า : </span></span>
          <input name="idcustomer" type="text" size="15" />
        </td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style22">ข้อมูลสมาชิก</td>
        </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style55">
          วันที่:<p class="style74">
        </p>
        <p class="style74"></p></td>
      </tr>
      <tr>
        <td width="122" valign="baseline" class="style22">ชนิดข้าว : </td>
        <td colspan="3" valign="baseline" class="style22">
          <input name="radiobutton" type="radio" onclick="select_type_rice(0);" value="กข.6" />กข.6
          <input name="radiobutton" type="radio" onclick="select_type_rice(1);" value="กข.15" />กข.15
          <input name="radiobutton" type="radio" onclick="select_type_rice(2);"  value="other" /> อื่น ๆ
          <input name="other" type="text" size="15" />
        </td>
     </tr>
      <tr>
        <td valign="baseline" class="style22">ชนิดกระสอบ : </td>
         <td colspan="3" valign="baseline" class="style1">
          <span class="style45">
            <input name="radiobutton1" type="radio" onclick="select_type_pack(0)" value="radiobutton" />ป่าน
            <input name="radiobutton1" type="radio" onclick="select_type_rice(1)" value="radiobutton" />ฟางเหลือง
            <input name="radiobutton1" type="radio" onclick="select_type_rice(2)" value="radiobutton" />ฟางขาว
            <input name="radiobutton1" type="radio" onclick="select_type_rice(3)" value="radiobutton" />อื่น ๆ 
            <input name="other" type="text" size="10" />
          </span>
         </td>
      </tr>
      <tr>
        <td valign="baseline" class="style22">น้ำหนัก :</td>
        <td colspan="3" valign="baseline" class="style1">
          <span class="style63">
              <input name="weight" type="text" size="5" maxlength="5" />
          </span>
        </td>
      </tr>
      <tr>
        <td valign="baseline" class="style22">จำนวนกระสอบ : </td>
        <td colspan="3" valign="baseline" class="style1">
          <span class="style63">
              <input name="unit" type="text" size="5" maxlength="5" />
          </span>
        </td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style22">น้ำหนัก : </td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style57">
           <span class="style74">
              <textarea name="textarea2" cols="70" rows="10"></textarea>
           </span>
        </td>
      </tr>
      <tr>
        <td valign="baseline" class="style1">
           <p align="right" class="style85">น้ำหนักรวม</p>
        </td>
        <td width="76" valign="baseline" class="style1">
          <div id=""></div>
        </td>
        <td width="86" valign="baseline" class="style1">
          <p class="style48">กก.</p>
        </td>
        <td width="240" valign="baseline" class="style49"></td>
      </tr>
      <tr>
        <td valign="baseline" class="style1">
          <p align="right" class="style85">น้ำหนักหักออก</p>
        </td>
        <td valign="baseline" class="style1">
          <div id=""></div>
        </td>
        <td valign="baseline" class="style1"><p class="style48">กก.</p></td>
        <td valign="baseline" class="style49"></td>
      </tr>
      <tr>
        <td valign="baseline" class="style1">
          <p align="right" class="style85">น้ำหนักสุทธิ</p>
        </td>
        <td valign="baseline" class="style1">
          <div id=""></div>
        </td>
        <td valign="baseline" class="style1">
          <p class="style48">กก.</p></td>
        <td valign="baseline" class="style49"></td>
      </tr>
      <tr>
        <td valign="baseline" class="style1">
          <p align="right" class="style85">ราคา</p>
        </td>
        <td valign="baseline" class="style1">
          <p>
            <span class="style87">
                <input name="textfield32" type="text" size="7" maxlength="7" />
            </span>
            </p>
          </td>
        <td valign="baseline" class="style1">
          <p class="style48">บาท/กก.</p>
        </td>
        <td valign="baseline" class="style49"></td>
      </tr>
      <tr>
        <td valign="baseline" class="style1">
          <p align="right" class="style85">รวมเป็นเงินทั้งสิ้น</p>
        </td>
        <td valign="baseline" class="style1">
          <div id=""></div>
        </td>
        <td valign="baseline" class="style1">
          <p class="style48">บาท</p>
        </td>
        <td valign="baseline" class="style49"></td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style75"></td>
        </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style57">
          <span class="style49">
             <input type="button" onclick="caculate()"  value="      คำนวน      " />
             <input type="button" value="       บันทึก      " />
             <input type="button" onclick="clean('purchase')"     value="        ล้าง        " />
             <input type="button" onclick="clean('purchase');"   value="       ยกเลิก     " />
          </span>
        </td>
        </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style57"></td>
      </tr>
    </table>
  </form>
    </td>
<%@ include file="template/footer.jsp"%> 