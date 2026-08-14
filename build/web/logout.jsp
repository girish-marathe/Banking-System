<%-- 
    Document   : Logout
    Created on : Dec 3, 2017, 10:48:44 PM
    Author     : PTPL-02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
        <%
            HttpSession httpSession = request.getSession();
            httpSession.invalidate();
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
