package com.fujitsu.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtil {
	public static Connection con = null;
	public static Connection establishConnection(){
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_db","root","1234");
		System.out.println("Connection Successful");
	}
	catch(Exception e)
	{
		e.printStackTrace();
		System.out.println("Connection Error!");
	}
	return con;				
}
	public static void main(String[] args) {
		establishConnection();
	}
}
