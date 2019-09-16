<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>sign up check</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
</head>
	<style type="text/css">
		#text {font-size:25px;}
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
		}
		#checkid:hover{
			background-color: skyblue;
			color:white;
		}
		#checkid1{
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
		}
		#checkid1:hover{
			background-color: skyblue;
			color:white;
		}
		body {
  			text-align: center;
		}
	</style>
<body>
<p id="text">Congratulations on your membership.</p>
<button onclick="location.href='login.jsp'" id="checkid" >login</button>
<button onclick="location.href='index.jsp'" id="checkid1" >Home</button>
</body>
</html>