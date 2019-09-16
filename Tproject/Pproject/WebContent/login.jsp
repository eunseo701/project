<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<style type="text/css">
		#sign{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
		}
		#sign:hover{
			background-color: skyblue;
			color:white;
		}
		#find{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
		}
		#find:hover{
			background-color: skyblue;
			color:white;
		}
		#findpwd{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
		}
		#findpwd:hover{
			background-color: skyblue;
			color:white;
		}
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
		
		body {
  			text-align: center;
		}
		#font {font-size: 70px;} 
		#pwderror {font-size : 25px;}	
		 
ul.a{
	list-style-type : none;
}
li{
	list-style-type : none;
	display:inline;
	
}
p{
text-align:right;
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
#b{align:left}
	</style>
<script type = "text/javascript">
$(function (){
	$("#loginchecker").validate({
		debug : false,		
		rules:{
			id : "required",
			password : "required"
		},
		messages:{
			id : "ID is required.",
			password :"Password is required."
		}
	});
});

$(function(){	
	$("#check").click(function(){		
		var input_val = $("#idcheck").val();
		var input = $("#passwordcheck").val();
		var url = "login";
	$.get(url, {"id":input_val, "password":input},function(xml){
		var result = $(xml).find("result").text();
		if(!result){		
		}else{
			alert("login fail");
			location.href = "login.jsp";
			return false;
		}
		});
	});		
});
</script>
</head>
<body>

  <a href='index.jsp'><img id="b" src="img/airlogo.jpg" style="float: left"></a>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
	<p id="font">AIR LINE</p>
	<form action="login" method ="post" id="loginchecker">
		<input type="text" placeholder="ID" name="id" id="idcheck"  style="width:345px; height:45px;"><br />
		<label class="error" for="idcheck" generated="true" style="display:none;" id="pwderror"></label><br />
		<input type="password" placeholder="Password" name="password" id="passwordcheck" style="width:345px; height:45px;"><br />
		<label class="error" for="passwordcheck" generated="true" style="display:none;" id="pwderror"></label><br />
		<input type="submit" id="check" value="login"  style="height:50px; width:350px;"><br />
	</form>
	
	<br />
	<button onclick="location.href='find.jsp'" id="find">find id</button>
	<button onclick="location.href='findpwd.jsp'" id="findpwd">find password</button>
	<button onclick="location.href='signup.jsp'" id="sign">sign up</button>
</body>
</html>