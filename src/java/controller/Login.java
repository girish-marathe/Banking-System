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
public class Login extends HttpServlet {

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
            HttpSession session = request.getSession(true);

            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");

            DBConnection db = new DBConnection();

            if (uname.equals("admin") && pass.equals("admin")) {
                session.setAttribute("uname", uname);           //create session
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Login successfully!');");
                out.println("location='adminHome.jsp';");
                out.println("</script>");

            } else {

                String sql = "Select * from tbl_user where uname='" + uname + "' and password='" + pass + "'";
                ResultSet rs = db.Select(sql);
                if (rs.next()) {

                    String email = rs.getString("email");
                    session.setAttribute("uname", uname);
                    session.setAttribute("email", email);
                    session.setAttribute("PRN", uname);
                    //create session
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Login successfully!');");
                    out.println("location='userHome.jsp';");
                    out.println("</script>");

                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Login failed!');");
                    out.println("location='login.jsp';");
                    out.println("</script>");

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
