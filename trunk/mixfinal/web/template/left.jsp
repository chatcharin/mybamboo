<%@ page pageEncoding="windows-874" %>
<%
if((session.getAttribute("j_username")!=null)&&(session.getAttribute("status").equals("customer"))){
%>
<%@ include file="../scur/form_customer_logout.jsp" %>
<%}else{%>
<%@ include file="../scur/form_customer_login.jsp" %>
<%}%> 