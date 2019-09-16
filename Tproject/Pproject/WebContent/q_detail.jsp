<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>AIR Q&A</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script type="text/javascript">




$(function(){
	$("#delete").click(function(){
	var result = confirm("${q.no }번 게시글을 삭제하시겠습니까?");
	if(result){
		location.href = "q_delete?no=${q.no }";
	}else{
		return;
	}
	
	
	});
});

$(function(){
	//alert("sfsdf");
	$("#form").validate({
		debug : false,
		
		rules:{
			content : "required"
		
			},
			
		messages:{
			content : "required"
					
		}	
	});
});



 $(function(){
	$("#modify").click(function(){
	var result = confirm("${q.no }번 게시글을 수정하시겠습니까?");
	var con = document.form1.content;
	
	if(result){
		
	}else{
		return false;
	}/* ,
	
	if(con==null){
		alert("입력 부탁");
		return false;
	} */
	
	});
}); 
	
 /* $(function(){
		$("#modify").click(function(){
		var con = document.modify;
		
		if(con == null){
			alert("입력 부탁");
			return false;
		}
		});
	});  */
 
 $(function(){
		$("#write").click(function(){
			location.href = "q_form.jsp";
		});
	});
	
</script>


<style type="text/css">

h1,h2 {
	text-align: center;
}
#all{
	margin:auto;
}
#write {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
 
}
#write:hover{
	background-color: skyblue;
	color: white;
}

#delete {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;

}
#delete:hover{
	background-color: skyblue;
	color: white;
}
#reply {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;

}
#reply:hover{
	background-color: skyblue;
	color: white;
}

#modify {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;

}
#modify:hover{
	background-color: skyblue;
	color: white;
}

#bl {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;

}
#bl:hover{
	background-color: skyblue;
	color: white;
	text-align:center;
}

tr.sub{
	font-weight: bold;
	background-color: skyblue;
	
}

body {
	width: 800px;
	margin: auto;
	border: 1px;
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
#ab {
  border: 1px solid black;
  padding-top: 10px;
  padding-right: 10px;
  padding-bottom: 30px;
  padding-left: 10px;
  width: 90%;
  margin-left: 100px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;
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
	<h2>DETAIL</h2>
	<div class="all">
	
	<form action="q_modify?no=${q.no}" method="post" id="form" name="form"  style="margin:auto">
	<c:if test = "${account.id == q.id }">
	<table class="tb">
	
	
	
					<tr>
					<th>NO</th>
					<td><input type="text" id="no" name="no" value="${q.no}" readonly></td>
						
				</tr>
				
				<tr>
					<th>WRITER</th>
					<td><input type="text" id="writer" name="writer" value="${q.id}" maxlength="100" readonly></td>
				</tr>

				<tr>
					<th>SUBJECT</th>

					<td><input type="text" id="subject" name="subject" value="${q.subject}" style="width: 345px" 
						maxlength="40" readonly></td>
				</tr>
				
				<tr>
					<th>CONTENT</th>
					<td><textarea id="content" name="content" style="width: 345px; height: 300px" readonly>${q.content }</textarea>
							</td>
					</tr>
					
			</table>
			<div style="float:right">
			<input type="submit" value="MODIFY" id="modify" style="display:inline"> 
			<input type="button" id="delete"  value="DELETE">
					
			</div>
			</c:if>
		</form>	
		
		<c:if test = "${account.id != q.id }">
		<table class="tb">
			<tr>
					<th>NO</th>
					<td>${q.no}</td>
						
				</tr>
				
				<tr>
					<th>WRITER</th>
					<td>${q.id}</td>
				</tr>

				<tr>
					<th>SUBJECT</th>

					<td>${q.subject}</td>
				</tr>
				
				<tr>
					<th>CONTENT</th>
					<td><textarea id="content" name="content" style="width: 640px; height: 300px" readonly>${q.content }</textarea>
							 </td>
					</tr>
					
			</table>
			<div style="float:right">
			
			
			</div>
			</c:if>
		
	<c:if test="${q.lvl == 0}">
	
	</c:if>
	<button type="button" onclick="history.back()" id="bl" style="float:right">BACK TO LIST</button>
	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<div style="text-align:center">
<div id='ab' style="text-align:center">
	
  Reply
	
	<form style="text-align:center" action = "reqna_input.do" method = "post">
	<br/>comment<br/><input type = "text" id='reqnacon' name = 'reqnacon'><br/>
	writers<br/><input type = "text" id = 'reqwriter' name = 'reqwriter' value='${account.id}' readonly/><br/>
	<input type = "submit" id="write" name="write" value = "submit" />
	<input type="hidden" id="num" name="num" value="${q.no}" readonly></td>
	</form>
	</div>
	
	</div>
	
	<br/>
	<div style="text-align:center">
<div id='ab' style="text-align:center">
  comment
	<c:forEach var="qlist" items="${qa}">
	<form style="text-align:center" action = "reqna_update?num=${qlist.num}" method = "post">
	<td>writer : ${qlist.writer} date : ${qlist.wdate} </td>
	<input type="hidden" id="num1" name="num1" value="${qlist.num}" readonly>
	
	
	<c:if test="${account.id == qlist.writer}">
	<input type="submit" id="update" value="Update" class="btn btn-primary"><input type="button" onclick="location.href='reqna_delete?num=${qlist.num}'" class="btn btn-primary" value="Delete" >
	<br/>
	<input type = "text" id = "contents" name = 'contents' value = "${qlist.contents}"/>
	<hr/>
	
	</c:if>
	
	<c:if test="${account.id != qlist.writer}">
	<br/>
	<input type = "text" value = "${qlist.contents}" readonly>
	<hr/>
	</c:if>
	
	<br/>
	</form>
	</c:forEach>
	</div>
	</div>
	</div>
</body>
</html>