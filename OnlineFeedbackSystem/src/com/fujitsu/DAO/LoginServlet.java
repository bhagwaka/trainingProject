package com.fujitsu.DAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fujitsu.connection.ConnectionUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con = ConnectionUtil.establishConnection();

		
		int flag=0;
		HttpSession session = request.getSession(true);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String category = request.getParameter("category");
		try {
			PreparedStatement psmt = con.prepareStatement("Select username,password,category from login;");
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				String uname = rs.getString(1);
				String pwd = rs.getString(2);
				String cat = rs.getString(3);
				
					if(username.equals(uname)&&password.equals(pwd)&&category.equalsIgnoreCase(cat)){
					System.out.println("validated");
					flag=1;
				} 
				
				
			}
			
			if(flag==1){
				switch (category) {
				case "trainee":
					System.out.println("Trainee");
					session.setAttribute("USERNAME", username);
					response.sendRedirect("WelcomeUser.jsp");
					break;
				case "trainer":
					session.setAttribute("USERNAME", username);
					System.out.println("Trainer");
					response.sendRedirect("Trainer.jsp");
					break;
				case "admin":
					session.setAttribute("USERNAME", username);
					System.out.println("admin");
					response.sendRedirect("display.jsp");
					break;
				}
			}
			else{
//				System.out.println("wrong credentials");
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				PrintWriter  out = response.getWriter();
				out.println("<html><body>Either User name or Password is Incorrect</body></html>");
				rd.include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
