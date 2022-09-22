<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="/css/login.css" type="text/css"/>
		<script src="https://accounts.google.com/gsi/client" async defer></script>
	</head>

<script>

	function handleCredentialResponse(response) {
        console.log("Encoded JWT ID token: " + response.credential);
      }
      window.onload = function () {
        google.accounts.id.initialize({
          client_id: "855667674068-setoafdstkuk2jg4tqiv3gut3kqaamfp.apps.googleusercontent.com",
          callback: handleCredentialResponse
        });
        google.accounts.id.renderButton(
          document.getElementById("buttonDiv"),
          { theme: "outline", size: "large" }  // customization attributes
        );
        //google.accounts.id.prompt(); // also display the One Tap dialog
      }
      function decodeJwtResponse(token) {
		    var base64Url = token.split('.')[1];
		    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
		    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
		        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
		    }).join(''));

		    return JSON.parse(jsonPayload);
		};
      function handleCredentialResponse(response) {
    	     const responsePayload = decodeJwtResponse(response.credential);

    	     console.log("ID: " + responsePayload.sub);
    	     console.log('Full Name: ' + responsePayload.name);
    	     console.log('Given Name: ' + responsePayload.given_name);
    	     console.log('Family Name: ' + responsePayload.family_name);
    	     console.log("Email: " + responsePayload.email);
    	     
    	     location.href = "/login/loginOk?id="+responsePayload.email+"&name="+responsePayload.name; 
    	  }
      
</script>
<body>
	<div class="s_container">
	<h1>로그인</h1>
		<ul>
			<div id="buttonDiv"></div> 
			<li id="s_singup"><a href="https://accounts.google.com/"/>google 가입하러가기</a></li>
		</ul>
	</div>
</body>
</html>