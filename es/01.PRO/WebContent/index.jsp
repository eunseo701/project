<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GG</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
서버정보 
<%=application.getServerInfo() %>

서블릿정보
<%=application.getMajorVersion()%>.<%= application.getMinorVersion() %>

JSP정보
<%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>

 
<div class="jumbotron text-center">
  <h1>BOARD</h1>
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>login</h3>
      <p><a href="login_input">SIGN IN</a><br/></p>
      <p><c:if test="${member != null}">
  <h1>Welcome ${member.name} !</h1>
  <form action = 'logout'>
  <input type = "submit" value = "SIGN OUT"/>
  </form>
  </c:if></p>
    </div>
    <div class="col-sm-4">
      <h3>MMM</h3>
      <p><a href = "public">this page can be viewed by anyone</a></p>
  <p><a href = "private.do">this page can be viewed by logged in person</a></p>
      <p><a href = "private/test.do">this page can be viewed by  logged in person</a></p>
    </div>
    <div class="col-sm-4">
      <h3>WWW</h3>        
      <p><li><a href = "comment.do">Writing</a></li></p>
   <p><li><a href = "ybbs_list?reqPage=1">LIST</a></li></p>
    </div>
  </div>
</div>
aa
</body>
</html> 


