<%@ page pageEncoding="UTF-8" %>
<%
if((session.getAttribute("j_username")!=null)&&(session.getAttribute("status").equals("customer"))){
%>
<%@ include file="form_customer_logout.jsp" %>
<%}else{%>
<%@ include file="form_customer_login.jsp" %>
<%}%> 