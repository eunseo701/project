<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script type="text/javascript">
 $(function(){
 
  $("#logina").click(function(){
   
   var input_val = $("#id").val();
   var input_val2 = $("#password").val();
   //alert(input_val);
    if(!input_val){
    alert("아이디를 입력하세요.");
    return false;
   } 
    if(!input_val2){
    alert("패스워드를 입력해주세요.");
    return false;
   } 
    
    
  });
  
 });

</script>
</head>
<body>
 
 <h2>로그인</h2>
 <form action="login" method = "post">
  <input type = "text" name="id" id="id" placeholder = "아이디를 입력해주세요."/><br/>
  <input type = "password" name="password" id="password" placeholder = "비밀번호를 입력해주세요."/><br/>
  <button type = "submit" id="logina">로그인</button>
 </form>${message}
</body>
</html>