package classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddTransaction
 */
@WebServlet("/newtransaction")
public class AddTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn=null;;
    PreparedStatement ps=null;
    
    public AddTransaction() {
    	super();
    }
    
    public void init(ServletConfig config)
    {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracker","root","root");
			ps = conn.prepareStatement("insert into transaction values(?,?,?,?,?,?,?)");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
       


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rsd;
		
		HttpSession session = request.getSession(false);
		String uname = (String)session.getAttribute("uname");
		
		String cname = request.getParameter("category");
		double amount = Double.parseDouble(request.getParameter("amount"));
		String note = request.getParameter("note");
		String ttype = request.getParameter("modeofpayment");
		java.sql.Date sqlDate=null;
		System.out.println(request.getParameter("tdate"));
			sqlDate =java.sql.Date.valueOf(request.getParameter("tdate"));
			System.out.println(sqlDate.toString());
		
		try
		{
			Random idgenerator = new Random();
			String tid = uname;
			for(int i=0;i<4;i++)
				tid += idgenerator.nextInt(9);
			
			
			ps.setString(1, tid);  
			ps.setDouble(2, amount);
			ps.setDate(3, sqlDate);
			ps.setString(4, cname);
			ps.setString(5, uname);
			ps.setString(6, ttype);
			ps.setString(7, note);
			ps.execute();
			
		}
		catch(NullPointerException n)
		{
			response.sendRedirect("session_expired.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
			rsd = request.getRequestDispatcher("transaction.jsp");
			rsd.forward(request,response);
		}
		
		
		  response.sendRedirect("Dashboard.jsp");
		 
		
	}
}
