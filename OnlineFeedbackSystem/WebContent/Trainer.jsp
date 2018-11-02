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
<body bgcolor="#FFB6C1">



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

	<form action="TrainerFeedbackServlet" method="get"  onsubmit="alertmessage()">
		<div align="center"> 
			<h2>FEEDBACK FOR TRAINEE</h2>
			<table  cellpadding="20px" cellspacing="10px"  label="Feedback">
				<tr>
					<td>Technology:</td>
					<td><select name="technology">
							<option value="BAS">BAS</option>
							<option value="MIS">MIS</option>
					</select></td>
				</tr>
				<tr>
					<td>Presentation :</td>
					<td><input type="radio" value="Poor" name="Presentation">Poor
						<input type="radio" value="Average" name="Presentation">Average
						<input type="radio" value="Good" name="Presentation">Good
					</td>
				</tr>
				<tr>
					<td>Team Work:</td>
					<td><input type="radio" value="Poor" name="teamwork">Poor
						<input type="radio" value="Average" name="teamwork">Average <input
						type="radio" value="Good" name="teamwork">Good</td>
				</tr>
				<tr>
					<td>Understanding :</td>
					<td><input type="radio" value="Poor"
						name="understanding">Poor <input type="radio"
						value="Average" name="understanding">Average <input
						type="radio" value="Good" name="understanding">Good
					</td>
				</tr>
				<tr>
					<td>Behavior :</td>
					<td><input type="radio" value="Poor" name="behavior">Poor
						<input type="radio" value="Average" name="behavior">Average
						<input type="radio" value="Good" name="behavior">Good
					</td>
				</tr>
				<tr>
					<td>Suggestion :</td>
					<td><input type="text" name="suggestion" maxlength="255"></td>
				</tr>
			</table>
			<input type="submit" value="Submit">
			
		</div>	
		
	</form>
</body>
</html>