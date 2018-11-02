<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User Registration</title>
	<script type="text/javascript">
		function validate(){
			var password=document.getElementById("password").value;
			var repassword=document.getElementById("repassword").value;
			if(password!=repassword){
				alert("Password do not match.");
				return false;
			}
			return true;
		}	
	</script>
</head>
<body bgcolor="#FFB6C1">
<center><h2>New User Registration</h2></center>
<center><form action="RegistrationServlet" method="post">
		<table style="cellpadding :50px" width="400" height=400>
			<tr>
				<td>Name:</td>
				<td><input type=text name='username' placeholder='username' required></td>
			</tr>
			<tr>
				<td>Register as a :</td>
				<td><input type='radio' name='category' value='Trainer'>Trainer</td>
				<td><input type='radio' name='category' value='Trainee'>Trainee</td>
			</tr>
			
			<tr >
				<td>Technology:</td>
				<td ><input type='radio' name='technology' value='BAS'>BAS</td>
				<td><input type='radio' name='technology' value='MIS'>MIS</td>
			</tr>

			<tr>
				<td>Password:</td>
				<td><input type=password id="password" name='password' placeholder='password' required></td>
			</tr>

			<tr>
				<td>Retype Password:</td>
				<td><input type=password name='repassword' id="repassword" placeholder='Retype password' required></td>
			</tr>
			<tr>
						<td><input type=submit value="Register" onclick="return validate()"></td>
						<td><input type=reset value="Reset"></td>
			</tr>			
		</table>
	</form>
	</center>
</body>
</html>