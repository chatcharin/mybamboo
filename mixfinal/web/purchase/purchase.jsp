<%@page pageEncoding="UTF-8"%>
<!-- ให้ ใช้ text field เก็บค่า แล้ว ห้ามแก้ไข ไว้ -->
     <form id="purchase" action="index.jsp" accept-charset="xx" >
      <table width="100%"> 
      <tr>
        <td colspan="2" background="image/56235623.jpg" class="style28"><div align="center"><span class="style39">ส่วนการรับซื้อ</span></div></td>
        <td class="style28"></td>
        <td class="style28"><span class="style55">
          <embed src="http://www.clocklink.com/clocks/5003-green.swf?TimeZone=ICT&amp;Place=&amp;DateFormat=yyyy+/+mm+/+dd+DDD&amp;TimeFormat=hh:mm:ss+TT&amp;"  width="240" height="20" align="right" wmode="transparent" type="application/x-shockwave-flash"> </embed>
        </span></td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style1">
          <span class="style22">รหัสลูกค้า : </span>
          <input name="idcustomer" type="text" size="15" />
        </td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style22">ข้อมูลสมาชิก</td>
        </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style55">
        <p class="style74">
        </p>
        <p class="style74"></p></td>
      </tr>
      <tr>
        <td width="122" valign="baseline" class="style22">ชนิดข้าว : </td>
        <td colspan="3" valign="baseline" class="style1">
        </td>
     </tr>
      <tr>
        <td valign="baseline" class="style22">ชนิดกระสอบ : </td>
         <td colspan="3" valign="baseline" class="style1">
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
        <td  valign="baseline" class="style22">น้ำหนัก : </td>
        <td colspan="3" valign="baseline" class="style1">
              <input type="text" size="5" onkeydown="addkey(event);" />
              <input type="button" value="add" onclick="addValue('purchase');" />
        </td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style57">
          <table id="gradient-sale" border="0" width="400">
            <tr>
              <tr>
              <th></th>
              <th>A</th>
              <th>B</th>
              <th>C</th>
              <th>D</th>
              <th>E</th>
              <th>F</th>
              <th>G</th>
              <th>H</th>
              <th>I</th>
              <th>J</th>
            </tr>
            <tr>
            <td>
          <table>
         <input disabled type="text" size="2" value="1" />
         <input disabled type="text" size="2" value="2" />
         <input disabled type="text" size="2" value="3" />
         <input disabled type="text" size="2" value="4" />
         <input disabled type="text" size="2" value="5" />
         <input disabled type="text" size="2" value="6" />
         <input disabled type="text" size="2" value="7" />
         <input disabled type="text" size="2" value="8" />
         <input disabled type="text" size="2" value="9" />
         <input disabled type="text" size="2" value="10" />
         <input disabled type="text" size="2" value="11" />
         <input disabled type="text" size="2" value="12" />
         <input disabled type="text" size="2" value="13" />
         <input disabled type="text" size="2" value="14" />
         <input disabled type="text" size="2" value="15" />
         <input disabled type="text" size="2" value="16" />
         <input disabled type="text" size="2" value="17" />
         <input disabled type="text" size="2" value="18" />
         <input disabled type="text" size="2" value="19" />
         <input disabled type="text" size="2" value="20" />
         </table>
          </td>
            <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <td>
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          <input type="text" size="4" />
          </td>
          <tr>
        </table>
        </td>
      </tr>
      <tr>
        <td valign="baseline" class="style1">
           <p align="right" class="style85">น้ำหนักรวม</p>
        </td>
        <td width="76" valign="baseline" class="style1">
          <div id="allwieght">
            <input name="allwieght" disabled type="text" size="15" /></div>
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
          <div id="cutwieght"><input name="cutwieght" disabled type="text" size="15" /></div>
        </td>
        <td valign="baseline" class="style1"><p class="style48">กก.</p></td>
        <td valign="baseline" class="style49"></td>
      </tr>
      <tr>
        <td valign="baseline" class="style1">
          <p align="right" class="style85">น้ำหนักสุทธิ</p>
        </td>
        <td valign="baseline" class="style1">
          <div id="purewieght"><input name="purewieght" disabled type="text" size="15" /></div>
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
                <input name="price_unit" type="text" size="7" maxlength="7" />
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
          <div id="allprice"> <input name="allprice" disabled type="text" size="15" /></div>
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
             <input type="button" onclick="caculate('purchase');"              value="      คำนวน      " />
             <input type="submit"  value="       บันทึก      " />
             <input type="button" onclick="clean('purchase');"      value="        ล้าง        " />
             <input type="button" onclick="clean('purchase');"      value="       ยกเลิก     " />
             <div id="print" align="center" style="display:none;" >
             <input type="button" onclick="print('purchase');" value="       print     " />
             </div>
          </span>
        </td>
        </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style57"></td>
      </tr>
    </table>
    </form>
