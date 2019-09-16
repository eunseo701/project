<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>sign up</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<style type="text/css">
		#checkid{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
			height:50px;
			width:100px;
			position: relative;
			left: 52.5px;
		}
		#checkid:hover{
			background-color: skyblue;
			color:white;
		}
		#checkemail{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
			height:50px;
			width:100px;
			position: relative;
			left: 52.5px;
		}
		
		#checkemail:hover{
			background-color: skyblue;
			color:white;
		}
		#jointest{
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
		#error{font-size: 25px;} 	
	</style>

<script type = "text/javascript">

$(function (){
	$("#singupForm").validate({
		debug : false,
		
		rules:{
				inputid : "required",
				
				inputpassword : {
					required : true,
					minlength : 6,
					maxlength : 15
				},
				repwd : {
					required : true,
					equalTo : "#pwd"
				},
				inputemail : {
					required : true,
					email : true
				}
		},
		messages:{
			inputid : "ID is required.",
			
			inputpassword : {
				required : "password is required",
				minlength :"Passwords minimum of {0}characters long.",
				maxlength :"Passwords maximum of {0}characters long."
			},
			repwd : {
				required : "password check is required",
				equalTo : "please check a repassword"
			},
			inputemail :{
				required : "email is required",
				email : "please check a email"
			}
		}
	});
});
var idck=0;
var idch1=0;
$(function(){
	$("#checkid").click(function(){	
		var input_val = $("#id").val();		
	if(!input_val){
		alert("Please enter your ID.");
		return false;
	}	
	var url = "idcheck";
	$.get(url, {"inputid":input_val},function(xml){
		var result = $(xml).find("result").text();
		var count = $(xml).find("count").text();
		$(".console").html(result);			
		if(count>0){
			idck = 0;
			idck1 = document.getElementById("id").value;
			return false;
		}else{
			idck=1;
			idck1 = document.getElementById("id").value;
			return true;
		}
		});	
	
	});
});
var emailck=0;
var emailch1 = 0;
$(function(){	
	$("#checkemail").click(function(){		
		var input_val = $("#email").val();
	if(!input_val){
		alert("Please enter e-mail.");
		return false;
	}
	var url = "emailcheck";
	$.get(url, {"inputemail":input_val},function(xml){
		var result = $(xml).find("result").text();
		var count = $(xml).find("count").text();
		$(".console1").html(result);
		if(count>0){
			emailck = 0;
			emailck1 = document.getElementById("email").value;
			return false;
		}else{
			emailck=1;
			emailck1 = document.getElementById("email").value;
			return true;
		}
		});
	});		
});

function noSpaceForm(obj) {
    var str_space = /\s/;
    if(str_space.exec(obj.value)) {
        alert("Spaces cannot be used.\n\nSpaces are automatically deleted.");
        obj.focus();
        obj.value = obj.value.replace(' ','');
        return false;
    }
}
$(function(){
	$("#jointest").click(function(){
	var result = confirm("Would you like to sign up?");
	if( result == true ){
		if(idck==0||emailck ==0 || emailck1 != document.getElementById("email").value || idck1 != document.getElementById("id").value){
			alert("please double-check the ID or Email");
	        return false;
		}
		
		else if (idck==1||emailck ==1 ){
			"#singupForm"
		}
	   }else if( result == false ){

	      alert("cancel!");
		return false;
	   }
	
	});
});

function mykeydown() {
	var input_val = $("#id").val();		
	idck=0;
	var url = "text";
	$.get(url, {"inputid":input_val},function(xml){
		var result = $(xml).find("text").text();
		$(".console").html(result);
	});
}

function mykeydown1() {
	var input_val = $("#email").val();		
	emailck=0;
	var url = "text";
	$.get(url, {"inputemail":input_val},function(xml){
		var result = $(xml).find("text").text();
		$(".console1").html(result);
	});
}
</script>
</head>
<body>
<a href='index.jsp'><img id="b" src="img/airlogo.jpg" style="float: left"></a>
  <br/>
  <br/>
  <br/>
<p id="font">SIGN UP</P>
<form method="post" action="join" id="singupForm" name="form">
<input type="text" placeholder="Input ID" name="inputid" id="id" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" onkeydown="mykeydown()" style="width:345px; height:45px; position: relative; left: 52.5px;" />
<input type="button" id="checkid" value="ID check" name="idcheck" style="vertical-align: bottom;" /><br />
<div style="display:inline" class="console" id="error" ></div>
<label class="error" for="id" generated="true" style="display:none;" id="error"></label><br />
<input type="password" placeholder="Input Password" name="inputpassword" id="pwd" style="width:345px; height:45px;" /><br />
<label class="error" for="pwd" generated="true" style="display:none;" id="error"></label><br />
<input type="password" placeholder="Input Re Password" name="repwd" id="pwdre" style="width:345px; height:45px;" /><br />
<label class="error" for="pwdre" generated="true" style="display:none;" id="error"></label><br />
<input type="email" placeholder="Input Email" name="inputemail" id="email" style="width:345px; height:45px; position: relative; left: 52.5px;" onkeydown="mykeydown1()"/>
<input type="button" id="checkemail" value="Email Check" style="vertical-align: bottom;" /><br />
<label class="error" for="email" generated="true" style="display:none;" id="error"></label>
<div class="console1" id="error"></div>
<br />
<input type="submit" value="join" id="jointest" style="height:50px; width:350px;" />
<input type="hidden" id="checkemail" value="${idcheck}" />
</form>
</body>
</html>