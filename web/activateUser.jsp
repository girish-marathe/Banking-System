<%-- 
    Document   : activateUser
    Created on : Dec 6, 2017, 1:55:49 AM
    Author     : PTPL-02
--%>
<%@page import="controller.MailUtil1"%>
<%@page import="controller.MailUtil"%>
<%@page import="controller.FiniteField"%>
<%@page import="java.io.FileNotFoundException"%>

<%@page import="java.util.Random"%>
<%@page import="controller.Details"%>
<%@page import="com.google.zxing.qrcode.decoder.ErrorCorrectionLevel"%>
<%@page import="com.google.zxing.EncodeHintType"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.MultiFormatWriter"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activate/Deactivate user</title>
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

            Details dt = new Details();
      
            String uname = httpSession.getAttribute("uname").toString();
            httpSession.setAttribute("uname", uname);
            try {
                String email = request.getParameter("email");
                DBConnection db = new DBConnection();
                SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Date date = new Date();
                String timeStamp = format.format(date);
                String fname = "";

                ResultSet rs = null, rs1 = null;
                String result = "Select * from tbl_manager where uname='" + uname + "'";
                rs1 = db.Select(result);
                if (rs1.next()) {
                    fname = rs1.getString("fname");
                }
                String sql = "Select * from tbl_user_account where email='" + email + "'";
                rs = db.Select(sql);
                if (rs.next()) {
                    String status = rs.getString("status");
                    String username = rs.getString("uname");
                    String fname1 = rs.getString("fname");
                    String lname = rs.getString("lname");
                    String account = rs.getString("account_no");
                    String tpin = rs.getString("tpin");
                    String ifsc = rs.getString("ifsc");

                    if (status.equals("deactive")) {

                        String mail[] = {email};
                        String msg = "Dear Customer, Your account has been activated  by Bank. Your account details as below:\n Account No :" + account + "\n IFSC : " + ifsc + "\n Transaction Pin: " + tpin;
                        MailUtil1 mm = new MailUtil1();
                        mm.sendMail(mail, mail, "Accout Details", msg,"");

                        String qry = "Insert into tbl_activate(username,manager,date)values('" + username + "','" + fname + "','" + timeStamp + "')";
                        db.Insert(qry);
                        String query = "Update tbl_user_account set status='active' where uname='" + username + "'";
                        db.Update(query);
                        session.setAttribute("uname", uname);           //create session
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('User is activated!');");
                        out.println("location='allUserDetails.jsp';");
                        out.println("</script>");

                    } else {
                        String qry = "Insert into tbl_deactivate(username,manager,date)values('" + username + "','" + fname + "','" + timeStamp + "')";
                        db.Insert(qry);
                        String query1 = "Update tbl_user_account set status='deactive' where uname='" + username + "'";
                        db.Update(query1);
                        session.setAttribute("uname", uname);           //create session
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('User is deactivated!');");
                        out.println("location='allUserDetails.jsp';");
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
