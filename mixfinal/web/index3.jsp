<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page pageEncoding="UTF-8"%>
<%  String  pages=null;
            pages= request.getParameter("pages"); %>
<%@ include file="template/header.jsp"%>
<%
if(pages==null){
%>
<jsp:include page="detail.jsp"></jsp:include>
<%} else {%>
<jsp:include page="purchase/purchase.jsp"></jsp:include>
<% } %>
<%@ include file="template/footer.jsp"%> 