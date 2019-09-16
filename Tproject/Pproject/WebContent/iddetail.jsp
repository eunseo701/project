<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>id detail</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<style type="text/css">
#detail{font-size:70px;}
#text{font-size:25px;}
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
#delete{
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
		#error{
			font-size: 25px;
		}
</style>
<script type = "text/javascript">
$(function (){
	$("#detailForm").validate({
		debug : false,
		
		rules:{
				inputpassword : {
					required : true,
					minlength : 6,
					maxlength : 15
				},
				repwd : {
					equalTo : "#pwd"
				},
				inputemail : {
					required : true,
					email : true
				}
		},
		messages:{
				inputpassword : {
				required : "password is required",
				minlength :"Passwords minimum of {0}characters long.",
				maxlength :"Passwords maximum of {0}characters long."
			},
				repwd : {
				equalTo : "please check a repassword"
			},
			inputemail :{
				required : "email is required",
				email : "please check a email"
			}
		}
	});
});
var emailck=0;
var emailch1 = 0;
$(function(){	
	$("#checkemail").click(function(){		
		var input_val = $("#email").val();
		var id = "${account.id}";
	if(!input_val){
		alert("Please enter e-mail.");
		return false;
	}
	var url = "emailcheckdetail";
	$.get(url, {"inputemail":input_val , "id" : id },function(xml){
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
$(function(){
	$("#jointest").click(function(){
	var result = confirm("Would you like change?");
	if( result == true ){
		if(emailck ==0 ){
			alert("please double-check the Email");
	        return false;
		}		
		else if (emailck ==1 ){
			alert("Change on your Information.");
		}
	   }else if( result == false ){
	      alert("cancel!");
		return false;
	   }	
	});
});
$(function(){
	$("#delete").click(function(){
	var result = confirm("Are you sure you're leaving?");
	if(result){
		location.href = "delete?id=${account.id}";
	}else{
		return;
	}	
	});
});

function mykeydown1() {
	var input_val = $("#email").val();		
	emailck=0;
	var url = "text";
	$.get(url, {"inputemail":input_val},function(xml){
		var result = $(xml).find("text").text();
		$(".console1").html(result);
	});
}



function emailcheck(str) {

    
}

</script>
</head>
<body>
<form method="post" action="detail" id="detailForm">
<input type="hidden" value="${account.id}" name="id"/>
<p id="detail">DETAIL</p>
<p id="text">ID : ${account.id}</p>
<input type="password" placeholder="Input Password" name="inputpassword" id="pwd" value="${account.pwd}" style="width:345px; height:45px;" ><br />
<label class="error" for="pwd" generated="true" style="display:none;" id="error"></label><br />
<input type="password" placeholder="Input Re Password" name="repwd" value="${account.pwd}" id="pwdre" style="width:345px; height:45px;" ><br />
<label class="error" for="pwdre" generated="true" style="display:none;" id="error"></label><br />
<input type="email" placeholder="Input Email" name="inputemail" id="email" value="${account.email}" style="width:345px; height:45px;position: relative; left: 52.5px;" onkeydown="mykeydown1()">
<input type="button" id="checkemail" value="Email Check" style="vertical-align: bottom;" /><br /><br />
<label class="error" for="email" generated="true" style="display:none;" id="error"></label>
<div class="console1" id="error"></div>
<input type="submit" value="submit" id="jointest" style="height:50px; width:350px;" />
<input type="hidden" value="${account.id}" />
<br />
<c:if test="${account.id != 'kpoiqq'}">
<hr />
</c:if>
<c:if test="${account.id != 'kpoiqq'}">
<p id="text">Your ID is : ${account.id}</p>
<p id="text">Would you like to leave?</p>
<button type="button" id="delete" style="height:50px; width:350px;">delete</button>
</c:if>
</form>
</body>
</html>