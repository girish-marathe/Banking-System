/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PTPL-02
 */
public class AddAccount extends HttpServlet {

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
            DBConnection db = new DBConnection();
            HttpSession httpSession = request.getSession(false);

            String uname = httpSession.getAttribute("uname").toString();
            String semail = httpSession.getAttribute("email").toString();
            String fname = httpSession.getAttribute("fname").toString();
            String ifsc = httpSession.getAttribute("ifsc").toString();
            String account = httpSession.getAttribute("account").toString();
            String remail = httpSession.getAttribute("remail").toString();
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String timeStamp = format.format(date);

            String sql = "Select * from tbl_addaccount where semail='" + semail + "'and remail='" + remail + "'and acc_no='" + account + "'";
            ResultSet rs = db.Select(sql);
            if (rs.next()) {
                httpSession.setAttribute("uname", uname);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Already account existed!');");
                out.println("location='userHome.jsp';");
                out.println("</script>");
                return;
            } else {
                String query = "Insert into tbl_addaccount(semail,remail,ifsc,acc_no,date)values('" + semail.trim() + "','" + remail.trim() + "','" + ifsc.trim() + "','" + account.trim() + "','"+timeStamp+"')";
                int result = db.Insert(query);
                if (result > 0) {
                    httpSession.setAttribute("uname", uname);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Account is added!');");
                    out.println("location='userHome.jsp';");
                    out.println("</script>");
                    return;
                } else {
                    httpSession.setAttribute("uname", uname);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Something is wrong!');");
                    out.println("location='addAccount.jsp';");
                    out.println("</script>");
                    return;
                }
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
