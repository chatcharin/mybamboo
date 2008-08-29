
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <link rel="stylesheet" href="standard-footer.css" type="text/css"></link>
        <title>Theme test</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <div id="outerBorder">
            
            <div id="header">
                <div id="banner">Application Name</div>      
                <div id="subheader">
                  <%@ include file="subheader.jsp" %>
                </div> <!-- sub-header -->
            </div> <!-- header -->
            <div id="main">
                <div id="leftSidebar">
                    
                    Sidebar Content Here
                    <%@ include file="sidebar.jsp" %>
                    
                </div> <!-- leftSidebar -->

                <div id="content" style="height:400px">
                    
                    Main Content Area
                    <jsp:include page="content.jsp" />
                    
                </div> <!-- content -->

            </div> <!-- main -->

            <div id="footer">Footer</div>  
            <jsp:include page="footer.jsp" />
        </div> <!-- outerborder -->

    </body>
</html>