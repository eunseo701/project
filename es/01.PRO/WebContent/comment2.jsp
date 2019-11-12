<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
 <form action="ybbs_insert_dap" method="post">
 <fieldset>
  <legend>コメント</legend>
  <li><a href = "ybbs_list">掲示板を見る</a></li><br/>
  <input type = "hidden" id = "grp" name = "grp" value="${num}"/>
  <input type = "hidden" id = "id" name = "id" value="${member.id}"/>
 NAME : ${member.name} <br/>
 Subject<input id = "subject" type = "text" name = "subject"><br/>
 Comment<textarea id= "content" name = "content" rows = "10" cols= "30"/></textarea><br/>
 <input  type = "submit" value = "Submit" name = "button" />
 </fieldset>
 </form>
</body>
</html> 