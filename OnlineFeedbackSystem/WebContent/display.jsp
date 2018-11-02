<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import  = "com.fujitsu.connection.ConnectionUtil" %>
<%@page import  =  "java.sql.DriverManager" %>
<%@page import  =  "java.sql.PreparedStatement" %>
<%@page import  =  "java.sql.ResultSet" %>
<%@page import	=	"java.sql.Connection" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#FFB6C1">
	<%
		//session.setAttribute("USERNAME", session.getAttribute("USERNAME"));
		String userName = (String) session.getAttribute("USERNAME");

		try {
			Connection con = ConnectionUtil.establishConnection();
			PreparedStatement ps = con.prepareStatement("SELECT traineename,trainername,knowledge,voice,presentation,teaching,suggestion from feedback;");
			ResultSet resultSet = ps.executeQuery();
			if (resultSet!=null) {
	%>
	<center>
		<table border=1>
			<h1>Trainer Feedback</h1>
			<tr>
			    
				<th>TraineeName</th>
				<th>TrainerName</th>
				<th>Knowledge</th>
				<th>Voice</th>
				<th>Presentation</th>
				<th>Teaching</th>
				<th>Suggestion</th>
			</tr>
			<%
				while (resultSet.next()) {
			%>
			<tr>
			<td>
					<%
						out.print(resultSet.getString("traineename"));
					%>
				</td>
				<td>
					<%
						out.print(resultSet.getString("trainername"));
					%>
				</td>
				<td>
					<%
						out.print(resultSet.getString("knowledge"));
					%>
				</td>
				<td>
					<%
						out.print(resultSet.getString("voice"));
					%>
				</td>
				<td>
					<%
						out.print(resultSet.getString("presentation"));
					%>
				</td>
				<td>
					<%
						out.print(resultSet.getString("teaching"));
					%>
				</td>
               
				<td>
					<%
						out.print(resultSet.getString("suggestion"));
					%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			} else {
		%><center>
			<h2>
				<%
					out.print("no feedback given");
				%>
			</h2>
		</center>
		<%
			}
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
	
</body>
</html>