<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html>
    <head>
        <link rel="stylesheet" href="jmaki-centered.css" type="text/css"></link>
        <title>Admin manager</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <div id="outerBorder">
            
            <div id="header">
                <div id="banner">Management System</div>
                
                <div id="subheader">
                    
                    <div>
                        <a href="mailto:feedback@youraddress">[ Menu ]</a> |
                        <a href="#">[ Content ]</a> |
                        <a href="#">[ Home ]</a>
                    </div>
                    
                </div> <!-- sub-header -->
            </div> <!-- header -->

            <div id="main">
                
                <div id="content" style="height:400px">
                    
                    Main Content Pane
                    <%@ include file="contentview.jsp" %>
                    <%@ include file="menuview.jsp" %>
                </div> <!-- content -->

            </div> <!-- main -->

        </div> <!-- outerborder -->
    </body>
</html>