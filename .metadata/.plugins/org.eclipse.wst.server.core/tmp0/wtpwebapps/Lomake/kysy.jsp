<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style type="text/css">
    label {
	   display: block;
	   width: 7em;
	   float: left;
    } 
    .submit {
    	margin-left: 6em;
    	margin-top: 1em;
    }
    form {
    	margin: 3em;
    }
</style>
<body>
<form action="nayta.jsp" method="POST">
	<label>Etunimi:</label> 
	<input type="text" name="etunimi"><br>
	<label>Sukunimi:</label> 
	<input type="text" name="sukunimi"><br>
	<label>S�hk�posti:</label> 
	<input type="text" name="sposti"><br>
	<label>Puhelin:</label> 
	<input type="text" name="puhelin"><br>
	<label>Syntym�vuosi:</label> 
	<input type="text" name="vuosi"><br>
	<input class="submit" type="submit" value="L�het�">
</form>
</body>
</html>