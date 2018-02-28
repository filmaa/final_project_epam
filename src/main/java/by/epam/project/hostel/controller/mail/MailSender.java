package by.epam.project.hostel.controller.mail;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;


public class MailSender {

    private static final Logger logger = LogManager.getLogger(MailSender.class);

    private static final String AUCTION_MAIL = "hostel.world.project@gmail.com";
    private static final String PASSWORD = "hostel1234";
    private static final Properties MAIL_PROPERTIES;

    static {
        MAIL_PROPERTIES = new Properties();
        MAIL_PROPERTIES.put("mail.smtp.host", "smtp.gmail.com");
        MAIL_PROPERTIES.put("mail.smtp.socketFactory.port", "465");
        MAIL_PROPERTIES.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        MAIL_PROPERTIES.put("mail.smtp.auth", "true");
        MAIL_PROPERTIES.put("mail.smtp.port", "465");
    }

    public static void sendMessage(String subject, String content, String recipientEmail) {
        Session session = Session.getDefaultInstance(MAIL_PROPERTIES, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(AUCTION_MAIL, PASSWORD);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject);
            message.setText(content);
            Transport.send(message);
        } catch (MessagingException e) {
            logger.error("error during sending email " + recipientEmail, e);
        }
    }

}
