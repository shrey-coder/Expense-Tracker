package classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Prevalidate
 */
@WebServlet("/Prevalidate")
public class Prevalidate extends HttpServlet {
	Connection conn=null;
    PreparedStatement ps=null;
    PreparedStatement ps1=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Prevalidate() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config)
    {
    	try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracker","root","root");
        	ps = conn.prepareStatement("select * from user where uname=?");
        	ps1 = conn.prepareStatement("select * from user where email=?");
        	}
        	catch(Exception e)
        	{
        		System.out.println(e);
        	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		ps.setString(1,request.getParameter("uname"));
		ps1.setString(1,request.getParameter("email"));
		ResultSet rs = ps.executeQuery();
		ResultSet rs1 = ps1.executeQuery();
		if(rs.next()==false && rs1.next()==false)
		{
			HttpSession session = request.getSession(true);
			session.setMaxInactiveInterval(100);
			session.setAttribute("validated",true);
			RequestDispatcher rsd = request.getRequestDispatcher("Validate.jsp");
			rsd.forward(request, response);
		}
		else
		{
			response.sendRedirect("http://localhost:8080/Expense_Tracker/login.jsp?uexists=true");
		}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
