<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style type="text/css">
    body {
	   margin: 3em;
    }
</style>
<body>
<% 
String etunimi = request.getParameter("etunimi");
String sukunimi = request.getParameter("sukunimi");
String sposti = request.getParameter("sposti");
String puhelin = request.getParameter("puhelin");
String vuosiStr = request.getParameter("vuosi");
int vuosiNyt = Calendar.getInstance().get(Calendar.YEAR);
int ika = vuosiNyt - Integer.parseInt(vuosiStr);


if (ika >= 18) {
	out.print("Etunimi: " + etunimi + "\nSukunimi: " + sukunimi + "\nS�hk�posti: " + sposti +
			"\nPuhelin: " + puhelin + "\nIk�: " + ika);
} else {
	out.print("Alaik�inen");
	response.setHeader("Refresh", "5; URL=kysy.jsp");
}

%>

</body>
</html>