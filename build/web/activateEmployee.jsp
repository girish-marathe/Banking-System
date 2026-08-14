<%-- 
    Document   : activateEmployee
    Created on : 16 Mar, 2018, 11:16:49 AM
    Author     : shri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

                String sql = "Select * from tbl_manager where email='" + email + "' and desiganation='employee'";
                ResultSet rs = db.Select(sql);
                if (rs.next()) {
                    String status = rs.getString("status");
                    if (status.equals("deactive")) {
                        String query = "Update tbl_manager set status='activate' where email='" + email + "'";
                        db.Update(query);
                        session.setAttribute("uname", uname);           //create session
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('User is activated!');");
                        out.println("location='showEmployee.jsp';");
                        out.println("</script>");
                        return;

                    } else {
                        String query1 = "Update tbl_manager set status='deactive' where email='" + email + "'";
                        db.Update(query1);
                        session.setAttribute("uname", uname);           //create session
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('User is deactivated!');");
                        out.println("location='showEmployee.jsp';");
                        out.println("</script>");
                        return;
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
