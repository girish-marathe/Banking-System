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

/**
 *
 * @author PTPL-02
 */
public class UserRegister extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String name = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");

            name = name;
            address = address;
            email = email;
            gender = gender;
            uname = uname;
            pass = pass;
            lname = lname;

            DBConnection db = new DBConnection();

            String sql = "Select * from tbl_user where uname='" + uname + "'";
            ResultSet rs = db.Select(sql);
            if (rs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User already existed!');");
                out.println("location='login.jsp';");
                out.println("</script>");
            } else {
                String query = "insert into tbl_user (uname,password,fname,address,email,gender,lname)values('" + uname + "','" + pass + "','" + name + "','" + address + "','" + email + "','" + gender + "','" + lname + "')";
                int result = db.Insert(query);
                if (result > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('User registration successfully!');");
                    out.println("location='login.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('User registration not successfully!');");
                    out.println("location='userRegister.jsp';");
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
