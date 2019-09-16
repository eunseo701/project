<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  <style>
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
body {
  background-image: url("img/tokyo-japan.jpg");
  background-repeat: repeat-x;
 
  
}
</style>

  <meta charset="utf-8">
  
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

	<script type="text/javascript">
	$(function(){
		$("#datepicker1, #datepicker2").datepicker({

            dateFormat: 'yy.mm.dd'

        });
		$("#check1").click(function(){
			$("ul").empty();
				var li = $("<li>").css("color" , "black").html("From&nbsp;<select name = 'from' id = 'from'> <option value='ICN' selected = 'selected'>INCHEON</option><option value='NRT'>TOKYO</option><option value='KIX'>OSAKA</option><option value='CJU'>JEJU</option><option value='HKG'>HONGKONG</option></select>&nbsp;TO&nbsp;<select name = 'to' id = 'to'><option value='ICN' >INCHEON</option><option value='NRT' selected = 'selected'>TOKYO</option><option value='KIX'>OSAKA</option><option value='CJU'>JEJU</option><option value='HKG'>HONGKONG</option></select>&nbsp;<label for='fromDate'>Depart</label><input type='text' name='fromDate' id='fromDate'><label for='toDate'>Return</label><input type='text' name='toDate' id='toDate'>");
			
				$("ul").append(li);
				$("#datepicker1, #datepicker2").datepicker({

		            dateFormat: 'yy.mm.dd'

		        });
				$(function() {
	                
		            

	                
	                // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
	                // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

	                //시작일.
	                $('#fromDate').datepicker({
	                    showOn: "both",          // 버튼 이미지만 표시할지 여부
	   
	                    dateFormat: "yy-mm-dd",             // 날짜의 형식
	                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
	                    minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
	                    onClose: function( selectedDate ) {    
	                        // 시작일(fromDate) datepicker가 닫힐때
	                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                        $("#toDate").datepicker( "option", "minDate", selectedDate );
	                    }                
	                });

	                //종료일
	                $('#toDate').datepicker({
	                    showOn: "both", 
	                    dateFormat: "yy-mm-dd",
	                    changeMonth: true,
	                    minDate: 0, // 오늘 이전 날짜 선택 불가
	                    onClose: function( selectedDate ) {
	                        // 종료일(toDate) datepicker가 닫힐때
	                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	                        $("#fromDate").datepicker( "option", "maxDate", selectedDate );
	                    }                
	                });
	            });
		});
		$("#check2").click(function(){
			$("ul").empty();
			var li = $("<li>").css("color" , "black").html("From&nbsp;<select name = 'from' id = 'from'> <option value='ICN' selected = 'selected'>INCHEON</option><option value='NRT'>TOKYO</option><option value='KIX'>OSAKA</option><option value='CJU'>JEJU</option><option value='HKG'>HONGKONG</option></select>&nbsp;TO&nbsp;<select name = 'to' id = 'to'><option value='ICN'>INCHEON</option><option value='NRT' selected = 'selected'>TOKYO</option><option value='KIX'>OSAKA</option><option value='CJU'>JEJU</option><option value='HKG'>HONGKONG</option></select>&nbsp; <label for='fromDate'>Depart</label><input type='text' name='fromDate' id='fromDate'>");
			
			$("ul").append(li);
			$("#datepicker1, #datepicker2").datepicker({

	            dateFormat: 'yy.mm.dd'

	        });
$(function() {
                
            

                
                // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

                //시작일.
                $('#fromDate').datepicker({
                    showOn: "both",          // 버튼 이미지만 표시할지 여부
   
                    dateFormat: "yy-mm-dd",             // 날짜의 형식
                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {    
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#toDate").datepicker( "option", "minDate", selectedDate );
                    }                
                });

                //종료일
                $('#toDate').datepicker({
                    showOn: "both", 
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) {
                        // 종료일(toDate) datepicker가 닫힐때
                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                    }                
                });
            });
	});
		 
		$(function(){                
            $("#reservation").click(function(){              
             var input_val = $("#fromDate").val();
             var input_val2 = $("#toDate").val();
             var from = $("#from").val();
             var to = $("#to").val();
             
             var today = new Date();
             var dd = today.getDate()-1;
             var mm = today.getMonth()+1;
             var yyyy = today.getFullYear();
             
             
             if((mm+"").length < 2){
            	 mm = "0" + mm;
             }
             
             if((dd+"").length < 2){
            	 dd = "0" + dd;
             }
             var todate = yyyy+'-'+mm+'-'+dd;
            
             //alert(input_val);
              if(!input_val){
              alert("Plz insert the Date of Departure");
              return false;
             } 
              if(!input_val2&&input_val2!=null){
              alert("Plz insert the Date of Return");
              return false;
             }    
              if(from==to){
                  alert("Searching from and to the same city is not possible");
                  return false;
                 }
              if(input_val<=todate){
                  alert("It's impossible to select the day before today");
                  return false;
                 }  
              if(input_val2<=todate){
                  alert("It's impossible to select the day before today");
                  return false;
                 }
  			
            });                
           });
	});
	</script>
	  <script>
            $(function() {
                
            

                
                // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

                //시작일.
                $('#fromDate').datepicker({
                    showOn: "both",          // 버튼 이미지만 표시할지 여부
   
                    dateFormat: "yy-mm-dd",             // 날짜의 형식
                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {    
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#toDate").datepicker( "option", "minDate", selectedDate );
                    }                
                });

                //종료일
                $('#toDate').datepicker({
                    showOn: "both", 
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) {
                        // 종료일(toDate) datepicker가 닫힐때
                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                    }                
                });

                
            });
        </script>
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
   
    <div id = "a" >
    <form style="text-align: center" action = 'reservation' method = "post" >
			<input type = "radio" id = "check1" name = "check1" value = "c1" checked = "checked">return
			&nbsp;&nbsp;
			<input type = "radio" id = "check2" name = "check1" value = "c2">one way
		<br/><br/>
		
		<ul class = "a"><li>
		From&nbsp;
		<select name = 'from' id = 'from' >
			<option value='ICN' selected = 'selected'>INCHEON</option>
			<option value='NRT'>TOKYO</option>
			<option value='KIX'>OSAKA</option>
			<option value='CJU'>JEJU</option>
			<option value='HKG'>HONGKONG</option>
			
		</select>
		TO
		<select name = 'to' id = 'to'>
			<option value='ICN'>INCHEON</option>
			<option value='NRT' selected = 'selected'>TOKYO</option>
			<option value='KIX'>OSAKA</option>
			<option value='CJU'>JEJU</option>
			<option value='HKG'>HONGKONG</option>
		</select>
		&nbsp;&nbsp;
          <label for="fromDate">Depart</label><input type="text" name="fromDate" id="fromDate">   <label for="toDate">Return</label><input type="text" name="toDate" id="toDate">
		</li></ul>
		<input type = "submit" class="btn btn-primary" id="reservation" value = "Search Flight"/>
		</form>
		
	</div>
</body>
</html>