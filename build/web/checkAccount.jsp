<%-- 
    Document   : checkAccount
    Created on : Dec 5, 2017, 3:37:03 AM
    Author     : PTPL-02
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Account</title>
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
            try {
                DBConnection db = new DBConnection();
                String sql = "Select * from tbl_user_account where uname='" + uname + "'";
                ResultSet rs = db.Select(sql);
                if (rs.next()) {
                    httpSession.setAttribute("uname", uname);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('You have already created account!');");
                    out.println("location='userHome.jsp';");
                    out.println("</script>");
                    return;
                } else {
                    httpSession.setAttribute("uname", uname);
                    out.println("<script type=\"text/javascript\">");
                    out.println("location='createAccount.jsp';");
                    out.println("</script>");
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
