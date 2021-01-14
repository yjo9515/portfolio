<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement"  %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DBPKG.DBcon" %>
<%@ page import="java.util.*, java.text.*"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Netflix</title>
    <link rel="shortcut icon" href="./image/netflixIcon.ico">
    <link rel="stylesheet" href="./style/login.css">

</head>

<body>

    <div class="content">
        <div class="navbar">
        <ul>
            <li class="logo"><a href="index.jsp"><img src="./image/Netflix-Logo-PNG-image-200x200.png"></a></li>
</ul>

        </div>
        
        <div class="login">
            <h1 class="login_title">로그인</h1>
            <form action="loginAction.jsp" name="action" method="get">
            <div class="login__group">
                <input class="login__group__input" id="memID" name="memID" type="text" placeholder="아이디" />
            </div>
            <div class="login__group">
                <input class="login__group__input" id="memPassword" name="memPassword" type="password" placeholder="비밀번호" />

            </div>
            <input class="buttons" type="button" id="login_btn" value="로그인"/>
            </form>
            <div class="login_not">Netflix 회원이 아닌가요?<a href="newmem.jsp">지금 가입하세요</a></div>
        </div>
    </div>
<script>
var form = document.action;
var submit = document.getElementById("login_btn");
var memID = form.memID;
var memPassword = form.memPassword;

submit.addEventListener("click",function(e){
	if(memID.value==""){
		alert("아이디를 입력하세요");
		memID.focus();
		return;
	}
	if(memPassword.value==""){
		alert("비밀번호를 입력하세요");
		memPassword.focus();
		return;
	}
	if(memID.value!="" && memPassword.value!=""){
		form.submit();
	}
	
	
});


</script>

</body>

</html>