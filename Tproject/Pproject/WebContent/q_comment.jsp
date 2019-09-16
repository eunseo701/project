<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page isELIgnored="true" %>

<!DOCTYPE>
<html>
<head>
<!-- <style>
body {
  background-color: LightGray;
}

h1 {
  color: white;
  text-align: center;
}

.num{
		color:#ff0000;
		font-weight:bold;
		font-size:14px;
	}
	p {
  background-color: yellow;
}
div.ex1 {
  max-width:500px;
  margin: auto;
  border: 3px solid #73AD21;
}

</style> -->

<meta charset="utf-8">
<title>Comment</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 템플릿 플러그인 설정 -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>

<!-- 템플릿 구조 만들기 -->
<script type="text/x-jquery-tmpl" id="itemTemplate">
	<li data-num="${num}" class="comment_item"><p>${num}<br/>${writer}<br/>${content}<br/>${datetime}</p>
	<input type="button" class="delete_btn" value="삭제하기"></li>

</script>
<script type="text/javascript">
	function addNewItem(num, writer, content, datetime){
		var li_data = {
				"num":num,
				"writer":writer,
				"content":content,
				"datetime":datetime
					
			};
			
			var new_li = $("#itemTemplate").tmpl(li_data);
			
			$("#comment_list").prepend(new_li);
		
		
	};
	
	$(function(){
		//alert("ddd");
		
		$.get("comment_list",{},function(data){
			$(data).find("comment").each(function(){
				var num = $(this).find("num").text();
				var writer = $(this).find("writer").text();
				var content = $(this).find("content").text();
				var datetime = $(this).find("datetime").text();
				
				addNewItem(num, writer, content, datetime);
				
			});
			
		}).fail(function(){
			alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});//url실행해서 미터 붙이고 성공하면 이 펑션 실행해라.실패하면 이 펑션 실행해라
			
		$("#comment_form").submit(function(){
		if(!$("#user_name").val()){
			alert("이름을 입력해주세요.");
			return false;
		}
		if(!$("#comment").val()){
			alert("내용을 입력해주세요.");
			return false;
		}
						/* 	this = #comment_form */
		$.post("comment_write",$(this).serialize(),function(xml){/* xml=08.commentItem */
			var result = $(xml).find("result").text();
			var message = $(xml).find("message").text();
			
			if(result){
				alert(message);
				
				var num = $(xml).find("num").text();
				var writer = $(xml).find("writer").text();
				var content = $(xml).find("content").text();
				var datetime = $(xml).find("datetime").text();
				
				
				addNewItem(num, writer, content, datetime);
				
				$("#user_name").val("");
				$("#comment").val("");
				
			}else{
				alert(message);
			}
			
			}).fail(function(){
				alert("실패");
			});
			return false;
		});
		
		$(document).on('click','.delete_btn',function(){
			if(confirm("정말로 삭제 하시겠습니까")){
				var num = $(this).parent("li").attr("data-num");
				var target = $(this).parents(".comment_item");
				target.remove();
				/* alert(num); */
				
				$.post("comment_delete",{"num":num},function(xml){
					
					
				}).fail(function(){
					var message = $(xml).find("message").text();
					alert(message);
				});
				return false;
			}
			
		});
	});
</script>
</head>
<body>
<h1>Ajax Comment</h1>
	<form id="comment_form">
		<label for="user_name">작성자</label>
		<input type="text" name="user_name" id="user_name"/>
		
		<input type="submit" value="저장하기"><br/><br/>
		
		<label for="comment">덧글내용</label>
		<textarea name="comment" id="comment"></textarea>
		</form>
		
		<ul id="comment_list">
		<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
		</ul>

</body>
</html>