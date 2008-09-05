<%@ taglib prefix="a" uri="http://jmaki/v1.0/jsp" %>
<%@page pageEncoding="UTF-8"%>
<div id="contenner" style="height:400px">
<p>แก้ไขข้อมูลด้วยการดับเบิ้ลคลิ้กและเลือกแล้วกดเพื่อลบข้อมูลตามต้องการ:<a onclick="deleterow()" href="#">  ลบ</a>
<a:widget name="dojo.etable" service="chiang/datachiang.jsp"/> 
 <script>
                            function tableListener(args) {
                              Customerid =    args.value.id_rice;
                            }
                            
                            jmaki.subscribe("/dojo/etable/onSelect", tableListener);
        </script>
</div>