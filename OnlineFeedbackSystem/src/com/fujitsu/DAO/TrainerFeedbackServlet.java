package com.fujitsu.DAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fujitsu.connection.ConnectionUtil;


@WebServlet("/TrainerFeedbackServlet")
public class TrainerFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	public String trainername;
	public String Technology;
	public String Presentation;
	public String TeamWork;
	public String understanding;
	public String behaviour;
	public String suggestion;
    public TrainerFeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//String name=document.getElementById("TranierName");
		HttpSession session = request.getSession(true);
		trainername=(String) session.getAttribute("USERNAME");
		System.out.println(trainername);
		Technology=request.getParameter("technology");
		System.out.println(Technology);
		Presentation= request.getParameter("Presentation");
		System.out.println(Presentation);
		 TeamWork= request.getParameter("teamWork");
		System.out.println( TeamWork);
		understanding= request.getParameter("understanding");
		System.out.println(understanding);
		behaviour= request.getParameter("behavior");
		System.out.println(behaviour);
		suggestion= request.getParameter("suggestion");
		System.out.println(suggestion);
		//String knowledge = 
		getConnection();
		RequestDispatcher rs=request.getRequestDispatcher("Thankyou.jsp");
		rs.forward(request, response);
					
	}
	void getConnection(){
		Connection con=null;
		PreparedStatement ps=null;
		try{
			con=ConnectionUtil.establishConnection();
			ps=(PreparedStatement) con.prepareStatement("insert into trainerfeedback values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, (int) Math.random());
			ps.setString(2, trainername);
			ps.setString(3, Technology);
			ps.setString(4, Presentation);
			ps.setString(5, TeamWork);
			ps.setString(6, understanding);
			ps.setString(7, behaviour);
			ps.setString(8, suggestion);
			ps.setInt(9, 1);
			int rows=ps.executeUpdate();
			System.out.println("Number of rows affected :"+rows);
			
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

