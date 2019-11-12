<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
 <form action="ybbs_content" method="post">
 <fieldset>
  <legend>掲示板</legend>
  <li><a href = "ybbs_list">掲示板を見る</a></li><br/>

  <input type = "hidden" id = "id" name = "id" value="${member.id}"/>
 作成者 : ${member.name} <br/>
 題目 <input id = "subject" type = "text" name = "subject"><br/>
 内容<textarea id= "content" name = "content" rows = "10" cols= "30"/></textarea><br/>
 <input  type = "submit" value = "submit" name = "button" />
 </fieldset>
 </form>
</body>
</html> 