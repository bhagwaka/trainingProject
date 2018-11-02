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


@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	public String trainername;
	public String knowledge;
	public String voice;
	public String presentation;
	public String teaching;
	public String suggestion;
	public String traineename;
    public FeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//String name=document.getElementById("TranierName");
		HttpSession session = request.getSession(true);
		traineename=(String) session.getAttribute("USERNAME");
		System.out.println(traineename);
		trainername=request.getParameter("TrainerName");
		System.out.println(trainername);
		knowledge= request.getParameter("Knowledge");
		System.out.println(knowledge);
		voice= request.getParameter("Voice");
		System.out.println(voice);
		presentation= request.getParameter("Presentation");
		System.out.println(presentation);
		teaching= request.getParameter("Teaching");
		System.out.println(teaching);
		suggestion= request.getParameter("Suggestion");
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
			ps=(PreparedStatement) con.prepareStatement("insert into feedback values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, (int) Math.random());
			ps.setString(2, traineename);
			ps.setString(3, trainername);
			ps.setString(4, knowledge);
			ps.setString(5, voice);
			ps.setString(6, presentation);
			ps.setString(7, teaching);
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
