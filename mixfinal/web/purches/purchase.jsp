<%@ include file="ck_session_customer.jsp"%>
<%@ taglib prefix="a" uri="http://jmaki/v1.0/jsp" %>
<%-- 
    Document   : buy
    Created on : Feb 14, 2008, 10:45:45 AM
    Author     : Aek
   // เขียน เว็บเพื่อส่ง ค่าจากฐานข้อมูล ราคาข้าวเป็น javascript  //
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<div >
    <form id="buyrice" name="buyrice" >
        <table>
            <tr>
                <td><label for="name">ส่วนการรับซื้อ </label></td>
                <td></td>
            </tr>
            <tr>         
                <td><label for="name">วันที่: </label></td>
                <td> <a:widget name="dojo.dropdowndatepicker" /></td>
            </tr>
        </table>
        <table>
            <tr>
                <td><label for="loc">รหัสลูกค้า: </label></td>
                <td><input  type="text" onkeyup="showInfomation(value)" name="val_0f"  /></td><td  id="val0"><div id="val_0"></div></td>
            </tr>
        </table>
        <table>
            <tr>
                
                <td><label for="date">ข้อมูลสมาชิก: </label></td>
                <td><div id="data"></div></td>
            </tr>
            <tr>
                <td><label for="date">ชนิดข้าว : </label></td>
                <td  ><label>
                        <input name="radiobut" type="radio" value="101" onclick="selectRiceType(0)" />
                    </label>
                    กข.6 
                    <input name="radiobut" type="radio" value="102" onclick="selectRiceType(1)"/>
                    กข.15
                    <input name="radiobut" type="radio" value="103"  onclick="selectRiceType(2)"/>
                    <label></label>
                    ชนิดอื่น ๆ <label>
                    <input name="textfield42" type="text" onkeyup="setTimeout('complet()',2000);" size="15" /></label>
                <div id="val_1"></div></td>
                    <td  id="val1">
                </td>
            </tr>
           
        </table>
    </form>
    <form id="tablew" name="tablew" action=""  >
            <table> 
            <tr>
                <td><label for="loc">น้ำหนักกระสอบ: </label></td>
                <td><input name="textfield4222"  type="text" size="15" /><div id="val_2"></div></td>
            </tr>
            <tr>
                <td><label for="loc">น้ำหนัก: </label></td>
               <!-- onkeydown="addkey(event)"-->
                <td><input  onkeydown="addkey(event)" type="text" size="15" />
                <input type="button" name="Submit5" value="  เพิ่ม  "  onclick="addRows()" ></td>
            </tr>
  </table>
</form>
 <table> 
            <tr>
                <td><label for="date">List: </label></td>
                <td > <table width="20"><tr><td><div ><table width="100%" border="0">
                                        <tr>
                                            <td><a:widget   name="dojo.etable"
                                                                value="{columns : [
                                                                { label : 'น้ำหนัก', id : 'w'}
                                                                ],
                                                                rows : [
                                                                ] 
                                                            } "publish="/table/results/accounts" subscribe="/table/results/accounts"/></td>
                                            <td><a:widget  name="dojo.etable"
                                                               value="{columns : [
                                                               {label : 'น้ำหนัก', id : 'w0'}
                                                               ],
                                                               rows : [
                                                               ] 
                                                           }" publish="/table/results0/accounts" subscribe="/table/results0/accounts" /></td>
                                            <td><a:widget  name="dojo.etable"
                                                               value="{columns : [
                                                               {label : 'น้ำหนัก', id : 'w1'}
                                                               ],
                                                               rows : [
                                                               ] 
                                                           }"publish="/table/results1/accounts" subscribe="/table/results1/accounts" /></td>
                                            <td><a:widget  name="dojo.etable"
                                                               value="{columns : [
                                                               {label : 'น้ำหนัก', id : 'w2'}
                                                               ],
                                                               rows : [
                                                               ] 
                                                           }"publish="/table/results2/accounts" subscribe="/table/results2/accounts" /></td>
                                            <td><a:widget  name="dojo.etable"
                                                               value="{columns : [
                                                               {label : 'น้ำหนัก', id : 'w3'}
                                                               ],
                                                               rows : [
                                                               ] 
                                                           }"publish="/table/results3/accounts" subscribe="/table/results3/accounts" /></td>
                                            <td><a:widget  name="dojo.etable"
                                                               value="{columns : [
                                                               {label : 'น้ำหนัก', id : 'w4'}
                                                               ],
                                                               rows : [
                                                               ] 
                                                           }"publish="/table/results4/accounts" subscribe="/table/results4/accounts" /></td>
                                            <td><a:widget  name="dojo.etable"
                                                               value="{columns : [
                                                               {label : 'น้ำหนัก', id : 'w5'}
                                                               ],
                                                               rows : [
                                                               ] 
                                                           }"publish="/table/results5/accounts" subscribe="/table/results5/accounts" /></td>
                                            <td><a:widget  name="dojo.etable"
                                                               value="{columns : [
                                                               {label : 'น้ำหนัก', id : 'w6'}
                                                               ],
                                                               rows : [
                                                               ] 
                                                           }"publish="/table/results6/accounts" subscribe="/table/results6/accounts" /></td>
                                            <td><a:widget  name="dojo.etable"
                                                               value="{columns : [
                                                               {label : 'น้ำหนัก', id : 'w7'}
                                                               ],
                                                               rows : [
                                                               ] 
                                                           }"publish="/table/results7/accounts" subscribe="/table/results7/accounts" /></td>
                                            <td><a:widget  name="dojo.etable"
                                                               value="{columns : [
                                                               {label : 'น้ำหนัก', id : 'w8'}
                                                               ],
                                                               rows : [
                                                               ] 
                                                           }"publish="/table/results8/accounts" subscribe="/table/results8/accounts" /></td>
                                        </tr>
                                    </table>
                    </div></td></tr></table>
                    
                </td>
            </tr>
        </table>

    <form id="caculateform" name="caculateform" >
        <table>
            <tr>
                
                <td><label for="date">จำนวนกระสอบ: </label></td>
                <td><input name="textfield3" type="text" size="5" maxlength="5" value="0" /></td>
            </tr>
            <tr>
                <td><label for="date">น้ำหนักรวม: </label></td>
                <td><input  type="text" name="time" id="time"> &nbsp;กก.</td>
            </tr>
            <tr>
                
                <td><label for="desc">น้ำหนักหักออก: </label></td>
                <td><input type="text" name="desc" id="desc"> &nbsp;กก.</td>
            </tr>
            <tr>
                <td><label for="date">น้ำหนักสุทธิ: </label></td>
                <td><input  type="text" name="time" id="time"> &nbsp;กก.</td>
            </tr>
            <tr>
                
                <td><label for="desc">ราคา: </label></td>
                <td><input type="text" name="desc" id="desc">&nbsp;บาท/กก.</td>
            </tr>
            <tr>
                <td><label for="desc">รวมเป็นเงินทั้งสิ้น: </label></td>
                <td><input type="text" name="desc" id="desc">&nbsp;บาท</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                <input type="button" name="Submit"  value="  คำนวน  " onclick="caculate()" />
                <input type="button" name="Submit3" value="  บันทึก   " onclick="sentBuy()" />
                <input type="button" name="Submit2" value="  ล้าง    " onclick="creanBuy('form1')" />
            </tr>
            <tr>
                <td ><input  style="visibility: hidden;" type="text" name="desc" id="desc"></td>
            </tr>
        </table>
        
    </form>
    <script   type="text/javascript">
        var newvalue;
        var oldvalue;
        var idx;

        function tableListener(args) {
          idx       =    args.value.id;
          oldvalue  =      Number(aun[idx]);
        }
        
        jmaki.subscribe("/table/results/accounts/onSelect", tableListener);
        jmaki.subscribe("/table/results0/accounts/onSelect", tableListener);
        jmaki.subscribe("/table/results1/accounts/onSelect", tableListener);
        jmaki.subscribe("/table/results2/accounts/onSelect", tableListener);
        jmaki.subscribe("/table/results3/accounts/onSelect", tableListener); 
        jmaki.subscribe("/table/results4/accounts/onSelect", tableListener);
        jmaki.subscribe("/table/results5/accounts/onSelect", tableListener);
        jmaki.subscribe("/table/results6/accounts/onSelect", tableListener);
        jmaki.subscribe("/table/results7/accounts/onSelect", tableListener); 
        jmaki.subscribe("/table/results8/accounts/onSelect", tableListener);
           
        function updateacc(args){   
            newvalue = args.value;
            alert(newvalue-oldvalue);
            var form = $('caculateform');  
            var caculate = form.getInputs('text');
            var tmp =  Number(caculate[1].value);
            tmp+=(newvalue-oldvalue);
            caculate[1].value = tmp;
            aun[idx] = newvalue;
        }
       jmaki.subscribe("/table/results0/accounts/onCellEdit", updateacc);
       jmaki.subscribe("/table/results/accounts/onCellEdit", updateacc);
       jmaki.subscribe("/table/results1/accounts/onCellEdit", updateacc);
       jmaki.subscribe("/table/results2/accounts/onCellEdit", updateacc);
       jmaki.subscribe("/table/results3/accounts/onCellEdit", updateacc);
       jmaki.subscribe("/table/results4/accounts/onCellEdit", updateacc);
       jmaki.subscribe("/table/results5/accounts/onCellEdit", updateacc);
       jmaki.subscribe("/table/results6/accounts/onCellEdit", updateacc);
       jmaki.subscribe("/table/results7/accounts/onCellEdit", updateacc);
       jmaki.subscribe("/table/results8/accounts/onCellEdit", updateacc);
        
    </script>
</div>
