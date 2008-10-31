<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="../config.jsp" %>
<!-- ให้ ใช้ text field เก็บค่า แล้ว ห้ามแก้ไข ไว้ -->
     <form id="saledata" action="index.jsp"  >
      <table width="100%"> 
      <tr>
        <td colspan="2" background="image/56235623.jpg" class="style28"><div align="center"><span class="style39">ส่วนการรับซื้อ</span></div></td>
        <td class="style28"><input style="display:none" type="text" name="pages" value="sale" /></td>
        <td class="style28"><span class="style55">
          <embed src="http://www.clocklink.com/clocks/5003-green.swf?TimeZone=ICT&amp;Place=&amp;DateFormat=yyyy+/+mm+/+dd+DDD&amp;TimeFormat=hh:mm:ss+TT&amp;"  width="240" height="20" align="right" wmode="transparent" type="application/x-shockwave-flash"> </embed>
        </span></td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style1">
          <span class="style22">รหัสลูกค้า : </span>
          <input name="customer_id" type="text" size="15" />
          <input value="ดูข้อมูล" type="submit" size="15" />
        </td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style22">ข้อมูลสมาชิก</td>
      </tr>
      </table>
    </form>
      <%
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      ResultSet rs=null;
      ResultSet rs2=null;
      String id=null; 
      String idcustomer = request.getParameter("customer_id");
      String buy        = request.getParameter("allprice");
      String type       = request.getParameter("typeprice");
      String weight     = request.getParameter("allwieght");
      Vector errors     = new Vector();
      id = request.getParameter("customer_id");
      String allprice =null;
      allprice = request.getParameter("allprice");
      if(id!=null&&allprice!=null)
      {
      sql ="select * from customer where customer_id="+id;
      rs=stmt.executeQuery(sql); 
      if(rs.next()){ 
        //out.print(rs.getString("customer_id")); 
        out.print("<table width=\"100%\" ><tr><td></td><td>ชื่อ</td><td>"
                   +rs.getString("name")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>นามสกุล</td><td >"
                   +rs.getString("lastname")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>หมายเลขบัตรประจำตัวประชาชน</td><td>"
                   +rs.getString("idcard")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>ชนิดลูกค้า</td><td >"
                   +rs.getString("type")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>รถ</td><td>"
                   +rs.getString("car")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>ทะเบียนรถ</td><td>"
                   +rs.getString("idcar")+
                   "</td></tr><td></td></table>");

        }
    sql ="insert into store values(null,"+
            weight+","
            +type+
            ",now());" ;
    stmt.execute(sql);
    sql ="select max(store_id) from store";
    rs = stmt.executeQuery(sql);
    rs.next();
    String newid = rs.getString("max(store_id)").toString();
    rs.close();
    sql ="INSERT INTO `rice`.`account`"+
            " (`account_id`, `buy`, `sale`,"+
            " `date`, `weight`, `customer_id`,"+
            " `employee_id`, `store_id`)" +
            " VALUES (null,"+buy+
            ",0.0,now(),"+weight+
            ","+idcustomer+
            ","+session.getAttribute("employee_id")+
            ","+newid+")";
      }else if(id!=null){
      sql ="select * from customer where customer_id="+id;
      rs=stmt.executeQuery(sql); 
      if(rs.next()){ 
        //out.print(rs.getString("customer_id")); 
        out.print("<table width=\"100%\" ><tr><td></td><td>ชื่อ</td><td>"
                   +rs.getString("name")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>นามสกุล</td><td >"
                   +rs.getString("lastname")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>หมายเลขบัตรประจำตัวประชาชน</td><td>"
                   +rs.getString("idcard")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>ชนิดลูกค้า</td><td >"
                   +rs.getString("type")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>รถ</td><td>"
                   +rs.getString("car")+
                   "</td><td></td></tr>");
        out.print("<tr><td></td><td>ทะเบียนรถ</td><td>"
                   +rs.getString("idcar")+
                   "</td></tr><td></td></table>");
   //  sql="select * from riceprice ";
  //   rs2=stmt.executeQuery(sql);
      %>
     <form id="sale" name="sale" action="index.jsp"  >
      <table width="100%"> 
      <tr>
        <td colspan="4" valign="baseline" class="style55">
        <p class="style74">
        </p>
        <p class="style74"></p>
        <input size="15" type="text"
          style="display:none"
          name="customer_id"
          value="<% out.print(rs.getString("customer_id")); %>" />
        <input size="15" type="text"
          style="display:none"
          name="pages"
          value="sale" />
        </td>
      </tr>
      <tr>
        <td width="122" valign="baseline" class="style22">ชนิดข้าว : </td>
        <td colspan="3" valign="baseline" class="style1">
          <select name="type" onchange="getselecttype(document.sale.type,'sale')">
            <% }
              sql="select * from riceprice ";
              rs2=stmt.executeQuery(sql);
            while(rs2.next()){
              out.println("<option value=\""+rs2.getDouble("price")+"\">"+rs2.getString("nametype")+"</option>");
            }
            %>
          </select>
        </td>
     </tr>
      <tr>
        <td valign="baseline" class="style22">ชนิดกระสอบ : </td>
         <td colspan="3" valign="baseline" class="style1">
        <select name="typepack" onchange="getselectpack(document.sale.typepack,'sale')" >

              <option value="0.7">ป่าน</option>
              <option value="0.5">ฟางเหลือง</option>
              <option value="0.5">ฟางขาว</option>
              <option value="1"> อื่นๆ</option>
          </select>
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
              <input type="text" size="5" onkeydown="addkey(event,'purchase');" />
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
         <input disabled type="text" size="1" value="1" />
         <input disabled type="text" size="1" value="2" />
         <input disabled type="text" size="1" value="3" />
         <input disabled type="text" size="1" value="4" />
         <input disabled type="text" size="1" value="5" />
         <input disabled type="text" size="1" value="6" />
         <input disabled type="text" size="1" value="7" />
         <input disabled type="text" size="1" value="8" />
         <input disabled type="text" size="1" value="9" />
         <input disabled type="text" size="1" value="10" />
         <input disabled type="text" size="1" value="11" />
         <input disabled type="text" size="1" value="12" />
         <input disabled type="text" size="1" value="13" />
         <input disabled type="text" size="1" value="14" />
         <input disabled type="text" size="1" value="15" />
         <input disabled type="text" size="1" value="16" />
         <input disabled type="text" size="1" value="17" />
         <input disabled type="text" size="1" value="18" />
         <input disabled type="text" size="1" value="19" />
         <input disabled type="text" size="1" value="20" />
         </table>
          </td>
            <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          </td>
          <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          </td>
          <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          </td>
          <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          </td>
          <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          </td>
          <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          </td>
          <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          </td>
          <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          </td>
          <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          </td>
          <td>
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
          <input type="text" size="3" />
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
          <div id="allprice">
            <input name="allprice" disabled type="text" size="15" />
          </div>
        </td>
        <td valign="baseline" class="style1">
          <p class="style48">บาท</p>
        </td>
        <td valign="baseline" class="style49"></td>
      </tr>
      <tr>
        <td colspan="4" valign="baseline" class="style75"></td>
        </tr>
      </table>
      <table>
      <tr >
        <td width="60" colspan="4"></td>
        <td><input type   ="button"
                   onclick="caculate('sale');"
                   value  ="      คำนวน      " /></td>
        <td><input type   ="button"
                   onclick="sale_onsave('sale');"
                   value  ="       บันทึก      " /></td>
        <td><input id="print"
                   style="display:none;"
                   type="button"
                   onclick="printSale();"
                   value="     พิมพ์ใบเสร็จ     " />
            <input id="cancel"
                   type="button"
                   onclick="clean('sale');"
                   value="       ยกเลิก     " />
        </td>
        </tr>
    </table>
    </form>
    <%
    rs.close();
    stmt.close();
    con.close();
    }
 %>
