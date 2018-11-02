package com.fujitsu.DAO;


import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutSerlvet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h2>Thank You for your feedback</h2>");
		out.println("");
		out.println("");
		out.println("");
		out.println("");
		out.println("");
		out.println("</body>");
		out.println("</<html>>");
		
		
		
		HttpSession session = request.getSession(false);
		session.removeAttribute("USERNAME");
		session.invalidate();
		
		response.sendRedirect("index.jsp");
	}

}