<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Netflix</title>
    <link rel="shortcut icon" href="./image/netflixIcon.ico">
    <link rel="stylesheet" href="./style/newmem.css">
</head>
<body>
    <div class="content">
        <div class="navbar">
        <ul>
            <li class="logo"><a href="index.jsp"><img src="./image/Netflix-Logo-PNG-image-200x200.png"></a></li>
	</ul>

        </div>
        <div class="newmem">
            <h1 class="newmem_title">회원가입</h1>
            <form action="newmemAction.jsp" name="action" id="action" method="get" >
            <div class="newmem__group">
                <label for="memID">아이디</label>
                <input class="newmem__group__input" name="memID" id="memID" type="text" />
            </div>
            <div class="newmem__group">
                <label for="memPassword">비밀번호</label>
                <input class="newmem__group__input" name="memPassword" id="memPassword" type="text"  />

            </div>
            <div class="newmem__group">
                <label for="memName">성명</label>
                <input class="newmem__group__input" name="memName" id="memName" type="text" />
            </div>
            <div class="newmem__group">
                <label for="memNum">주민등록번호</label>
                <input class="newmem__group__input" name="memNum" id="memNum" type="text"  />

            </div>
            <div class="newmem__group">
                <label for="memEmail">이메일</label>
                <input class="newmem__group__input" name="memEmail" id="memEmail" type="text" />
            </div>
           
            <button type="button" class="buttons" name="submit_btn" id="submit_btn" >회원가입 완료</button>
            <div class="newmem_not"><a href="login.jsp">Netflix 로그인하기</a></div>
            </form>
            <script>
            var form = document.action;
            var submit_btn = document.getElementById("submit_btn");
            var memID = form.memID;
            var memPassword = form.memPassword;
            var memName = form.memName;
            var memNum = form.memNum;
            var memEmail = form.memEmail;
            
            submit_btn.addEventListener("click", function(e){
            	if(memID.value ==""){
            		alert("회원가입 할 ID를 입력해주세요.");
            		memID.focus();
            		return;
            	}
            	if(memPassword.value ==""){
            		alert("회원가입 할 패스워드를 입력해주세요.");
            		memPassword.focus();
            		return;
            	}
            	if(memName.value ==""){
            		alert("이름을 입력해주세요.");
            		memName.focus();
            		return;
            	}
            	if(memNum.value ==""){
            		alert("주민번호를 입력해주세요.");
            		memNum.focus();
            		return;
            	}
            	if(memEmail.value ==""){
            		alert("이메일을 입력해주세요.")
            		memEmail.focus();
            		return;
            	}
            	if(memID.value != "" && memPassword.value != "" 
            			&&memName.value !=""&& memNum.value != "" && memEmail.value != "" ){
            		form.submit();
            	}
            	
            });
            
            
            </script>
        </div>
    </div>

    
</body>
</html>