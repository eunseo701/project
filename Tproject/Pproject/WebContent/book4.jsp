<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
#abbd{display:inline;
text-align:right;
align:right;
}
#abbd{text-align:right}
img{display:inline}
#b{
  font-size: 150%;
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
<title>Admin Detail</title>
</head>
<body>
<div id = "b" >
  <a href='index.jsp'><img id="b" src="img/airlogo.jpg"></a>
  
  	<c:choose>
  		<c:when test="${account !=null}">
			
			
			
			
			
			<form action="mybook" style="float: right" method = "post" id = 'abbd'>
			<input type = 'hidden' id = 'accountid' name = 'accountid' value = "${account.id}" />
			<input type = "submit" style="float: right" id = 'mybook' class="btn btn-primary" value = "Mybook"/>
			</form>
			<div style="text-align:right" id = 'abbd'>
			<input type = "button" style="float: right" onclick="location.href='iddetail.jsp'" class="btn btn-primary" value = "detail"/>
			</div>
			<div style="text-align:right" id = 'abbd' >
			<input type = "button" style="float: right" onclick="location.href='Withdrawalcheck.jsp'" class="btn btn-primary" value = "Withdrawal"/>
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
  <hr/>
	<form action = "book_delete" method = "post" style="text-align:center">
	<input type = "hidden" id = "book_1bno" name = 'book_1bno' value = "${book.bno}" />
	<input type = "text" id = "book_bno" value = "${book.bno}" disabled = 'disabled' /><br/>
	<input type = "text" id = "book_id" value = "${book.id}" disabled = 'disabled'/><br/>
	<input type = "text" id = "book_day" value = "${book.day}" disabled = 'disabled'/><br/>
	<input type = "text" id = "book_pay" value = "${book.pay}" disabled = 'disabled'/><br/>
	<input type = "text" id = "book_sno" value = "${book.sno}" disabled = 'disabled'/><br/>
	<input type = "text" id = "book_seat" value = "${book.seat}" disabled = 'disabled'/><br/>
	
	<input type = "submit" id = "submit" value = "Delete" class="btn btn-primary"/>
	</form>
</body>
</html>