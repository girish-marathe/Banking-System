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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PTPL-02
 */
public class AccountVerify extends HttpServlet {

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
            String remail=request.getParameter("email");
            String fname = request.getParameter("fname");
            String ifsc = request.getParameter("ifsc");
            String account = request.getParameter("accno");

            String qry = "Select * from tbl_user_account where account_no='" + account + "'and ifsc='" + ifsc + "'";
            ResultSet rs1 = db.Select(qry);
            if (rs1.next()) {
                httpSession.setAttribute("uname", uname);
                httpSession.setAttribute("account", account);
                httpSession.setAttribute("ifsc", ifsc);
                httpSession.setAttribute("fname", fname);
                httpSession.setAttribute("remail", remail);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Account is verified!');");
                out.println("location='AddAccount';");
                out.println("</script>");
                return;
            } else {
                httpSession.setAttribute("uname", uname);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Account is not valid!');");
                out.println("location='addAccount.jsp';");
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
