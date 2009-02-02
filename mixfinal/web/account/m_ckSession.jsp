package credit_1;

package account_1;

<%@page pageEncoding="UTF-8"%>
<%!
public boolean isSession(Object username,Object status,String select){
try{
if(!(username.equals("")||username==null || (!status.equals(select))))
return true;
else 
return false;
}catch(NullPointerException e){return false;}
}
%>