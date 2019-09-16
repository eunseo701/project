<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>detail check</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
#check{
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
		#checker{font-size : 25px;}
		body{
			text-align : center;
		}
		#detail{font-size : 70px;}
		#pwderror{font-size : 25px;}
		ul.a{
	list-style-type : none;
}
li{
	list-style-type : none;
	display:inline;
	
}
p{
text-align:left;
display:inline;
}
#a{
  font-size: 150%;
}

#abbd{display:inline;
text-align:right;
align:right;
}
#abbd{text-align:right}
img{display:inline}

</style>
<script type = "text/javascript">
$(function (){
	$("#detailchecker").validate({
		debug : false,		
		rules:{
			checkpassword : "required"
		},
		messages:{
			checkpassword : "Password is required."			
		}
	});
});
</script>
</head>
<body>
<div id = "a" >
  <a href='index.jsp'><img id="b" src="img/airlogo.jpg" style="float: left"></a>
  
  	<c:choose>
  		<c:when test="${account !=null || admin != null}">
			
			
			
			<p style="float: left">Welcome ${account.id}</p>
			
			<form action="mybook" style="float: right" method = "post" id = 'abbd'>
			<input type = 'hidden' id = 'accountid' name = 'accountid' value = "${account.id}" />
			<input type = "submit" style="float: right" id = 'mybook' class="btn btn-primary" value = "Mybook"/>
			</form>
			<div style="text-align:right" id = 'abbd' >
			<input type = "button" style="float: right" onclick="location.href='Withdrawalcheck.jsp'" class="btn btn-primary" value = "detail"/>
			</div>
			<button type="button" style="float: right" class="btn btn-primary" onclick="location.href='q_req_list.do?reqPage=1'">QnA</button>
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
  	<c:if test = "${account !=null && admin != null}">
  	<form action = 'adminbooklist.admin' id = 'abbd'>
 			<input type = "submit" class="btn btn-primary" value = "admin" style="float: right"/>
 			</form>
  	</c:if>
  </div>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
<form method="post" action="Withdrawal" id="detailchecker">
<input type="hidden" value="${account.id}" name="checkid" />
<p id="detail">DETAIL CHECK</p><br/>
<p id="checker">your id is : ${account.id}</p><br/><br/>
<input type="password" name="checkpassword" placeholder="Input Password" style="width:345px; height:45px;" id="pwd"><br />
<label class="error" for="pwd" generated="true" style="display:none;" id="pwderror"></label><br />
<input type="submit" value="check" style="height:50px; width:350px;" id="check"/><br />
</form>
<p id="checker">${message}</p>
</body>
</html>