<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
	<head>
		<title>Bootstrap 4</title>
		
	</head>
	<body>
		 <c:forEach begin = "1" end = "6" step = "1" var="i">
    <c:forEach begin = "1" end = "25" step = "1" var="j">
     <input type="radio" id="seat" name="seat" value="${j}${i}"/>
    </c:forEach>
  <br/>
   </c:forEach>
     
     <c:forEach var = "book" items = "${booklist}">
     <script>
      
     </script>
     </c:forEach> 
  	<ul id="airplane" class="radio-wrap">
  	</ul>
	</body>
</html>

