/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author PTPL-02
 */
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.PixelGrabber;
import java.awt.image.BufferedImage;
import java.awt.image.DataBuffer;
import javax.imageio.ImageIO;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
//import org.apache.tomcat.util.codec.binary.Base64;

public class CompareImage {

       public static double processImage1(String path1, String path2) throws IOException {

        long start = System.currentTimeMillis();
        File file = new File(path1);
        BufferedImage image = ImageIO.read(file);
        int width = image.getWidth(null);
        int height = image.getHeight(null);
        int[][] clr = new int[width][height];
        File files = new File(path2);
        BufferedImage images = ImageIO.read(files);
        int widthe = images.getWidth(null);
        int heighte = images.getHeight(null);
        int[][] clre = new int[widthe][heighte];
        int smw = 0;
        int smh = 0;
        int p = 0;
        //CALUCLATING THE SMALLEST VALUE AMONG WIDTH AND HEIGHT
        if (width > widthe) {
            smw = widthe;
        } else {
            smw = width;
        }
        if (height > heighte) {
            smh = heighte;
        } else {
            smh = height;
        }
        //CHECKING NUMBER OF PIXELS SIMILARITY
        for (int a = 0; a < smw; a++) {
            for (int b = 0; b < smh; b++) {
                clre[a][b] = images.getRGB(a, b);
                clr[a][b] = image.getRGB(a, b);
                if (clr[a][b] == clre[a][b]) {
                    p = p + 1;
                }
            }
        }

        float w, h = 0;
        if (width > widthe) {
            w = width;
        } else {
            w = widthe;
        }
        if (height > heighte) {
            h = height;
        } else {
            h = heighte;
        }
        float s = (smw * smh);
        //CALUCLATING PERCENTAGE
        float x = (100 * p) / s;
        
        System.out.println("THE PERCENTAGE SIMILARITY IS APPROXIMATELY =" + x + "%");
        long stop = System.currentTimeMillis();
        System.out.println("TIME TAKEN IS =" + (stop - start));
        return x;
    }

//    public static String encodeImage(byte[] imageByteArray) {
//        return Base64.encodeBase64URLSafeString(imageByteArray);
//    }
}
