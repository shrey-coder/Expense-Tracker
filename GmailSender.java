package classes;


import javax.activation.*;
import com.sun.mail.smtp.*;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GmailSender {
	
		public boolean sendEmail(String to,String from,String subject,String text,String otp)
		{
			boolean flag = false;
			Properties properties = new Properties();
			properties.put("mail.smtp.auth","true");
			properties.put("mail.smtp.starttls.enable","true");
			properties.put("mail.smtp.port","587");
			properties.put("mail.smtp.host","smtp.gmail.com");
			properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
			final String username = "paisebachao11";
			final String password = "bwbvetzcmfogimlv";
			
			//session
			Session session = Session.getInstance(properties, new Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication(username, password);
			}
			});
			System.out.println(session.getProperties());
			
			try{
				Message message = new MimeMessage(session);
				message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setFrom(new InternetAddress(from));
				message.setSubject(subject);
				message.setText(text);
				System.out.println(message);
				Transport.send(message);
				System.out.println("Error");
				flag = true;
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			
			return flag;
		}
}
