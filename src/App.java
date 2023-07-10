package classes;


public class App {
public static void setSend(String gmail,String otp) {
	GmailSender gsender = new GmailSender();
	String to = gmail;
	String from = "paisebachao11@gmail.com";
	String subject = "OTP verification";
	String text = "Your One Time Password for Sign up is "+otp;
	boolean b = gsender.sendEmail(to,from,subject,text,otp);
	if (b)
	{
		System.out.println("Email is sent successfully");
	}
	else
	{
		System.out.println("Threr is a problem in sending email");
	}
}
}
