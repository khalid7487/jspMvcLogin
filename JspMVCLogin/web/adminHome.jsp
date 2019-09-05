<%-- 
    Document   : adminHome
    Created on : 04-Sep-2019, 22:43:42
    Author     : KHALID
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache, no-store, "
                    + "must-revalidate");
            response.setDateHeader("Expires", -1);
        %>
        <%
            if(session.getAttribute("username")!=null && 
                    session.getAttribute("username")!=""){
                String user=session.getAttribute("username").toString();
        %>
        <h1>Welcome <b><%= user%></b></h1>
        <%
            }else{
               out.println("please enter correct username and password");
               out.println("<a href='Logout.jsp'><br>Login again</a>");
}
%>
<form method="post" action="Logout.jsp">
    <input type="submit" value="Logout"/>
</form>
    </body>
</html>
