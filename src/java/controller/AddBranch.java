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
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PTPL-02
 */
public class AddBranch extends HttpServlet {

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
            HttpSession httpSession = request.getSession(false);
            String uname = httpSession.getAttribute("uname").toString();

            int num =1111;
            int num2=0;
            Random random = new Random();
            int num1=random.nextInt(num)+1;
            num2=num1+1000;
            String ifsc = Integer.toString(num2);
            String bname = request.getParameter("BranchName");

            DBConnection db = new DBConnection();

            String sql = "Select * from tbl_branch where branch_name='" + bname + "'&& ifsc='" + ifsc + "'";
            ResultSet rs = db.Select(sql);
            if (rs.next()) {
                httpSession.setAttribute("uname", uname);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Already branch name existed!');");
                out.println("location='adminHome.jsp';");
                out.println("</script>");
                return;
            } else {
                String query = "Insert into tbl_branch(branch_name,ifsc)values('" + bname + "','" + ifsc + "')";
                int result = db.Insert(query);
                if (result > 0) {
                    httpSession.setAttribute("uname", uname);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Branch added!');");
                    out.println("location='addBranch.jsp';");
                    out.println("</script>");
                    return;
                } else {
                    httpSession.setAttribute("uname", uname);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Branch is not added!');");
                    out.println("location='addBranch.jsp';");
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
