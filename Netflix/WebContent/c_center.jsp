<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Netflix 고객센터</title>

  <link rel="shortcut icon" href="./image/netflixIcon.ico">
  <link rel="stylesheet"
    href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <script src="https://kit.fontawesome.com/bc3a1796c2.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css" />
 <link rel="stylesheet" href="./style/index.css" />
</head>
<style>
ul,li {list-style: none;}
a{text-decoration: none;}
.navbar {background: url("./image/c_center.jpg") no-repeat 50% #000;;
background-size: cover;
height: 210px;
} 
.wrap1{
width:100%;
float: left;
height: 100%;
}
.wrap2{
    background: #eaeae6;
    border-top: 1px solid #d5d4d1;
    box-sizing: border-box;
    height: 96px;
    padding: 24px 0;
    text-align: right;
    clear: left;
    margin-top:370px 
    }
 .btn{
 
 background: #fff;
    border-color: #8b8a88;
    color: #4c4948;
    font-size: 16px;
    font-weight: 700;
    line-height: 15px;
    cursor: pointer;
    border: 1px solid;
    border-radius: 2px;
    box-sizing: border-box;
    display: inline-block;
    font-family: Netflix Sans,Helvetica,Arial,sans-serif;
    height: 48px;
    letter-spacing: .01em;
    min-width: 96px;
    padding: 16px;
    text-align: center;
    text-transform: uppercase;
    transition: color .15s ease,background-color .15s ease;
    user-select: none;
    vertical-align: middle;
    white-space: nowrap;
 
 }
 .txt_wrap {
 float: left;
 width: 15%;
 margin-right: 60px
 
 }

.txt_wrap li {
padding-top: 15px;

}
</style>

<body>
<%

request.setCharacterEncoding("utf-8");

	
%>

  <div class="navbar">
    <ul>
    <li class="logo"><a href="index.jsp"><img src="./image/Netflix-Logo-PNG-image-200x200.png"></a></li>
    </ul>
    
    
    <h1 style="color:#fff; font-size: 3em">고객센터</h1>
    
    
    <%
    
    if(session.getAttribute("id") == null){
		
    	
    %>
    <a href="login.jsp" class="buttons" style="color: #fff;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    margin-top: 2px;
    margin-right: 120px;
    text-decoration: none;" >로그인</a>
  <%}else{
	  String memID = (String)session.getAttribute("id");
	
	  %>
  <p style="color: #fff; font-size: 1.2em; margin-right: 50px"><%=memID %>님 환영합니다.</p>
  <%} %>
  </div>
 
  <div class="container1" style="background-color: #fff;">
  <div class="wrap1">
  <ul class="txt_wrap">
  	<li><h1>가입절차</h1></li>
  	<li><a href="">넷플릭스 소개</a></li>
  	<li><a href="">넷플릭스 요금을 결제하는 방법</a></li>
  	<li><a href="">넷플릭스 앱을 다운로드 하는 방법</a></li>
  </ul>
  <ul class="txt_wrap">
  	<li><h1>시청 불가</h1></li>
  	<li><a href="">넷플릭스 ID 또는 비밀번호가 기억나지 않습니다.</a></li>
  	<li><a href="">앱 스토어에서 Netflix 앱을 찾을 수 없음</a></li>
  	<li><a href="">Netflix에 "사용 중인 디바이스와 Netflix 앱 버전이 호환되지 않습니다."라는 메시지가 표시됩니다.</a></li>
  </ul>
  <ul class="txt_wrap">
  	<li><h1>내 계정 관리</h1></li>
  	<li><a href="">멤버십 및 요금</a></li>
  	<li><a href="">청구 및 결제</a></li>
  	<li><a href="">내 동의 없이 이메일이 변경됨</a></li>
  </ul>
    <ul class="txt_wrap">
  	<li><h1>Netfilx 시청</h1></li>
  	<li><a href="">TV 프로그램 및 영화를 찾아 저장하는 방법</a></li>
  	<li><a href="">TV로 Netflix를 시청하려면 어떻게 하나요?</a></li>
  	<li><a href="">어떻게 하면 모바일 디바이스를 이용해 TV에서 Netflix를 시청할 수 있나요?</a></li>
  </ul>
  <ul class="txt_wrap">
  	<li><h1>빠른링크</h1></li>
  	<li><a href="">TV 프로그램 및 영화 요청하기</a></li>
  	<li><a href="">이메일 업데이트</a></li>
  	<li><a href="">비밀번호 업데이트</a></li>
  	<li><a href="">결제수단 업데이트</a></li>
  	<li><a href="">맴버십 해지</a></li>
  	<li><a href="">결제 내역 검토</a></li>
  </ul>
   <div class="wrap2">
  
  <h3 style="    font-size: 24px;
    float: left;
    padding-left: 80px;
">고객 센터에 문의 하시겠어요?</h3>
  <a class="btn" href="list.jsp" style="margin-left: 1200px">문의하기</a>
  <a class="btn" href="" style="margin-right: 100px">실시간 채팅 시작하기</a>
  </div>
  </div>
 
   
   
  </div>

  <div class="footer">


    <div class="footercon">
      <div class="flex1">
        <h5>질문이 있으신가요? 문의 전화: <a href="">00-308-321-0058</a>
        </h5>
        <h5>
        </h5>
      </div>

      <ul class="list1">

        <li><a href="">자주 묻는 질문</a></li>
        <li><a href="">투자 정보(IR)</a></li>
        <li><a href="">개인정보</a></li>

        <li><a href="">속도 테스트</a></li>

      </ul>
      <ul class="list1">
        <li><a href="c_center.jsp">고객 센터</a></li>
        <li><a href="">입사 정보</a></li>
        <li><a href="">쿠키 설정</a></li>
        <li><a href="">법적 고지</a></li>

      </ul>
      <ul class="list1">
        <li><a href="">계정</a></li>
        <li><a href="">Netflix 지원 디바이스</a></li>
        <li><a href="">회사 정보</a></li>
        <li><a href="">Netflix 오리지널</a></li>


      </ul>
      <ul class="list1">
        <li><a href="">미디어 센터</a></li>
        <li><a href="">이용 약관</a></li>
        <li><a href="">문의 하기</a></li>
        <li><a href="">Netflix Originals</a></li>
      </ul>

    </div>

  </div>
  <div class="end">
    <h2>
      Netflix 대한민국
    </h2>
    <h2>
    </h2>
  </div>
</body>

</html>