/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connection.DBConnection;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
//import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author PTPL-02
 */
public class CreateAccount extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private boolean isMultipart;
    private String filePath = "D:/";
//    private String filePath = "/home/shri/project";
    private int maxFileSize = 200 * 1024;
    private int maxMemSize = 4 * 1024;
    private File file;
    public String iris = "";
    public String fp = "";
    DBConnection db = new DBConnection();
    ResultSet rs = null, rs1 = null, rs2 = null;

    public void init() {
        // Get the file location where it would be stored.
        //  filePath = getServletContext().getInitParameter("file-upload");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        HttpSession httpSession = request.getSession(false);
        String uname = httpSession.getAttribute("uname").toString();

        isMultipart = ServletFileUpload.isMultipartContent(request);
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter();
        if (!isMultipart) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>No file uploaded</p>");
            out.println("</body>");
            out.println("</html>");
            return;
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));
//        factory.setRepository(new File("/home/shri/temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        String tname = "", lname = "", address = "", gender = "", email = "", mobile = "", adhar_id = "", pan_id = "", dob = "", tpin = "";
        String imgPath = "", status = "deactive";
        String branch = "";
        String ifsc = "";
        int num = 0;
        double amount = 1000;
        String account_no;
        try {

            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            int START = 1000000000;
            Random random = new Random();
            num = random.nextInt(START) + 1000;
            account_no = Integer.toString(num);
            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            ArrayList allfilenames = new ArrayList();
            ArrayList allsignatures = new ArrayList();
            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    String contentType = fi.getContentType();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
                    String newfilepath = file.getAbsolutePath();
                    System.out.println("Uploaded Filename: " + fileName);
                    //System.out.println("Uploaded File Path: "+newfilepath);

                    String extension = "";
                    if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0) {
                        extension = fileName.substring(fileName.lastIndexOf(".") + 1);
                    }

                    ServletContext sc = this.getServletContext();
                    String sg1 = sc.getRealPath("/");
                    String fname = sg1.substring(0, sg1.indexOf("build"));
                    String filename1 = fname + "web/images/Uploaded Storage/" + fileName.trim();

                    BufferedImage originalImage = ImageIO.read(new File(newfilepath));
                    File file1 = new File(filename1.trim());
                    ImageIO.write(originalImage, extension.trim(), file1);

                    FileInputStream imageInFile = new FileInputStream(file1);
                    byte imageData[] = new byte[(int) file1.length()];
                    imageInFile.read(imageData);

                    imgPath = "images/Uploaded Storage/" + fileName.trim();
                } else {
                    String fieldname = fi.getFieldName();//text1
                    String value = fi.getString();
                    if (fieldname.trim().equals("fname")) {
                        tname = value.trim();
                    }
                    if (fieldname.trim().equals("lname")) {
                        lname = value.trim();
                    }
                    if (fieldname.trim().equals("address")) {
                        address = value.trim();
                    }
                    if (fieldname.trim().equals("gender")) {
                        gender = value.trim();
                    }
                    if (fieldname.trim().equals("branch")) {
                        branch = value.trim();
                    }
                    if (fieldname.trim().equals("email")) {
                        email = value.trim();
                    }

                    if (fieldname.trim().equals("mobile")) {
                        mobile = value.trim();
                    }
                    if (fieldname.trim().equals("adhar")) {
                        adhar_id = value.trim();
                    }
                    if (fieldname.trim().equals("pan")) {
                        pan_id = value.trim();
                    }

                    if (fieldname.trim().equals("bdate")) {
                        dob = value.trim();
                    }
                    if (fieldname.trim().equals("tpin")) {
                        tpin = value.trim();
                    }
                    /*System.out.println("fieldname: "+fieldname);
                    System.out.println("value: "+value);*/
                }
            }
       
                String sql = "Select * from tbl_user_account where uname='" + uname + "'";
                rs = db.Select(sql);
                if (rs.next()) {
                    httpSession.setAttribute("uname", uname);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('These User already exists!');");
                    out.println("location='userHome.jsp';");
                    out.println("</script>");
                    return;
                } else {
                    String query = "Select * from tbl_branch where branch_name='" + branch + "'";
                    rs1 = db.Select(query);
                    if (rs1.next()) {
                        ifsc = rs1.getString("ifsc");
                    }
                    String account = ifsc + account_no;
                    String sql1 = "Insert into tbl_user_account(uname,fname,lname,address,email,gender,mobile,adhar_id,pan_id,status,account_no,image,imgpath,dob,branch_name,ifsc,tamount,tpin)values('" + uname.trim() + "','" + tname.trim() + "','" + lname.trim() + "','" + address.trim() + "','" + email.trim() + "','" + gender.trim() + "','" + mobile.trim() + "','" + adhar_id.trim() + "','" + pan_id.trim() + "','" + status.trim() + "','" + account.trim() + "','','" + imgPath.trim() + "','" + dob.trim() + "','" + branch.trim() + "','" + ifsc.trim() + "','" + amount + "','"+tpin+"')";
                    int result = db.Insert(sql1);
                    if (result > 0) {
                        httpSession.setAttribute("uname", uname);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Create account!');");
                        out.println("location='userHome.jsp';");
                        out.println("</script>");
                        return;
                    } else {
                        httpSession.setAttribute("uname", uname);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Account not create!');");
                        out.println("location='createAccount.jsp';");
                        out.println("</script>");
                        return;
                    }
                }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

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

//    public static String encodeImage(byte[] imageByteArray) {
//        return Base64.encodeBase64URLSafeString(imageByteArray);
//    }
}
