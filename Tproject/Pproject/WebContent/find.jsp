<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>find id</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<style type="text/css">
#find{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: white;
            padding: 5px;
            background-color: skyblue;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
		}
		body {
  			text-align: center;
		}
		#font {font-size: 70px;}
		#emailerror{font-size:25px;} 
</style>
<script type = "text/javascript">
$(function (){
	$("#findid").validate({
		debug : false,		
		rules:{
			email : "required"
		},
		messages:{
			email : "Email is required."			
		}
	});
});
$(function (){
	$("#findid").validate({
		debug : false,		
		rules:{
			email : "required"
		},
		messages:{
			email : "Email is required."			
		},
	});
});
</script>
</head>
<body>
<a href='index.jsp'><img id="b" src="img/airlogo.jpg" style="float: left"></a>
  <br/>
  <br/>
  <br/>
  
<p id="font">FIND ID</P>
<form method="post" action="find" id="findid">
<input type="text" id="mailcheck" name="email" style="width:345px; height:45px;" placeholder="Email"/><br />
<label class="error" for="mailcheck" generated="true" style="display:none;" id="emailerror"></label><br />
<input type="submit" value="find" id="find" style="height:50px; width:350px;" /><br />
</form><br />
<p id="emailerror">${id}</p>
<p id="emailerror">${account.id}</p>
<c:if test="${account.id!=null}">
<input type="button" value="login" id="find" style="height:50px; width:350px;" onclick="location.href='login.jsp'" />
</c:if>
</body>
</html>