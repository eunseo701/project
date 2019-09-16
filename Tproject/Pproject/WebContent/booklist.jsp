<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>My Book List</title>
<meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
<style>
#abbd{display:inline;
text-align:center;
align:right;
}
#abbd{text-align:right}
img{display:inline}
#a {
  border: 1px solid black;
  padding-top: 10px;
  padding-right: 10px;
  padding-bottom: 10px;
  padding-left: 10px;
  width: 90%;
  margin-left: 100px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;
}
#b{
  font-size: 150%;
}

.all {
	overflow:auto;
  
}

h1 {
	text-align: center;
}
h3{
	text-align: center;	
}

table{
	width:100%;
	margine:0 auto;
	

}

thead{
	font-weight: bold;
	text-align: center;	
	border-bottom: 10px solid #EEEEEE;
 	background-color: skyblue;
}


tbody{
	padding: 8px;
	border-bottom: 1px solid #ddd;
	text-align: center;	
}

td {
  height: 40px;
}
#write {
	background-color: skyblue;
	font-size: 24px;
	color: white;
	display: inline-block;
	border: 1px solid white;
	padding: 5px;
	cursor: pointer;
	float: right;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}


#title{
	cursor: pointer underline;
}


</style>
<meta charset="utf-8">

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
<div id = "b">
  <a href='index.jsp'><img id="b" src="img/airlogo.jpg"></a>

  	<c:choose>
  		<c:when test="${account !=null}">
			
			
			
			<p style="text-align:right" id = 'abbd' >Welcome ${account.id}</p>
			
			<form action="mybook" style="float: right" method = "post" id = 'abbd'>
			<input type = 'hidden' id = 'accountid' name = 'accountid' value = "${account.id}" />
			<input type = "submit" style="float: right" id = 'mybook' class="btn btn-primary" value = "Mybook"/>
			</form>
			<div style="text-align:right" id = 'abbd' >
			<input type = "button" style="float: right" onclick="location.href='Withdrawalcheck.jsp'" class="btn btn-primary" value = "detail"/>
			</div>
			<form action="logout" style="float:right" method = "post" id='abbd'>
			<input type = 'submit' style="float: right" class='btn btn-primary' value = 'logout'>
			</form>
			
  		</c:when>
  		
  		<c:otherwise>
  			<form action = 'login_input' id = 'abbd'>
 			<input type = "submit" class="btn btn-primary" value = "login" style="float: right"/>
 			</form>
  		</c:otherwise>
  	</c:choose>
  	
  </div>
  <div  class="all" >
  <table class="title">
				<colgroup>
				<col style="width:15%">
				<col style="width:15%">
				<col style="width:15%">
				<col style="width:15%">
				<col style="width:15%">
				<col style="width:25%">
				</colgroup>
				<thead>
				<tr>
					<td scope="col">Depart</td>
					<td scope="col">Arrive</td>
					<td scope="col">Date</td>
					<td scope="col">Price</td>
					<td scope="col">Reservation no</td>
					<td scope="col">Seat no</td>
				</tr>
				</thead>
				
  
  <c:forEach var="booklist" items="${list}">
  <tbody>
  <tr>
  <c:if test = "${booklist.depa eq 'ICN'}">
  <td>INCHEON</td>
  </c:if>
  <c:if test = "${booklist.depa eq 'NRT'}">
  <td>NARITA</td>
  </c:if>
  <c:if test = "${booklist.depa eq 'KIX'}">
  <td>KANSAI</td>
  </c:if>
  <c:if test = "${booklist.depa eq 'CJU'}">
  <td>JEJU</td>
  </c:if>
  <c:if test = "${booklist.depa eq 'HKQ'}">
  <td>HONGKONG</td>
  </c:if>
  
  <c:if test = "${booklist.arva eq 'ICN'}">
  <td>INCHEON</td>
  </c:if>
  <c:if test = "${booklist.arva eq 'NRT'}">
  <td>NARITA</td>
  </c:if>
  <c:if test = "${booklist.arva eq 'KIX'}">
  <td>KANSAI</td>
  </c:if>
  <c:if test = "${booklist.arva eq 'CJU'}">
  <td>JEJU</td>
  </c:if>
  <c:if test = "${booklist.arva eq 'HKG'}">
  <td>HONGKONG</td>
  </c:if>
					

					<td>${booklist.day}</td>
					<td>${booklist.pay}</td>
					<td>${booklist.bno}</td>
					<td>${booklist.seat}</td>
				</tr>
			</tbody>	
				
  </c:forEach>
  </table>
				</div>
				<br/>
			<div id='a' style="text-align:center">
			Important Information
<li> Passengers should arrive at the airport at least 2 hours before departure to ensure they have enough
time to check in.<br/> During various procedures in the airport, passengers must provide the valid ID used to
purchase their ticket.<br/> Their boarding pass or itinerary may also be required.</li>
<li> Please note that tickets must be used in the sequence set out in the itinerary, otherwise airlines
reserve the right to refuse carriage.<br/> Trip.com bears no responsibility if passengers are unable to board a
plane due to not complying with airline policies and regulations.</li>

</div>
<br/>
<form action = 'index.jsp' style="text-align:center">
			<input type = "submit" value = "home" class="btn btn-primary">
			</form>
</body>
</html>