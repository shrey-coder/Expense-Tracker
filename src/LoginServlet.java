package classes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection conn=null;;
    PreparedStatement ps=null;
    PreparedStatement budget=null;
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config)
    {
    	try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracker","root","root");
    	ps = conn.prepareStatement("select * from user where uname=? and password=?");
    	budget = conn.prepareStatement("select * from budget where uname=?");
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
		try {
		// TODO Auto-generated method stub
			HttpSession session = request.getSession(true);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()==false)
		{
			session.setAttribute("invalid", false);
			response.sendRedirect("login.jsp");
		}
		else
		{
			 session.setMaxInactiveInterval(120); 
			
			  budget.setString(1,rs.getString(1)); ResultSet rset = budget.executeQuery();
			  rset.next(); session.setAttribute("bamount",rset.getDouble(2) );
			  session.setAttribute("bdate",rset.getDate(3));
			  session.setAttribute("remarks",rset.getInt(5));
			 
			session.removeAttribute("invalid");
			session.setAttribute("authenticated", true);
			session.setAttribute("uname",rs.getString(1));
			session.setAttribute("fname", rs.getString(2));
			session.setAttribute("lname", rs.getString(3));
			session.setAttribute("email",rs.getString(4));
			session.setAttribute("mobile", rs.getString(5));
			response.sendRedirect("Dashboard.jsp");
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
