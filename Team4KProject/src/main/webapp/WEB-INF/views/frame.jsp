<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.css" integrity="sha512-earFJuyxuk1UIfnUubV3DGk2ysSejjmhMPb/4OXsqII9qmIbEwa1AaXrTqo4ivYizpbfyjXFZi6wENs94/BKWQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.extensions.min.js" integrity="sha512-CG4suntOelKyziz99VyC3BrbQ60IOtpJ9RYQvI/0d6TdYWStN69gCb9OpPMlym+3OmNAr357Kv6FVqTk25Ej5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
  <link rel="stylesheet" href="css/frame.css">
  <script src="js/frame.js"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Team4K 개인화면 프레임</title>
</head>
<body>
  <jsp:include page ="./includes/header.jsp" flush="true"/>
  	<div id="fullpage">
        <div class="section sectionName">
        	<form action="index" method="get">
        		<input type="button" onclick="submit()">
        	</form>
        </div>
        <div class="section sectionName">
            
        </div>
        <div class="section sectionName">
        
        </div>
    </div>
    <jsp:include page ="./includes/footer.jsp" flush="true"/>
</body>
</html>
