<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Update</title>

<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		//alert("sfsdf");
		$("#form").validate({
			debug : false,

			rules : {
				content : "required"

			},

			messages : {
				content : "Please enter a content."

			}
		});
	});
</script>

<style type="text/css">


h1,h2 {
	text-align: center;
}

form input.error, #form textarea.error {
	border: 1px dashed red;
}

#modify {
	background-color: white;
	font-size: 24px;
	color: skyblue;
	display: inline-block;
	border: 1px solid skyblue;
	padding: 5px;
	cursor: pointer;
	float: right;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#write:hover {
	background-color: skyblue;
	color: white;
}

body {
	width: 1200px;
	height: 600px;
	margin: 0 auto;
	border: 1px;
}

.all {
	width: 800px;
	padding: 50px;
	margin: auto;
	width: 50%;
	background-color: WHITE;
	overflow:auto;
}

.tb{
 width: 500px;
  margin: auto;
}

td{
	 float: left;
}
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
img{display:inline}

</style>
</head>
<body>

<div id = "a" >
  <a href='index.jsp'><img id="b" src="img/airlogo.jpg"></a>
  
  	<c:choose>
  		<c:when test="${account !=null || admin != null}">
			
			
			
			<p style="text-align:right" id = 'abbd' >Welcome ${account.id}</p>
			
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

	<h1>AIR Q&A</h1>
		<h2>MODIFY</h2>
	<div class="all">
		<form action="q_update?no=${q.no }" method="post" id="form" name="form">
	<table class="tb">
	
					<tr>
					<th>NO</th>
					<td><input type="text" id="no" name="no" value="${q.no}" readonly/></td>
						
				</tr>
				
				<tr>
					<th>WRITER</th>
					<td><input type="text" id="writer" name="writer" value="${q.id }"
						maxlength="10" readonly></td>
				</tr>

				<tr>
					<th>SUBJECT</th>

					<td><input type="text" id="subject" name="subject" value="${q.subject }" style="width: 345px" 
						maxlength="40" readonly></td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td><textarea id="content" name="content" value=""
							style="width: 345px; height: 300px">${q.content }</textarea>
							<input type="submit" value="MODIFY" id="modify" > <br /></td>
					</tr>
			</table>
			</form>
	</div>
</body>
</html>