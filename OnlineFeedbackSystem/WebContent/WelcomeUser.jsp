<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>

<title>Welcome User</title>
</head>
<body bgcolor="#FFB6C1">


<%@page import  = "com.fujitsu.connection.ConnectionUtil" %>
<%@page import  =  "java.sql.DriverManager" %>
<%@page import  =  "java.sql.PreparedStatement" %>
<%@page import  =  "java.sql.ResultSet" %>
<%@page import	=	"java.sql.Connection" %>

<% 
String name=(String)session.getAttribute("USERNAME");
Connection con = ConnectionUtil.establishConnection();

PreparedStatement psmt = con.prepareStatement("select category from login where username=? ");
psmt.setString(1,name);
ResultSet rs=psmt.executeQuery();
String category="";

while(rs.next())
{
	 category=rs.getString("category");
	}

if(category.equalsIgnoreCase("trainee"))
{
	int flag=0;
PreparedStatement psmt1 = con.prepareStatement("select flag from feedback  where traineename=? ");
psmt1.setString(1, name);
ResultSet rs1=psmt1.executeQuery();

while(rs1.next())
{
	 flag=rs1.getInt("flag");
	}
System.out.println(flag);
 if(flag == 0) 
{  
	%>
	<form action="Trainee.jsp">
	<input type="submit" value="submit Feedback">
	</form>
	<%
	} else
	{
		out.println("You've Already submitted your feedback! Thank You");
	}
}
else if(category.equalsIgnoreCase("trainer"))
{
	PreparedStatement psmt2 = con.prepareStatement("select flag from feedback  where trainername=? ");
	psmt2.setString(1, name);
	ResultSet rs2=psmt2.executeQuery();
	int flag=0;
	while(rs2.next())
	{
		 flag=rs2.getInt("flag");
		}
	System.out.println(flag);
	 if(flag == 0) 
	{  
		%>
		<form action="Trainer.jsp">
		<input type="submit" value="submit Feedback">
		</form>
		<%
		} else
		{
			out.println("You've Already submitted your feedback! Thank You");
		}
	



}
%>
User: ${USERNAME}
 <br>
	<form  action="LogoutServlet" method="get">
		<input type="submit" value="logout">
	</form>

<!-- 	<form action="Trainee.jsp" method="display()"> -->
<!-- 	<input type="submit" value="submit Feedback"> -->
<!-- 	</form> -->


</body>
</html>