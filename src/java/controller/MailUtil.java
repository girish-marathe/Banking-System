/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author shri
 */
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailUtil {

    private String SMTP_HOST = "smtp.gmail.com";
    private String FROM_ADDRESS = "thepravara@gmail.com";
    private String PASSWORD = "fkak ylra eeuu rvun";
    private String FROM_NAME = "Bank Application:  ";

    public boolean sendMail(String[] recipients, String[] bccRecipients, String subject, String message, String filename) throws IOException {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", SMTP_HOST);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.debug", "false");
            props.put("mail.smtp.ssl.enable", "true");

            Session session = Session.getInstance(props, new SocialAuth());
            Message msg = new MimeMessage(session);

            InternetAddress from = new InternetAddress(FROM_ADDRESS, FROM_NAME);
            msg.setFrom(from);

            InternetAddress[] toAddresses = new InternetAddress[recipients.length];
            for (int i = 0; i < recipients.length; i++) {
                toAddresses[i] = new InternetAddress(recipients[i]);
            }
            msg.setRecipients(Message.RecipientType.TO, toAddresses);

            InternetAddress[] bccAddresses = new InternetAddress[bccRecipients.length];
            for (int j = 0; j < bccRecipients.length; j++) {
                bccAddresses[j] = new InternetAddress(bccRecipients[j]);
            }
            msg.setRecipients(Message.RecipientType.BCC, bccAddresses);
            msg.setSubject(subject);
            msg.setContent(message, "text/plain");

            MimeBodyPart messageBodyPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            File file1 = new File(filename);
            // adds attachments
            if (filename != null) {
                messageBodyPart = new MimeBodyPart();
                DataSource source = new FileDataSource(file1);
                messageBodyPart.setDataHandler(new DataHandler(source));
                multipart.addBodyPart(messageBodyPart);
            }
            msg.setContent(multipart);

            Transport.send(msg);
            return true;
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(MailUtil.class.getName()).log(Level.SEVERE, null, ex);
            return false;

        } catch (MessagingException ex) {
            Logger.getLogger(MailUtil.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    class SocialAuth extends Authenticator {

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(FROM_ADDRESS, PASSWORD);

        }
    }
}
