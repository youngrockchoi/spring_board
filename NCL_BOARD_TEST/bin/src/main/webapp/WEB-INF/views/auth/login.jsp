<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html style="height:100%;">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>로그인</title>
  <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="/resources/css/layout.css" rel="stylesheet">
  <link href="/resources/css/style.css" rel="stylesheet">
  <link href="/resources/css/style-plus.css" rel="stylesheet">
 <link rel="icon" href="/resources/img/logo.ico" type="image/vnd.microsoft.icon">
  <style>
    #loader {
      transition: all 0.3s ease-in-out;
      opacity: 1;
      visibility: visible;
      position: fixed;
      height: 100vh;
      width: 100%;
      background: #fff;
      z-index: 90000;
    }
    #loader.fadeOut {
      opacity: 0;
      visibility: hidden;
    }
    .spinner {
      width: 40px;
      height: 40px;
      position: absolute;
      top: calc(50% - 20px);
      left: calc(50% - 20px);
      background-color: #333;
      border-radius: 100%;
      -webkit-animation: sk-scaleout 1.0s infinite ease-in-out;
      animation: sk-scaleout 1.0s infinite ease-in-out;
    }

    @-webkit-keyframes sk-scaleout {
      0% { -webkit-transform: scale(0) }
      100% {
        -webkit-transform: scale(1.0);
        opacity: 0;
      }
    }
    @keyframes sk-scaleout {
      0% {
        -webkit-transform: scale(0);
        transform: scale(0);
      } 100% {
        -webkit-transform: scale(1.0);
        transform: scale(1.0);
        opacity: 0;
      }
    }
    table tr:hover td,
    table tr:hover th{background-color:rgba(0,0,0,.02);
    }
  </style>

<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script> 
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">

$(document).ready(function(){
});

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
	    return;
	else
	    event.target.value = event.target.value.replace(/[^a-z0-9!@#$*)]/gi,'');
} 

function goLogin(){
	$("#loginform").submit();
}
</script>
</head>

<body class="app is-collapsed" style="height: 100%;padding: 0px;/* background-position:50% 50% */; background-position: 50% 50%; background-size: cover; background-repeat: no-repeat;/* background-size: 100% 100% */; background-image: url(/resources/img/login-bg.jpg);">
   <div id='loader'>
     <div class="spinner"></div>
   </div>
   <script>
     /* window.addEventListener('load', () => { */
   	 window.addEventListener('load',function(){
       const loader = document.getElementById('loader');
       /* setTimeout(() => { */
   	   setTimeout(function(){
         loader.classList.add('fadeOut');
       }, 300);
     });
   </script>
   <div id="wrap" class="wrap text-center">
		<div class="login-area">
			<div class="login-head">
				<a href="#"><h1><img src="/resources/img/logo-min2.png"></h1></a>			
			</div>
			<div class="login-body">

			<form id="loginform" name="loginform" method="post" action="/login">
				<p>MEMBERSHIP ID</p>
				<input type="text" name="userID" style="ime-mode:disabled;">
				<p>Password</p>
				<input type="password" name="userPW" onkeyup="removeChar(event)" style="ime-mode:disabled;">
				<div class="save"><input type="checkbox" id="save"><label for="save">아이디 저장</label></div>

				<%-- 
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				--%>
				
				<sec:csrfInput/>

 				<!-- 로그인 실패 시 출력할 메세지 -->
				<p>${requestScope.loginFailMsg}</p>
				 
				<div class="login-foot">
					<input type="button" value="LOGIN" onclick="goLogin();">
				</div>
 
 
			</form>
	
			</div>
		</div>
	</div>
</body>
</html>