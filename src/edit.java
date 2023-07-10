/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package classes;

//jakarta imports
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author vineet
 */
@WebServlet("/edit")
public class edit extends HttpServlet {
    
    Connection con ; 
    
    @Override
    public void init(ServletConfig sc){
        
        String url = "jdbc:mysql://localhost:3306/expense_tracker" ;
        String user = "root" ; 
        String pwd = "root" ;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } 
        catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        
        try {
            con = DriverManager.getConnection(url,user,pwd) ;
        } 
        catch (SQLException ex) {
           ex.printStackTrace();
        }
    }
    
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res){
        
        HttpSession session = req.getSession() ; 
       
        String uname = (String) session.getAttribute("uname") ; 
        String fname = req.getParameter("fname") ; 
        String lname = req.getParameter("lname") ; 
        String email = req.getParameter("email") ; 
//        long mobile = Long.parseLong(req.getParameter("mobile")) ; 
        String mobile = req.getParameter("mobile") ; 
        
        try {
            
            
            
            String query = "update user set fname=?,lname=? ,email=? ,mobile_num=? where uname=?;";
            
            PreparedStatement pst = con.prepareStatement(query);
            
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, email);
            pst.setString(4, mobile);
            pst.setString(5, uname);
            
            session.setAttribute("fname",fname);
            session.setAttribute("lname",lname);
            session.setAttribute("email",email);
            session.setAttribute("mobile",mobile);
            
            
            int updateCount = pst.executeUpdate() ; 
            
            System.out.println(updateCount+" rows affected");
            
            res.sendRedirect("profile.jsp");
            
        } 
        catch (SQLException | IOException ex) {
            ex.printStackTrace();
        }
        
    }
    
}
