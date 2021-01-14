<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Netflix</title>

  <link rel="shortcut icon" href="./image/netflixIcon.ico">
  <link rel="stylesheet"
    href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <script src="https://kit.fontawesome.com/bc3a1796c2.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css" />
  <link rel="stylesheet" href="./style/index.css">
</head>

<body>
<%

request.setCharacterEncoding("utf-8");

	
%>

  <div class="navbar">
    <ul>
    <li class="logo"><a href="index.jsp"><img src="./image/Netflix-Logo-PNG-image-200x200.png"></a></li>
    </ul>
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
  <a href="logoutAction.jsp" class="buttons" style="color: #fff;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    margin-top: 2px;
    margin-right: 120px;
    text-decoration: none;">로그아웃</a>
  <%} %>
  </div>
  <div class="main">
    <div class="area">
      <h1>영화, TV 프로그램을<br>무제한으로</h1>
      <h3>다양한 디바이스에서 시청하세요. 언제든 해지하실 수 있습니다.
      </h3>
      <h4>시청할 준비가 되셨나요? 멤버십을 등록하거나 재시작하려면 이메일 주소를 입력하세요.</h4>

      <div class="search">
        <input type="text" class="box" placeholder="이메일 주소">
        <button class="try">
          30일 무료 이용


        </button>
      </div>
      <h4>신규 회원만 이 프로모션을 이용하실 수 있습니다.
      </h4>
    </div>

  </div>
  <div class="container1">
    <div class="text">
      <h1>TV로 즐기세요.
      </h1>
      <p>
        스마트 TV, PlayStation, Xbox, Chromecast, <br>
        Apple TV, 블루레이 플레이어 등 다양한<br>
        디바이스에서 시청하세요.
      </p>
    </div>
    <div class="image">
      <img class="tv" src="./image/tv.png">
      <div class="tv_ani">
        <video class="tv_video" autoplay playsinline muted loop>
          <source src="./video/video-tv-first.m4v" type="video/mp4"></video>
      </div>
    </div>
  </div>
  <div class="container1">
    <div class="wrap2">
      <div class="bwrap">
        <div class="image2">
          <img src="./image/mobile-0819.jpg">

          <div class="story_ani_wrap">
            <div class="story_ani_img">
              <img src="./image/boxshot.png" alt="" style="max-width: 100%;">
            </div>
            <div class="story_ani_txt">
              <div id="st_txt1">기묘한 이야기</div>
              <div id="st_txt2">저장중...</div>
            </div>
          </div>
        </div>
      </div>
      <div class="text" id="text1">
        <h1>즐겨 보는 콘텐츠를<br> 저장해 오프라인으로<br> 시청하세요.
        </h1>
        <p>
          간편하게 저장하고 빈틈없이 즐겨보세요.
        </p>

      </div>
    </div>
  </div>
  <div class="container1">
    <div class="text" id="text2">
      <h1>다양한 디바이스에서<br>시청하세요.

      </h1>
      <p>
        각종 영화와 TV 프로그램을 스마트폰, 태블릿,<br>노트북, TV에서 무제한으로 스트리밍하세요.<br>추가 요금이 전혀 없습니다.

      </p>
    </div>
    <div class="image">
      <img class="tv2" src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/device-pile.png">
      <div class="tv_ani2">
        <video class="tv_video2" autoplay playsinline muted loop>
          <source src="./video/video-tv-second.m4v" type="video/mp4"></video>
      </div>
    </div>
  </div>
  <div class="question">
    <h1>자주 묻는 질문
    </h1>
    <div class="quest">
      <div class="textbox">넷플릭스란 무엇인가요?</div>
      <i class="las la-plus"></i>
    </div>
    <div class="quest">
      <div class="textbox">넷플릭스 요금은 얼마인가요?</div>
      <i class="las la-plus"></i>
    </div>
    <div class="quest">
      <div class="textbox">어디에서 시청할 수 있나요?</div>
      <i class="las la-plus"></i>
    </div>
    <div class="quest">
      <div class="textbox">멤버쉽을 해지하려면 어떻게 하나요?</div>
      <i class="las la-plus"></i>
    </div>
    <div class="quest">
      <div class="textbox">넷플릭스에서 어떤 콘텐츠를 시청할 수 있나요?</div>
      <i class="las la-plus"></i>
    </div>
    <div class="quest">
      <div class="textbox">무료 이용에 관해 자세히 알 수 있을까요?</div>
      <i class="las la-plus"></i>
    </div>
    <h3 class="emailtit">시청할 준비가 되셨나요? 멤버십을 등록하거나 재시작하려면 이메일 주소를 입력하세요.</h3>
    <div class="search1">

    

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