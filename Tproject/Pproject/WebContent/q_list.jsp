<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
<title>AIR Q&A</title>
<style type="text/css">
body{
	width:800px;
	height: 600px;
	margin: 0 auto;
}

.all {
	overflow:auto;
  
}

h1 {
	text-align: center;
}
h3{
	text-align: center;	
}

table{
	width:100%;
	margine:0 auto;
	

}

thead{
	font-weight: bold;
	text-align: center;	
	border-bottom: 10px solid #EEEEEE;
 	background-color: skyblue;
}


tbody{
	padding: 8px;
	border-bottom: 1px solid #ddd;
	text-align: center;	
}

td {
  height: 40px;
}
#write {
	background-color: skyblue;
	font-size: 24px;
	color: white;
	display: inline-block;
	border: 1px solid white;
	padding: 5px;
	cursor: pointer;
	float: right;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}


A:link {text-decoration:none; color:#646464;}
A:visited {text-decoration:none; color:#646464;}
A:active {text-decoration:none; color:#646464;}
A:hover {text-decoration:none; color:#646464;}

#title{
	cursor: pointer underline;
}

a:hover {
  text-decoration: underline;
}

a:active {
  text-decoration: underline;
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
	
	<div class="all">
		<c:if test="${!empty q}">

			<table class="title">
				<colgroup>
				<col style="width:10%">
				<col style="width:50%">
				<col style="width:10%">
				<col style="width:20%">
				<col style="width:10%">
				</colgroup>
				<thead>
				<tr>
					<td scope="col">NO</td>
					<td scope="col">TITLE</td>
					<td scope="col">WRITER</td>
					<td scope="col">DATE</td>
					<td scope="col">VIEW</td>
				</tr>
				</thead>
				
				<c:forEach var="qq" items="${q}">
				<tbody>
					<tr>
						<td>${qq.no}</td>

						<td	 align="left" maxlength="30" class="title"><c:if test="${qq.lvl >0}">
								<c:forEach begin="1" end="${qq.lvl}">
                            &nbsp;&nbsp; RE : <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
								</c:forEach>
							</c:if> <a href="/q_visited"></a><a href="q_detail?no=${qq.no}">${qq.subject}</a>
						</td>

						<td>${qq.id}</td>
						<td>${qq.wdate}</td>
						<td>${qq.visited }</td>
					</tr>
					</tbody>
				</c:forEach>
			</table>

		</c:if>

		<!-- 페이지 처리 부분 -->
		<br/>
		<h3>
			<c:if test="${pageGroupResult.beforPage }">
				<a href="q_req_list.do?reqPage=${pageGroupResult.groupStartNumber-1 }">&#171;</a>
			</c:if>

			<c:forEach var="index" begin="${pageGroupResult.groupStartNumber }"
				end="${pageGroupResult.groupEndNumber }">
				<c:choose>
					<c:when test="${pageGroupResult.selectPageNumger==index}">
						<a href="q_req_list.do?reqPage=${index }">[${index }]</a>
					</c:when>

					<c:otherwise>
						<a href="q_req_list.do?reqPage=${index }">${index }</a>
					</c:otherwise>
				</c:choose>

			</c:forEach>

			<c:if test="${pageGroupResult.afterPage }">
				<a href="q_req_list.do?reqPage=${pageGroupResult.groupEndNumber+1 }">&#187;</a>

			</c:if>
			<input type="button" id="write" onclick="location.href='q_form.jsp'" value="WRITE">
		</h3>
	</div>
</body>
</html>