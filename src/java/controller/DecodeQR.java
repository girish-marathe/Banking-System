/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.zxing.EncodeHintType;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import connection.DBConnection;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author PTPL-02
 */
public class DecodeQR extends HttpServlet {

    private boolean isMultipart;
    //private String filePath = "D:/";
     private String filePath = "/home/shri/project";
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;
    private File file;
    String result = "";

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
        // Check that we have a file upload request

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
        HttpSession httpSession = request.getSession(false);
        String uname = httpSession.getAttribute("uname").toString();
        String email = httpSession.getAttribute("email").toString();
        PrintWriter out = response.getWriter();
        DBConnection db = new DBConnection();
        isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
            return;
        }

        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        //factory.setRepository(new File("c:\\temp"));
        factory.setRepository(new File("/home/shri/temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        try {
            // Parse the request
            File uploadedFile;
            String imgPath = "", imgPath1 = "";
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    boolean isInMemory = item.isInMemory();
                    long sizeInBytes = item.getSize();
                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    item.write(file);

                    String newfilepath = file.getAbsolutePath();
                    System.out.println("Uploaded Filename: " + fileName);
                    String extension = "";
                    if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0) {
                        extension = fileName.substring(fileName.lastIndexOf(".") + 1);
                    }

                    ServletContext sc = this.getServletContext();
                    String sg1 = sc.getRealPath("/");
                    String fname = sg1.substring(0, sg1.indexOf("build"));
                    imgPath = fname + "web/images/data/" + fileName.trim();
                    imgPath1 = fname + "web/images/users/" + uname + "/2LQR.jpg";

                    BufferedImage originalImage = ImageIO.read(new File(newfilepath));
                    File file1 = new File(imgPath.trim());
                    ImageIO.write(originalImage, extension.trim(), file1);
                }
            }
            //double p = CompareImage.processImage(imgPath, imgPath1);
            Double q = CompareImage.processImage1(imgPath, imgPath1);
            if (q >= 60.00) {
                String temp = "";
                String sql = "Select * from tbl_detail where email='" + email + "'";
                ResultSet rs = db.Select(sql);
                if (rs.next()) {
                    Details.inLen = Integer.parseInt(rs.getString("inlen"));
                    temp = rs.getString("ccp");
                }
                String string[] = temp.split("#");
                ArrayList list = new ArrayList();
                for (String y : string) {
                    list.add(y);
                }
                Details.ccp = new int[list.size()];
                for (int i = 0; i < Details.ccp.length; i++) {
                    Details.ccp[i] = Integer.parseInt((String) list.get(i));
                }
                System.out.println(Details.ccp);

                Random rnd = new Random();
                int gen = 3;
                Decoder d = new Decoder(gen, Details.inLen);
                int[] bads = {};
                int s = 5;
                HashSet<Integer> bad = createSet(bads);

                for (int i = 0; i < 2 * s; i++) {
                    int b = rnd.nextInt(Details.inLen + 2 * s);
                    bad.add(b);
                }
                System.out.println(bad);
                int[] cp = d.decode(Details.ccp, bad);
                char[] ch = new char[cp.length];
                for (int i = 0; i < cp.length; i++) {
                    ch[i] = (char) (cp[i]);
                }
                String s3 = new String(ch);
                String sql2 = "Update tbl_user_account set tpin='" + s3 + "' where email='" + email + "'";
                db.Update(sql2);
                httpSession.setAttribute("uname", uname);
                result = s3;
                System.out.println(result);
                out.println(result);

            } else {
                result = "Your transaction PIN is not generated";
                httpSession.setAttribute("uname", uname);
                System.out.println(result);
                out.println(result);
            }

        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
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

    public static HashSet<Integer> createSet(int[] a) {
        HashSet<Integer> h = new HashSet<Integer>();
        for (int a1 : a) {
            h.add(a1);
        }
        return h;
    }

}
