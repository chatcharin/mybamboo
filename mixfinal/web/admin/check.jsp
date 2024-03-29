<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="de.laures.cewolf.*"%>
<%@page import="de.laures.cewolf.tooltips.*"%>
<%@page import="de.laures.cewolf.links.*"%>
<%@page import="org.jfree.data.*"%>
<%@page import="org.jfree.data.time.*"%>
<%@page import="org.jfree.data.gantt.*"%>
<%@page import="org.jfree.chart.*"%>
<%@page import="org.jfree.chart.plot.*"%>
<%@page import="org.jfree.data.category.*"%>
<%@page import="org.jfree.data.general.*"%>
<%@page import="org.jfree.data.xy.*"%>
<%@page import="java.awt.*" %>
<%@page import="de.laures.cewolf.taglib.CewolfChartFactory" %>
<%@page import="org.jfree.chart.event.ChartProgressListener" %>
<%@page import="org.jfree.chart.event.ChartProgressEvent" %> 
<%@page pageEncoding="UTF-8"%>
<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>
<%@ include file="config.jsp" %>
<%
      //รับข้อมูล ช่วงเวลา เข้า มาเพื่อ กำหนด ระยะ เวลา ของรายงาน
      /* start  yyy,mmm,ddd
      *  end    yyy,mmm,ddd
      *  SQL    selection data  date time
      *  Date , Mount , Year
      * select date(account_date),sum(buy)
      * from account
      * where date(account_date)>=start && date(account_date)<= end
      * group by date(account_date)
      */
      String start = request.getParameter("start");
      String end   = request.getParameter("end");
      Class.forName(driver);
      Connection con = DriverManager.getConnection(url, user, pw);
      Statement stmt = con.createStatement();
      String sql;
      /* Get Count Row in Result  */
       ResultSet r = stmt.executeQuery("SELECT COUNT(*) AS rowcount " +
                                       "FROM account " +
                                       "where date(account_date)>=" +start+
                                       "&& date(account_date)<= "+end);
       r.next();
       int count = r.getInt("rowcount") ;
       r.close() ; 
       sql ="select * from employee where employee_id=1001";
       ResultSet rs=null;
       rs=stmt.executeQuery(sql);

  
   //  add value to DataSet  in Loop  while  get Data frome result
   class DatasetMonth implements DatasetProducer{
       String[] categories ;
       String[] seriesNames ;
       Integer[][] startValues = new Integer[seriesNames.length][categories.length];
       Integer[][] endValues = new Integer[seriesNames.length][categories.length];
    int[] PURCHASE_ORDER;
    /* insert Value to DataSet */
    public DatasetMonth(int count){
         PURCHASE_ORDER = new int[count];
         categories = new String[count];
         seriesNames = new String[count];
    }
    public void setData(String name,int data,int i){
                PURCHASE_ORDER[i]=data;
                categories[i]  =name;
                seriesNames[i] =name;
    }
    /* insert name of value */
    public Object produceDataset(Map params) {
       Integer[][] startValues = new Integer[seriesNames.length][categories.length];
       Integer[][] endValues = new Integer[seriesNames.length][categories.length];
      for (int series = 0; series < seriesNames.length; series++) {
        for (int i = 0; i < categories.length; i++) {
          startValues[i][i] = 0;
          endValues[i][i] = PURCHASE_ORDER[i];
        }
      }
      DefaultIntervalCategoryDataset ds =
        new DefaultIntervalCategoryDataset(seriesNames, categories, startValues, endValues);
      return ds;
    }
    public String getProducerId() {
      return "CategoryDataProducer";
    }
    public boolean hasExpired(Map params, Date since) {
      return false;
    }
  }

   // Insert to Dataset
   DatasetMonth data = new DatasetMonth(count);
   int i = 0;
    while(rs.next()){
       data.setData(rs.getString("date"),Integer.parseInt(rs.getString("values")),i);
       i++;
   }
    DatasetProducer categoryData = new DatasetProducer() {
    public Object produceDataset(Map params) {
      final String[] categories = { "apples", "pies", "bananas", "oranges" };
      final String[] seriesNames = { "8.00", "Helga", "Franz", "16.00" };
      final Integer[][] startValues = new Integer[seriesNames.length][categories.length];
      final Integer[][] endValues = new Integer[seriesNames.length][categories.length];
      for (int series = 0; series < seriesNames.length; series++) {
        for (int i = 0; i < categories.length; i++) {
          int y = (int) (Math.random() * 10 + 1);
          startValues[series][i] = new Integer(y);
          endValues[series][i] = new Integer(y + (int) (Math.random() * 10));
        }
      }
      DefaultIntervalCategoryDataset ds =
        new DefaultIntervalCategoryDataset(seriesNames, categories, startValues, endValues);
      return ds;
    }
    public String getProducerId() {
      return "CategoryDataProducer";
    }
    public boolean hasExpired(Map params, Date since) {
      return false;
    }
  };
  pageContext.setAttribute("categoryData", data);
     
 %>
    <table width="100%">
      <tr>
        <td width="201" background="56235623.jpg">
          <div align="center">
            <span class="style66">ส่วนจัดการตรวจสอบสต๊อกสินค้า</span>
          </div>
        </td>
        <td width="365">
          <embed src="http://www.clocklink.com/clocks/5003-green.swf?TimeZone=ICT&amp;Place=&amp;DateFormat=yyyy+/+mm+/+dd+DDD&amp;TimeFormat=hh:mm:ss+TT&amp;"  width="240" height="20" align="right" wmode="transparent" type="application/x-shockwave-flash"></embed>
        </td>
      </tr>
    </table>
    <table>
      <tr>
        <td colspan="2"></td>
        </tr>
      <tr>
        <td colspan="2" valign="baseline" class="style43">
          <div align="center">
            <strong>ช่วงเวลา</strong>
          </div>
        </td>
      </tr>
      <tr>
        <td colspan="2" valign="baseline" class="style43">
            <div align="center">
                เริ่มต้น:<input type="text" name="start" value="" />
                สิ้นสุด:<input type="text"  name="end" value="" />
            </div>
        </td>
      </tr>
      <tr>
        <td valign="baseline" class="style43">
          <div align="center">
            <strong>ซื้อเข้า</strong>
          </div>
        </td>   
      </tr>
             <tr>
        <td>
          <cewolf:chart id="verticalBar3D"
          title="รายงานการซื้อเข้า"
          type="verticalBar3D"
          xaxislabel="ชั่วโมงที่"
          yaxislabel="จำนวนน้ำหนัก">
             <cewolf:data>
                   <cewolf:producer id="categoryData" />
             </cewolf:data>
          </cewolf:chart>
           <cewolf:img chartid="verticalBar3D"
           renderer="/cewolf"
           width="600"
           height="300"/>
         </td>
      </tr>
      <tr>
        <td valign="baseline" class="style43">
          <div align="center">
            <strong>ขายออก</strong>
            </div>
          </td>
      </tr>
       <tr>
        <td>
          <cewolf:chart id="verticalBar3D"
          title="รายงานการขายออก"
          type="verticalBar3D"
          xaxislabel="ชั่วโมงที่"
          yaxislabel="จำนวนน้ำหนัก">
             <cewolf:data>
                   <cewolf:producer id="categoryData" />
             </cewolf:data>
          </cewolf:chart>
           <cewolf:img chartid="verticalBar3D"
           renderer="/cewolf"
           width="600"
           height="300"/>
         </td>
      </tr>
            <tr>
        <td colspan="2" valign="baseline" class="style43">
          <div align="center">
            <strong>ข้อมูลของเดือนนี้</strong>
          </div>
        </td>
      </tr>
      <tr>
        <td valign="baseline" class="style43">
          <div align="center">
            <strong>ซื้อเข้า</strong>
          </div>
        </td>
      </tr>
       <tr>
        <td>
          <cewolf:chart id="verticalBar3D"
          title="รายงานการซื้อเข้า"
          type="verticalBar3D"
          xaxislabel="วันที่"
          yaxislabel="จำนวนน้ำหนัก">
             <cewolf:data>
                   <cewolf:producer id="categoryData" />
             </cewolf:data>
          </cewolf:chart>
           <cewolf:img chartid="verticalBar3D"
           renderer="/cewolf"
           width   ="600"
           height  ="300"/>
         </td>
      </tr>
      <tr>
        <td valign="baseline" class="style43">
          <div align="center">
            <strong>ขายออก</strong>
          </div>
         </td>
      </tr>
       <tr>
        <td>
          <cewolf:chart id="verticalBar3D"
          title="รายงานการขายออก"
          type="verticalBar3D"
          xaxislabel="วันที่"
          yaxislabel="จำนวนน้ำหนัก">
             <cewolf:data>
                   <cewolf:producer id="categoryData" />
             </cewolf:data>
          </cewolf:chart>
           <cewolf:img chartid="verticalBar3D"
           renderer="/cewolf"
           width="600"
           height="300"/>
         </td>
      </tr>
    </table>