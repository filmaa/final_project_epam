package by.epam.project.hostel.controller.mail;

import org.junit.Test;

public class MailSenderTest {

    @Test
    public void sendMessage() {
        MailSender.sendMessage("Test", "Test message!!!", "kate.filmanovich@gmail.com");
    }
}