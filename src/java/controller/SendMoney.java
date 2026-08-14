/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

//import blockchain.BlockChain;
import connection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PTPL-02
 */
public class SendMoney extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession httpSession = request.getSession(false);
            String uname = httpSession.getAttribute("uname").toString();
            String semail = httpSession.getAttribute("email").toString();

            DBConnection db = new DBConnection();
            ResultSet rs = null, rs1 = null;
            String status = "";
            String remail = httpSession.getAttribute("receiver_email").toString();
            double amount = Double.parseDouble(httpSession.getAttribute("amount").toString());
            double samount = Double.parseDouble(httpSession.getAttribute("samount").toString());
            String pin = httpSession.getAttribute("pin").toString();
            String pin1 = "";
            String s = "Success", s1 = "debit";
            Double ramount = 0.0;
            String sifsc = "", rifsc = "", saccno = "", raccno = "";
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String timeStamp = format.format(date);
            String balance = "", balance1 = "";
            String sql1 = "Select * from tbl_user_account where email='" + semail + "'";
            rs = db.Select(sql1);
            if (rs.next()) {
                samount = Double.parseDouble(rs.getString("tamount"));
                balance = rs.getString("tamount");
                sifsc = rs.getString("ifsc");
                saccno = rs.getString("account_no");
                pin1 = rs.getString("tpin");
                status = rs.getString("status");
            }
            if (status.equals("active")) {
                samount = samount - amount;//deduct amount
                String sql = "Select * from tbl_user_account where email='" + remail + "'";
                rs1 = db.Select(sql);
                if (rs1.next()) {
                    ramount = Double.parseDouble(rs1.getString("tamount"));
                    balance1 = rs1.getString("tamount");
                    rifsc = rs1.getString("ifsc");
                    raccno = rs1.getString("account_no");
                }
                ramount = ramount + amount;//add amount
                if (pin.equals(pin1)) {

                    String query = "update tbl_user_account set tamount='" + samount + "' where email='" + semail + "'";
                    String query1 = "update tbl_user_account set tamount='" + ramount + "' where email='" + remail + "'";
                    int q = db.Update(query);
                    int q1 = db.Update(query1);

                    if (q1 > 0) {
                        String sql2 = "Insert into tbl_transaction(semail,remail,ifsc,accno,amount,date,type)values('" + semail + "','" + remail + "','" + rifsc + "','" + raccno + "','" + amount + "','" + timeStamp + "','" + s1 + "')";
                        int r = db.Insert(sql2);
                        String emaill[] = {semail};
                        String emaill2[] = {remail};
                        MailUtil1 mailUtil1 = new MailUtil1();

                        //send mail  accunt updation
                        String msg = "Dear Customer, your account has been debited by " + amount + ". Account Balance is " + samount + "";
                        mailUtil1.sendMail(emaill, emaill, "Account Statment", msg, "");
                        msg = "Dear Customer, your account has been credided by " + amount + ". Account Balance is " + ramount + "";
                        mailUtil1.sendMail(emaill2, emaill2, "Account Statment", msg, "");

                        httpSession.setAttribute("uname", uname);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Transaction Success!');");
                        out.println("location='userHome.jsp';");
                        out.println("</script>");
                    } else {
                        httpSession.setAttribute("uname", uname);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Transaction Failed!');");
                        out.println("location='userHome.jsp';");
                        out.println("</script>");
                    }

                } else {
                    httpSession.setAttribute("uname", uname);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Your transaction PIN wrong!');");
                    out.println("location='sendMoney.jsp';");
                    out.println("</script>");
                    return;
                }
            } else {
                httpSession.setAttribute("uname", uname);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your Account is Blocked!');");
                out.println("location='sendMoney.jsp';");
                out.println("</script>");
                return;
            }

        } catch (Exception e) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
