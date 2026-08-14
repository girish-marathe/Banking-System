<%-- 
    Document   : decodeQR
    Created on : Jan 2, 2018, 2:16:44 AM
    Author     : PTPL-02
--%>

<%@page import="java.io.IOException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Decode QR code</title>
    </head>
    <body>
        <%
                HttpSession httpSession = request.getSession(false);
                try {
                    if (httpSession.getAttribute("uname") == null) {
                        response.sendRedirect("login.jsp?message='expired'");
                    }
                } catch (Exception e) {
                    response.sendRedirect("login.jsp?message='expired'");
                }
                String uname = httpSession.getAttribute("uname").toString();
                httpSession.setAttribute("uname", uname);
                
            
        %>
    </body>
</html>
