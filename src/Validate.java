package classes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;  
import java.util.Date;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn=null;;
    PreparedStatement ps=null;
    PreparedStatement binsert=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config)
    {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracker","root","root");
			ps = conn.prepareStatement("insert into user values(?,?,?,?,?,?)");
			binsert = conn.prepareStatement("insert into budget values(?,?,?,?,?)");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		try {
		if(session.getAttribute("validated")==null)
			response.sendRedirect("login.jsp");
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		String otp = (String) session.getAttribute("otp");
		if(request.getParameter("otp").equals(otp))
		{
			pw.println("<html lang=\"en\">\r\n"
					+ "\r\n"
					+ "<head>\r\n"
					+ "\r\n"
					+ "    \r\n"
					+ "    <meta charset=\"utf-8\" />\r\n"
					+ "    <title>404 Page | Morvin - Admin & Dashboard Template</title>\r\n"
					+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
					+ "    <meta content=\"Premium Multipurpose Admin & Dashboard Template\" name=\"description\" />\r\n"
					+ "    <meta content=\"Themesdesign\" name=\"author\" />\r\n"
					+ "    <!-- App favicon -->\r\n"
					+ "    <link rel=\"shortcut icon\" href=\"./images/favicon.ico\">\r\n"
					+ "    <!-- Bootstrap Css -->\r\n"
					+ "    <link href=\"./css/bootstrap.min.css\" id=\"bootstrap-style\" rel=\"stylesheet\" type=\"text/css\" />\r\n"
					+ "    <!-- Icons Css -->\r\n"
					+ "    <link href=\"./css/icons.min.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n"
					+ "    <!-- App Css-->\r\n"
					+ "    <link href=\"./css/app.min.css\" id=\"app-style\" rel=\"stylesheet\" type=\"text/css\" />\r\n"
					+ "    <link href=\"./css/session_expired.css\" rel=\"stylesheet\"/>\r\n"
					+ "<link\r\n"
					+ "      rel=\"stylesheet\"\r\n"
					+ "      href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\"\r\n"
					+ "    />\r\n"
					+ "\r\n"
					+ "</head>\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "<body class=\"authentication-bg bg-primary\">\r\n"
					+ "    <div class=\"home-center\">\r\n"
					+ "        <div class=\"home-desc-center\">\r\n"
					+ "            <div class=\"container\">\r\n"
					+ "                <div class=\"row justify-content-center\">\r\n"
					+ "                    <div class=\"col-md-8 col-lg-6 col-xl-5\">\r\n"
					+ "                        <div class=\"card\" style=\"width:120%\">\r\n"
					+ "                            <div class=\"card-body shadow-lg pm-5\">\r\n"
					+ "                                <div class=\"px-2 py-2\">\r\n"
					+ "                                    <div class=\"text-center p-3 mb-5\">\r\n"
					+ "                                        <h1 class=\"error-page\"><span>\r\n"
					+ "                                        <img class=\"mb-5\" style=\"width:80%;height:80%\" src=\"./images/right.png\"></span></h1>\r\n"
					+ "                                        <h2 class=\"mb-4 mt-1\">Thanks for signing up</h2>\r\n"
					+ "                                        <p style=\"font-size:1.1rem\" class=\"mb-5 mx-auto\">Your account has been successfully created. </p>\r\n"
					+ "                                        <a style=\"font-size:1rem;\" class=\"btn btn-primary waves-effect waves-light\" href=\"login.jsp\"><i class=\"fa fa-sign-in\"></i> Login</a>\r\n"
					+ "                                    </div>\r\n"
					+ "                                </div>\r\n"
					+ "                            </div>\r\n"
					+ "                        </div>\r\n"
					+ "                    </div>\r\n"
					+ "                </div>\r\n"
					+ "            </div>\r\n"
					+ "        </div>\r\n"
					+ "    </div>\r\n"
					+ "\r\n"
					+ "</body>\r\n"
					+ "\r\n"
					+ "</html>");
			String uname = (String)session.getAttribute("uname");
			String fname = (String)session.getAttribute("fname");
			String lname = (String)session.getAttribute("lname");
			String email = (String)session.getAttribute("email");
			String mobile_num = (String)session.getAttribute("mobile");
			String password = (String)session.getAttribute("password");
			try {
			ps.setString(1, uname);
			ps.setString(2, fname);
			ps.setString(3, lname);
			ps.setString(4, email);
			ps.setString(5, mobile_num);
			ps.setString(6, password);
			binsert.setString(1, uname);
			binsert.setDouble(2, 0);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
			Date date = new Date(); 
			binsert.setString(3, formatter.format(date));
			binsert.setInt(4, 1);
			binsert.setString(5, "");
			binsert.execute();
			ps.execute();
		
			}
			catch(Exception e)
			{
				e.printStackTrace();
				RequestDispatcher rsd = request.getRequestDispatcher("Validate.jsp");
				rsd.forward(request,response);
			}
			pw.println("Validation successful");
			pw.println("<html>Click here to login</a></body></html>");	
		}
		else
		{
			pw.println("Hello");
			RequestDispatcher rsd = request.getRequestDispatcher("Validate.jsp");
			session.setAttribute("resend", true);
			rsd.forward(request,response);
		}
		}
		catch(Exception e)
		{
			System.out.println(e);
			/* response.sendRedirect("session_expired.jsp"); */
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
