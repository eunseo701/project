<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
 <c:if test="${member.id == ybbslist.id}">
 <h4>自分の文</h4>
 <form action="ybbs_update" method = "post">
 <input type = "hidden" name="no" value = "${ybbslist.no}"/><br/>
   <input type = "hidden" name="grp" value = "${ybbslist.grp}"/><br/>
 Writer : ${ybbslist.id}<br />
 Subject <input type="text" class="form-control" placeholder="제목을 입력하세요." name="subject" value = "${ybbslist.subject}"/><br />
 Content <input type="text" class="form-control" placeholder="댓글을 입력하세요." name="content" value = "${ybbslist.content}"/><br />
  <input type="submit" class="btn btn-primary form-control" value="Edit">
 </form>
 <a href="ybbs_delete?no=${ybbslist.no}">Delete</a>
 <li><a href="ybbs_list">BACK</a></li>
 </c:if>
 
 <c:if test="${member.id == null}">

 作成者 : ${ybbslist.id}<br />
 Subject :  : ${ybbslist.subject}<br />
 Comment : ${ybbslist.content}<br />
 </c:if>
 
 <c:if test="${member.id != ybbslist.id && member.id != null}">
 <form action="ybbs_insert2" method = "post">
 <input type = "hidden" name="no" value = "${ybbslist.no}"/><br/>
  <input type = "hidden" name="grp" value = "${ybbslist.grp}"/><br/>
 作成者 : ${ybbslist.id}<br />
 
 Subject :  : ${ybbslist.subject}<br />
 Comment : ${ybbslist.content}<br />
  <input type="submit" class="btn btn-primary form-control" value="submit">
 </form>
 </c:if>
</body>
</html> 