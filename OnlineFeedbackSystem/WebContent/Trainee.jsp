<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>FeedBack</title>
<script>
function  alertmessage(){
	alert("Thankyou for your feedback");
	
}
</script>
</head>
<body>

<body bgcolor="#FFB6C1">
	<%!int i = 0;%>
	
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,revalidate");
		if (session.getAttribute("USERNAME") == null) {
			
			response.sendRedirect("index.jsp");
		}
	%>
	Welcome ${USERNAME}
	<form  action="LogoutServlet" method="get">
		<input type="submit" value="logout">
	</form>





	<form action="FeedbackServlet" method="get"  onsubmit="alertmessage()">
		<div align="center"> 
			<h2>Feedback</h2>
			<table  cellpadding="20px" cellspacing="10px"  label="Feedback">
				<tr>
					<td>Trainer :</td>
					<td><select name="TrainerName">
							<option value="Janani">Janani</option>
							<option value="Sachin">Sachin</option>
					</select></td>
				</tr>
				<tr>
					<td>Knowledge :</td>
					<td><input type="radio" value="Poor" name="Knowledge">Poor
						<input type="radio" value="Average" name="Knowledge">Average
						<input type="radio" value="Good" name="Knowledge">Good
					</td>
				</tr>
				<tr>
					<td>Voice :</td>
					<td><input type="radio" value="Poor" name="Voice">Poor
						<input type="radio" value="Average" name="Voice">Average <input
						type="radio" value="Good" name="Voice">Good</td>
				</tr>
				<tr>
					<td>Presentation :</td>
					<td><input type="radio" value="Poor"
						name="Presentation">Poor <input type="radio"
						value="Average" name="Presentation">Average <input
						type="radio" value="Good" name="Presentation">Good
					</td>
				</tr>
				<tr>
					<td>Teaching :</td>
					<td><input type="radio" value="Poor" name="Teaching">Poor
						<input type="radio" value="Average" name="Teaching">Average
						<input type="radio" value="Good" name="Teaching">Good
					</td>
				</tr>
				<tr>
					<td>Suggestion :</td>
					<td><input type="text" name="Suggestion" maxlength="255"></td>
				</tr>
			</table>
			<input type="submit" value="Submit"  >
			
		</div>	
		
	</form>
</body>
</html>