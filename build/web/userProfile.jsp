<%-- 
    Document   : userProfile
    Created on : Dec 5, 2017, 4:11:31 AM
    Author     : PTPL-02
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>


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
        String sql = "Select * from tbl_user_account where email='" + email + "'";
        ResultSet rs = db.Select(sql);
        if (rs.next()) {
            String imgPath = rs.getString("imgpath");
            String fname = rs.getString("fname");
            String lname = rs.getString("lname");
            String address = rs.getString("address");
            String gender = rs.getString("gender");
            String mobile = rs.getString("mobile");
            String adhar = rs.getString("adhar_id");
            String pan = rs.getString("pan_id");
            String status = rs.getString("status");
            String account = rs.getString("account_no");
            String dob = rs.getString("dob");
            String branch_name = rs.getString("branch_name");
            String ifsc = rs.getString("ifsc");

            String output = "<div class='row'><div class='col-md-3 col-lg-3' align='center'> <img src='" + imgPath + "' alt='User Pic' class='img-circle img-responsive'> </div>";
            output += "<div class=' col-md-9 col-lg-9 '> <table class='table table-user-information'>";
            output += "<tbody><tr><td>Name:</td><td>" + fname + "</td></tr><tr><td>Last Name</td><td>" + lname + "</td></tr>";
            output += "<tr><td>Branch Name</td><td>" + branch_name+ "</td></tr><tr><td>Date of Birth</td><td>" + dob + "</td></tr>";
            output += "<tr><td>IFSC code</td><td>" + ifsc + "</td></tr><tr><td>Account No.</td><td>" + account + "</td></tr>";
            output += "<tr><td>Gender</td><td>" + gender + "</td></tr><tr><td>Address</td><td>" + address + "</td></tr>";
            output += "<tr><td>Contact</td><td>" + mobile + "</td></tr>";
            output += "<tr><td>Adhar No.</td><td>" + adhar + "</td></tr><tr><td>PAN No.</td><td>" + pan + "</td></tr>";
            output += "<tr><td>Status</td><td>" + status + "</td></tr>";
            output += "</tbody></table></div></div>";
            out.println(output);

        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
