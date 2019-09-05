<%-- 
    Document   : index
    Created on : 04-Sep-2019, 21:12:51
    Author     : KHALID
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            div#adminlogin{
                width: 30%;
                height: 50%;
                background-color:#AFC7C7;
                border-width: thin;
                border-style: solid;
                border-color: #000000;
                margin: 0 auto;
                text-align: left;
                overflow: hidden;
                padding: 5px;
                padding-left: 20px;
            }
            .inputtext{
                width: 250px;
                height: 30px;
                font-family:Arial;
                font-size: 18px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>

    <body>
        <div id="adminlogin">
            <p>Administrator Login</p>
            <hr/>
            <form method="POST" action="loginJsp.jsp">
                <label>Username<br/>
                    <input type="text" class="inputtext" name="usrnm"
                           value="" placeholder="Your  Name"></label><br/>
                <br/>
                <label>Password<br/>
                    <input type="password" class="inputtext" name="pwd" placeholder="******"/>
                </label><br/>
                <br/>
                <input type="submit" value="Login"/>
                <% if(request.getAttribute("err")!=null){%>
                <%= request.getAttribute("err") %>
                <% }%>
            </form>
        </div>
    </body>
</html>
