
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>Theme test</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css" media="all">@import "css/aggregator.css";</style>
<style type="text/css" media="all">@import "css/geshifilter.css";</style>
<style type="text/css" media="all">@import "css/node.css";</style>
<style type="text/css" media="all">@import "css/poll.css";</style>
<style type="text/css" media="all">@import "css/defaults.css";</style>
<style type="text/css" media="all">@import "css/system.css";</style>
<style type="text/css" media="all">@import "css/tagadelic.css";</style>
<style type="text/css" media="all">@import "css/openid.css";</style>
<style type="text/css" media="all">@import "css/style2.css";</style>
    </head>
    <body>
<div id="page_wrapper">
  <div id="header_wrapper">
    <div id="header">
        <h1>
          <a href="/" title="">
            <img src="/themes/blognone3/logo.png" alt="" id="logo" />
            <span>OFBizguru </span></a></h1>    
    </div> <!--header-->
    <div id="navcontainer">
        <%@ include file="sidebar.jsp" %>
    </div> <!-- sub-header -->
  </div> <!-- header -->
  <div id="content_wrapper">
       <div id="content">
           <jsp:include page="content.jsp" />
         
       </div> <!-- leftSidebar --> 
       <div id="right_wrapper">
       
         <div id="right_side">  
         Hello World!!
         </div>
       </div>
  </div> <!-- content -->
  <div id="footer">
           <jsp:include page="footer.jsp" />
  </div> <!-- outerborder -->
  </div> <!-- main -->
  </body>
</html>