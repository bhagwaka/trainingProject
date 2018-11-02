package com.fujitsu.DAO;

import java.io.IOException
;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int id = (int) Math.random();
		//System.out.println(id);
		
		String username = request.getParameter("username");
		System.out.println(username);
		String category = request.getParameter("category");
		System.out.println(category);
		String technology = request.getParameter("technology");
		System.out.println(technology);
		String password = request.getParameter("password");
		System.out.println(password);
		
		Connection con = null;
		PreparedStatement ps = null;
			try{
				con = com.fujitsu.connection.ConnectionUtil.establishConnection();
				ps=con.prepareStatement("insert into registration values(?,?,?,?,?);");
				ps.setInt(1, (int) Math.random());
				ps.setString(2, username);
				ps.setString(3, category);
				ps.setString(4, technology);
				ps.setString(5, password);
				int rows=ps.executeUpdate();
				ps=con.prepareStatement("insert into login values(?,?,?,?)");
				ps.setInt(1, (int) Math.random());
				ps.setString(2, username);
				ps.setString(3, password);
				ps.setString(4, category);
                int rows1=ps.executeUpdate();
				System.out.println("Number of rows affected :"+rows+" "+rows1);	
				response.sendRedirect("index.jsp");
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
