<%-- 
    Document   : deleteManager1
    Created on : 22 Feb, 2018, 4:42:17 PM
    Author     : shri
--%>

<%@page import="connection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Manager</title>
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
                String email = request.getParameter("email");
                DBConnection db = new DBConnection();
                String sql = "Select * from tbl_manager where email='" + email + "'";
                ResultSet rs = db.Select(sql);
                if (rs.next()) {
                    String query = "Delete from tbl_manager  where email='" + email + "'";
                    db.Update(query);
                    session.setAttribute("uname", uname);           //create session
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('User is Deleted!');");
                    out.println("location='employeeDetail.jsp';");
                    out.println("</script>");
                    return;
                } else {
                    session.setAttribute("uname", uname);           //create session
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('User not Found!');");
                    out.println("location='employeeDetail.jsp';");
                    out.println("</script>");
                    return;
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
