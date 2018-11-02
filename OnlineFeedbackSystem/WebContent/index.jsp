<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Feedback System</title>
<style>
@CHARSET "ISO-8859-1";

<
style>h2 {
	color: white;
	text-shadow: 2px 2px 8px #FFFFFF;
}

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 8px;
	box-sizing: border-box;
}

input[type=password], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 8px;
	box-sizing: border-box;
}

input[type=submit] {
	background-color: #f13030;
	color: white;
	padding: 14px 60px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=reset] {
	background-color: #f13030;
	color: white;
	padding: 14px 60px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

div {
	width: 800px;
	border-radius: 10px;
	background-color: #f6e8ea;
	padding: 10px;
	box-shadow: 10px 10px 5px grey;
}
</style>
</head>
<body bgcolor='#FFB6C1'>
	<center>
		<h2>Online Feedback System</h2>
	</center>
	<center>
		<div>
			<form method="post" action="LoginServlet">
				<table cellspacing='10' cellpadding='5'>
					<tr>
						<td>Enter User Name</td>
						<td><input type=text name="username" placeholder="UserName" autofocus required="Enter Username Only"></td>
					</tr>
					<tr>
						<td>Enter Password</td>
						<td><input type="password" name="password" placeholder="Password" required="Enter Username Only"></td>
					</tr>
					<tr>
						<td>I'm a</td>
						<td><select name = "category">
								<option  value="admin">Administrator</option>
								<option  value="trainee">Trainee</option>
								<option  value="trainer">Trainer</option>
						</select></td>
					</tr>

					<tr>
						<td><input type=submit value="Login"></td>
						<td><input type=reset value="Reset"></td>
					</tr>
					<tr>
					<td><a href="NewUser.jsp">Don't Have an Account? Sign up!</a> </td>
					<td><a href="forgotPassword.jsp">Forgot Password!</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</center>
</body>
</html>