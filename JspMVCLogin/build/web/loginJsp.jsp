<%-- 
    Document   : loginJsp
    Created on : 04-Sep-2019, 21:55:09
    Author     : KHALID
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login stuff</title>
    </head>
    <body>
        <jsp:useBean id="login" scope="request" class="usebean.LogBean">
            <jsp:setProperty name="login" property="usrnm" value='<%= 
                request.getParameter("usrnm")%>'/>
                <jsp:setProperty name="login" property="pwd" value='<%=
                    request.getParameter("pwd")%>'/>    
        </jsp:useBean>
        <jsp:forward page="adminCheck">
            <jsp:param name="usrnm" value="<%= login.getUsrnm()%>"/>
            <jsp:param name="pwd" value="<%= login.getPwd()%>"/>
        </jsp:forward>
    </body>
</html>
