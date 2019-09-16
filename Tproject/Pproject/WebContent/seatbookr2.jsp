<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">

	<head>
	<title>Seat Book2</title>
	<style>
	
	#h{
		background-image:url("img/airplane7.jpg");
		background-repeat:no-repeat;
		background-position: center
	}
	#a {
  border: 1px solid black;
  padding-top: 50px;
  padding-right: 10px;
  padding-bottom: 30px;
  padding-left: 10px;
  width: 90%;
  margin-left: 100px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;
}
#abbd{display:inline;
text-align:right;
align:right;
}
#abbd{text-align:right}
img{display:inline}
#b{
  font-size: 150%;
}
	</style>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script type="text/javascript">

   $(function(){
   	$("#book").click(function(){
   	var result = confirm("Have you checked your seat?");
   	
   	if(result == true){
   		if(document.frm.seat.value==""){//id가 공백인 경우(true)
			alert('Please select a seat.');//알림창
			return false;//다음 태그 동작을 차단시킴
		}
   		
   		else{
   			alert("Booking completed");  			
   		}
   	   }else if( result == false ){

   	      alert("Cancel!");
   		return false;
   	   }
   	
   	});
   });
   </script>
		
	</head>
	<body>
	<div id = "b" >
  <a href='index.jsp'><img id="b" src="img/airlogo.jpg"></a>
  
  	<c:choose>
  		<c:when test="${account !=null}">
			
			
			
			<p style="text-align:right" id = 'abbd' >Welcome ${account.id}</p>
			
			<form action="mybook" style="float: right" method = "post" id = 'abbd'>
			<input type = 'hidden' id = 'accountid' name = 'accountid' value = "${account.id}" />
			<input type = "submit" style="float: right" id = 'mybook' class="btn btn-primary" value = "Mybook"/>
			</form>
			<div style="text-align:right" id = 'abbd'>
			<input type = "button" style="float: right" onclick="location.href='iddetail.jsp'" class="btn btn-primary" value = "detail"/>
			</div>
			<div style="text-align:right" id = 'abbd' >
			<input type = "button" style="float: right" onclick="location.href='Withdrawalcheck.jsp'" class="btn btn-primary" value = "Withdrawal"/>
			</div>
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
  	
  </div>
  <hr/>
	<form name = "frm" action = "insert_book" method = "post" >
	<div id = "h" style="text-align:center">
	<br/><br/><br/><br/>
	<c:forEach begin = "1" end = "6" step = "1" var="i">
		 
    <c:forEach begin = "1" end = "25" step = "1" var="j">
     &nbsp;
     <input type="radio" id="${j}${i}" name="seat" value="${j}${i}"/>
    </c:forEach>
  <br/>
  
   </c:forEach>
     <br/>
        
    <c:forEach var = "book" items = "${booklist}">
       <script>
      	for(var i=10;i<257; i++){
      		
      		if(i == "${book.seat}"){
      			$('#'+i).prop('disabled',true);
      		}
      	}
     </script> 

        </c:forEach> 
<br/><br/><br/>
</div>
<br/>

<div style="text-align:center">
<div id='a' style="text-align:center">
<fieldset>
  <legend>Return</legend>
    <br>
	Depart : ${todate}${plan2.depa} ${plan2.dept} <br> Arrives : ${todate} ${plan2.arva} ${plan2.arvt} <br/>
<br>
&nbsp;※Fare details
<li>Cancellation</li>
- In general, our flights are non-refundable. If you'd like to try cancelling, visit Manage My Booking and fill in the Refund Application Form. Our Claims Team will get back to you. <br>
- The possible refund amount always depends on the airline's policy. We charge a handling fee of 20 € per booking for cancellations and/or refunds of any kind.
<li>Change</li>
- All changes must be made at least 48h before departure and are dependent on the airline's policy. Most changes are available via Manage My Booking.
<li>Other</li>
- The airline may charge additional fees for checked baggage or other optional services. <br>
- Flight schedules and terminals are subject to change at any time by the airlines. <br>
- Correct travel documents are required. It is your responsibility to check your documents before you travel.
<br/>
<input type = "hidden" id = 'id' name = 'id' value = "${account.id}">
<input type = "hidden" id = 'fromdate' name = 'fromdate' value = "${fromdate}">
<input type = "hidden" id = 'todate' name = 'todate' value = "${todate}">
<input type = "hidden" id = 'plan1sno' name = 'plan1sno' value = "${plan1.sno}">
<input type = "hidden" id = 'plan2sno' name = 'plan2sno' value = "${plan2.sno}">
<input type = "hidden" id = 'plan1cost' name = 'plan1cost' value = "${plan1.cost}">
<input type = "hidden" id = 'plan2cost' name = 'plan2cost' value = "${plan2.cost}">
<input type = "hidden" id = 'plan1seat' name = 'plan1seat' value = "${seat1}">
<input type = "hidden" id = 'check1' name = 'check1' value = "${check1}">
<input type = "hidden" id = 'check2' name = 'check2' value = "${check2}">
		<p>
			
		</p>
		</fieldset>
</div>
Total price: ${pluscost} $ <input type = "submit" class="btn btn-primary"  id = 'book' value = "book">
</div>

	</form>
</body>
</html>
