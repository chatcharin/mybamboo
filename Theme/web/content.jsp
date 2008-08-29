<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*"%>
<%@ include file="admin/config.jsp"%>
<%
          String pages=null;
                 pages=request.getParameter("page");
          String limit=null;
                 limit=request.getParameter("limit");
          String menu_id=null;
                 menu_id=request.getParameter("menu_id");
          String content_id=null;
                 content_id=request.getParameter("content_id");
          String mode = null;
                 mode = request.getParameter("mode");
          Class.forName(driver);
          Connection con=DriverManager.getConnection(url,user,pw);
          Statement stmt=con.createStatement();
          String sql;ResultSet rs=null;
          if(limit==null)
          {
            pages="0";
            limit="10";             
          }
         //ตรวจสอบ username และ password ว่ามีอยู่จริงหรือไม่
          
          sql="select content_id,content_title,content_intro,athor,dateedit from content where menu_id="+menu_id+" limit "+pages+","+limit;
          if(menu_id==null)
          sql="select content_id,content_title,content_intro,athor,dateedit from content  limit "+pages+","+limit;  
          rs=stmt.executeQuery(sql);
            for(int i=0;i<30;i++){
              if(rs.next()){     %>
<div class="node sticky">
    <h2 class="title">
      <a href="page.jsp?content_id=<% out.print(rs.getString("content_id")); %>">
        <% out.print(rs.getString("content_title"));  %></a>
    </h2>
      <span class="submitted">
         Submitted by <% out.print(rs.getString("athor")); 
        /* out.print("on "+rs.getObject("dateedit").toString()); */ %>
      </span>
    <span class="taxonomy">tags:
         <ul class="links inline">
           <li class="first taxonomy_term_73">
             <a class="taxonomy_term_73" title="Blognone Interview" rel="tag" href="/interview">Interview</a>
           </li>
           <li class="last taxonomy_term_74">
             <a class="taxonomy_term_74" title="Interview Question" rel="tag" href="/topics/question">Question</a>
           </li>
         </ul>
    </span>
    <div class="content">
        <% out.print(rs.getString("content_intro")); %>
    </div>
    <div class="nlinks">»
      <ul class="links inline">
        <!--li class="first blog_usernames_blog"><a class="blog_usernames_blog" title="Read mk's latest blog entries." href="/blog/mk">mk's blog</a></li>
        <li class="comment_comments"><a class="comment_comments" title="Jump to the first comment of this posting." href="/node/8770#comments">1 comment</a></li -->
        <li class="last node_read_more"><a class="node_read_more" title="Read the rest of this posting." href="page.jsp?content_id=<% out.print(rs.getString("content_id")); %>">Read more</a></li>
      </ul>
    </div>
    
  </div><%
   
             }
            }
    %>