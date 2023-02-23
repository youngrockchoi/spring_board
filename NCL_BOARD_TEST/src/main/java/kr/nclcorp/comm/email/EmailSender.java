package kr.nclcorp.comm.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import com.sun.xml.messaging.saaj.packaging.mime.internet.MimeUtility;



public class EmailSender {
	@Autowired
    protected JavaMailSender  mailSender;
    public void SendEmail(Email email) throws Exception {
         
        MimeMessage msg = mailSender.createMimeMessage();
        
        try {
        	msg.setSubject(MimeUtility.encodeText(email.getSubject(), "UTF-8", "B"));
        	msg.setContent(email.getContent(), "text/html; charset=UTF-8");	
        	
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
           
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        try {
            mailSender.send(msg);
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        }
    }

}
