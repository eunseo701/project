<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Find pwd</title>
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
		#pwderror{font-size: 25px;}
</style>
<script type = "text/javascript">
$(function (){
	$("#findpwd").validate({
		debug : false,		
		rules:{
			email : "required",
			id : "required"
		},
		messages:{
			email : "Email is required.",
			id : "ID is required"
		}
	});
});
</script>
</head>
<body>
<a href='index.jsp'><img id="b" src="img/airlogo.jpg" style="float: left"></a>
  <br/>
  <br/>
  <br/>
<p id="font">FIND PASSWORD</P>
<form method="post" action="findpwd" id="findpwd">
<input type="text" name="id" style="width:345px; height:45px;" placeholder="ID" id="pwdid"/><br />
<label class="error" for="pwdid" generated="true" style="display:none;" id="pwderror"></label><br />
<input type="text" name="email" style="width:345px; height:45px;" placeholder="Email" id="pwdemail"/><br />
<label class="error" for="pwdemail" generated="true" style="display:none;" id="pwderror"></label><br />
<input type="submit" value="find" id="find" style="height:50px; width:350px;" /><br /><br />
</form>
<p id="pwderror">${account.pwd}</p>
<p id="pwderror">${id}</p>
<c:if test="${account.pwd!=null}">
<input type="button" value="login" id="find" style="height:50px; width:350px;" onclick="location.href='login.jsp'" />
</c:if>
</body>
</html>