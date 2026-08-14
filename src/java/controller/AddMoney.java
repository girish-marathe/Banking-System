/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
public class AddMoney extends HttpServlet {

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
            DBConnection db = new DBConnection();
            DBConnection db1 = new DBConnection();
            Double tamount = 0.0;

            String email = request.getParameter("email");
            String fname = request.getParameter("fname");
            String ifsc = request.getParameter("ifsc");
            String account = request.getParameter("accno");
            String type = "credit";
            double amount = Double.parseDouble(request.getParameter("amount"));
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String timeStamp = format.format(date);
            String sql1 = "Select * from tbl_user_account  where account_no='" + account + "' and email='" + email + "' and ifsc='"+ifsc+"'";
            ResultSet rs1 = db1.Select(sql1);
            if (rs1.next()) {
                String sql = "Insert into tbl_transaction(semail,remail,ifsc,accno,amount,date,type)values('" + email + "','" + email + "','" + ifsc + "','" + account + "','" + amount + "','" + timeStamp + "','" + type + "')";
                int result = db.Insert(sql);
                if (result > 0) {

                    String query = "Select * from tbl_user_account where email='" + email + "'";
                    ResultSet rs = db.Select(query);
                    if (rs.next()) {
                        tamount = Double.parseDouble(rs.getString("tamount"));
                    }
                    tamount = tamount + amount;

                    String qry = "Update tbl_user_account set tamount='" + tamount + "' where email='" + email + "'";
                    db.Update(qry);
                    httpSession.setAttribute("uname", uname);           //create session
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Add money successfully!');");
                    out.println("location='addMoney.jsp';");
                    out.println("</script>");
                    return;
                } else {
                    httpSession.setAttribute("uname", uname);           //create session
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Cannot added money!');");
                    out.println("location='addMoney.jsp';");
                    out.println("</script>");
                    return;
                }
            }else {
                    httpSession.setAttribute("uname", uname);           //create session
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Account number and IFSC is not valid!');");
                    out.println("location='addMoney.jsp';");
                    out.println("</script>");
                    return;
                }
        } catch (Exception e) {
            e.printStackTrace();
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
