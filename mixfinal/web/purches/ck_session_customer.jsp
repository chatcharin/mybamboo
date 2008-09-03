<%@ include file="m_ckSession.jsp"%>
<% //ตรวจสอบว่าเข้าสู่ระบบโดยลูกค้าหรือไม่
if(!isSession(session.getAttribute("j_username"),session.getAttribute("status"),"employee")){
response.sendRedirect("session_er.jsp");
} %>