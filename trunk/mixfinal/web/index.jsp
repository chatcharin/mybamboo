<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page  pageEncoding="UTF-8"%>
<%  String  pages=null;
            pages= request.getParameter("pages"); %>
<%@ include file="template/header.jsp"%>
<table width="813" border="2" align="center" bordercolor="#993300">  
  <tr>
      <td width="174" height="636" valign="top" bgcolor="#FFFFFF">
        <%@ include file="template/menu.jsp"%>
      </td>
      <td width="620" valign="top" align="left" bgcolor="#FFFFFF">
<%
if(pages==null){
%>
<jsp:include page="detail.jsp"></jsp:include>
<%}else if(pages.equals("purchase")) {%>
<jsp:include page="purchase/purchase.jsp"></jsp:include>
<%} else if(pages.equals("sale")) {%>
<jsp:include page="sale/sale.jsp"></jsp:include>
<%} else if(pages.equals("check")){%>
<jsp:include page="admin/check.jsp"></jsp:include>
<!-- Admin page connection                   -->
<%} else if(pages.equals("addemployee")){%>
<jsp:include page="admin/addemployee.jsp"></jsp:include>
<%} else if(pages.equals("setting")){%>
<jsp:include page="admin/setting.jsp"></jsp:include>
<%} else if(pages.equals("createemployee")){%>
<jsp:include page="admin/createemployee.jsp"></jsp:include>
<%} else if(pages.equals("edittype")){%>
<jsp:include page="admin/edittype.jsp"></jsp:include>
<%} else if(pages.equals("employeeview")){%>
<jsp:include page="admin/employeeview.jsp"></jsp:include>
<%} else if(pages.equals("editemployee")){%>
<jsp:include page="admin/editemployee.jsp"></jsp:include>
<%} else if(pages.equals("dataemployee")){%>
<jsp:include page="admin/dataemployee.jsp"></jsp:include>
<!-- End Admin   -->
<!-- Customer Connection View    -->
<%} else if(pages.equals("customerview")) {%>
<jsp:include page="customer/customerview.jsp"></jsp:include>
<%} else if(pages.equals("createcustomer")) {%>
<jsp:include page="customer/createcustomer.jsp"></jsp:include>
<%} else if(pages.equals("editcustomer")) {%>
<jsp:include page="customer/editcustomer.jsp"></jsp:include>
<%} else if(pages.equals("datacustomer")) {%>
<jsp:include page="customer/datacustomer.jsp"></jsp:include>
<!-- End Customer View          -->
<%} else if(pages.equals("accountview")) {%>
<jsp:include page="account/accountview.jsp"></jsp:include>
<% } %>
</td>
<%@ include file="template/footer.jsp"%> 