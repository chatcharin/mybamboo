<%@ include file="m_ckSession.jsp"%>
<% //��Ǩ�ͺ����������к����١����������
if(!isSession(session.getAttribute("j_username"),session.getAttribute("status"),"employee")){
response.sendRedirect("session_er.jsp");
} %>