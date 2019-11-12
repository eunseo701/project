<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
    $(function() {
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy.mm.dd'
        });
    });

</script>


</head>
<body>
	<div class="container">
		<h3>BOARD </h3>
		<li><a href="comment.do">Writing</a></li>
		<table class="table table-striped">
			<thead>
				<tr>
					<td>NO</td>
					<td>Subject</td>
					<td>Writer</td>
					<td>DATE</td>
					<td>VIEW</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ybbslist" items="${ybbslists}">
					<tr>
						<td>${ybbslist.no}</td>
						<c:if test="${ybbslist.lv == 0}">
							<td><a href="ybbs_detail?no=${ybbslist.no}">${ybbslist.subject}</td>
						</c:if>
						<c:if test="${ybbslist.lv == 1}">
							<td><a href="ybbs_detail?no=${ybbslist.no}"> ㄴ
									${ybbslist.subject}</td>
						</c:if>
						<td>${ybbslist.id}</td>
						<td>${ybbslist.wdata}</td>
						<td>${ybbslist.visited}</td>
					</tr>
				</c:forEach>


				<br>
			</tbody>
		</table>
		<c:if test="${pageGroupResult.beforePage}">
			<a href="ybbs_list?reqPage=${pageGroupResult.groupStartNumber-1}">before</a>
		</c:if>
		<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}"
			end="${pageGroupResult.groupEndNumber}">
			<c:choose>
				<c:when test="${pageGroupResult.selectPageNumber==index}">

					<b><a href="ybbs_list?reqPage=${index}">${index}</a></b>
				</c:when>
				<c:otherwise>
					<a href="ybbs_list?reqPage=${index}">${index}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageGroupResult.afterPage}">
			<a href="ybbs_list?reqPage=${pageGroupResult.groupEndNumber+1}">after</a>
		</c:if>
		
		<br>
<p>조회기간:
    <input type="text" id="datepicker1"> ~
   
</p>
	</div>
	
</body>
</html>
