<%-- 
    Document   : Logout
    Created on : 04-Sep-2019, 22:56:14
    Author     : KHALID
--%>

<%
    session.setAttribute("username", null);
    session.invalidate();
    response.sendRedirect("index.jsp");

%>