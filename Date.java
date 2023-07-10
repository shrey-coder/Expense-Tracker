package classes;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/getdate")
public class Date extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dateAfter = request.getParameter("dateAfter");
		String dateBefore = request.getParameter("dateBefore");
		
		LocalDate date = LocalDate.parse(dateAfter);
		LocalDate date1 = LocalDate.parse(dateBefore);
		HttpSession session = request.getSession(false);
		try {
		if(session.getAttribute("authenticated")==null)
			response.sendRedirect("login.jsp");
		if(date1.compareTo(date) < 0)
		{
				request.getRequestDispatcher("Analysis.jsp").forward(request,response);
		}
		else
		{
				session.setAttribute("dateAfter", dateAfter);
				session.setAttribute("dateBefore", dateBefore);
				
				request.getRequestDispatcher("Analysis.jsp").forward(request, response);
		}
		}
		catch(Exception e)
		{
			response.sendRedirect("session_expired.jsp");
		}
		
	}

}
