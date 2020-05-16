<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Asiakkaat</title>
</head>
<body>
<table id="listaus">
	<thead>	
		<tr>
			<th colspan="4" id="ilmo"></th>
			<th><a id="uusiAsiakas" href="lisaaasiakas.jsp">Lisää uusi asiakas</a></th>
		</tr>
		<tr>
			<th>Hakusana:</th>
			<th colspan="3"><input type="text" id="hakusana"></th>
			<th class="nappi"><input type="button" value="HAE" id="hakunappi" onclick="haeAsiakkaat()"></th>
		</tr>						
		<tr>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sähköposti</th>	
			<th>&nbsp;</th>				
		</tr>
	</thead>
	<tbody id="tbody">
	</tbody>
</table>
<script>
haeAsiakkaat();
document.getElementById("hakusana").focus();

function tutkiKey(event) {
	if (event.keyCode==13) {
		haeAsiakkaat();
	}
}	
	
function haeAsiakkaat() {
	document.getElementById("tbody").innerHTML = "";
	fetch("asiakkaat/" + document.getElementById("hakusana").value,
	{ 
		method: 'GET' 
		})
	.then(function(response) {
		return response.json()
	})
	.then(function(responseJson) {
		var asiakkaat = responseJson.asiakkaat;
		var htmlStr = "";
		for (var i = 0; i < asiakkaat.length; i++) {
			htmlStr+="<tr>"
    		htmlStr+="<td>"+asiakkaat[i].etunimi+"</td>";
    		htmlStr+="<td>"+asiakkaat[i].sukunimi+"</td>";
    		htmlStr+="<td>"+asiakkaat[i].puhelin+"</td>";
    		htmlStr+="<td>"+asiakkaat[i].sposti+"</td>";
    		htmlStr+="<td><a href='muutaasiakas.jsp?asiakas_id="+asiakkaat[i].asiakas_id+"'>Muuta</a>&nbsp;";
    		htmlStr+="<span class='poista' onclick=poista('"+asiakkaat[i].asiakas_id+"','"+asiakkaat[i].etunimi+"','"+asiakkaat[i].sukunimi+"')>Poista</span></td>"; 
    		htmlStr+="</tr>";
		}
		document.getElementById("tbody").innerHTML = htmlStr;
     });	
};

function poista(asiakas_id, etunimi, sukunimi){
	if(confirm("Poista asiakas " + etunimi + " " + sukunimi + "?")){	
		fetch("asiakkaat/"+ asiakas_id,{//Lähetetään kutsu backendiin
		      method: 'DELETE'		      	      
		    })
		.then(function (response) {//Odotetaan vastausta ja muutetaan JSON-vastaus objektiksi
			return response.json()
		})
		.then(function (responseJson) {//Otetaan vastaan objekti responseJson-parametrissä		
			var vastaus = responseJson.response;		
			if(vastaus==0){
				document.getElementById("ilmo").innerHTML= "Asiakkaan poisto epäonnistui.";
	        }else if(vastaus==1){	        	
	        	document.getElementById("ilmo").innerHTML="Asiakkaan " + etunimi + " " + sukunimi + " poisto onnistui.";
				haeAsiakkaat();        	
			}	
			setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 5000);
		})		
	}	
}

</script>
</body>
</html>