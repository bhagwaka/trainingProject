<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IThank you page</title>
</head>
<body bgcolor="#FFB6C1">

 <br><h1 align="center">Thank you For submitting Feedback!!!</h1>
	<form  action="LogoutServlet" method="get">
		<input type="submit" value="logout">
	</form>
User: ${USERNAME}
</body>
</html>