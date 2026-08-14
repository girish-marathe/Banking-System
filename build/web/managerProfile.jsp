<%-- 
    Document   : managerProfile
    Created on : Dec 26, 2017, 12:05:16 AM
    Author     : PTPL-02
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Profile</title>
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

            String email = request.getParameter("email_id");

            try {
                DBConnection db = new DBConnection();
                String sql = "Select * from tbl_manager where email='" + email + "'";
                ResultSet rs = db.Select(sql);
                if (rs.next()) {
                    String imgPath = rs.getString("imgPath");
                    String output = "<div class='row'><div class='col-md-3 col-lg-3' align='center'> <img src='" + imgPath + "' alt='User Pic' class='img-circle img-responsive'> </div>";
                    output += "<div class=' col-md-9 col-lg-9 '> <table class='table table-user-information'>";
                    output += "<tbody><tr><td>Name:</td><td>" + rs.getString("fname") + "</td></tr><tr><td>Branch:</td><td>" + rs.getString("branch") + "</td></tr><tr>";
                    output += "<td>Joining date:</td><td>" + rs.getString("jdate") + "</td></tr><tr><td>Date of Birth</td><td>" + rs.getString("bdate") + "</td></tr>";
                    output += "<tr><td>Gender</td><td>" + rs.getString("gender") + "</td></tr><tr><td>Address</td><td>" + rs.getString("address") + "</td>";
                    output += "</tr><tr><td>Email</td><td><a href='#'>" + rs.getString("email") + "</a></td></tr><tr><td>Contact</td><td>" + rs.getString("mobile") + "</td></tr>";
                    output += "</tbody></table></div></div>";
                    out.println(output);
                    httpSession.setAttribute("uname", uname);

                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %> 
    </body>
</html>
