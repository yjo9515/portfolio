<%@page import="DBPKG.DBcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	final int viewpage = 10;
	final int BLOCK = 5;

	int pg = 1;
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int start = (pg*viewpage) - (viewpage-1);
	int end = (pg*viewpage);
	
	int allPage = 0;
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;

%>
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
.list{
    width: 50%;
    margin: 0 auto;
    text-align: center;
    height: 60%;
}
.list thead {
    background: #f5f5f5;
    width: auto;
    font-size: 18px;
    padding-left: 5px;
    padding-right: 5px;
    padding-top: 5px;
    padding-bottom: 5px;
    
}

</style>

<body>


  <div class="navbar">
    <ul>
    <li class="logo"><a href="index.jsp"><img src="./image/Netflix-Logo-PNG-image-200x200.png"></a></li>
    </ul>
    
    
    <h1 style="color:#fff; font-size: 3em">Netflix 문의</h1>
    
    
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
  
 <%
 request.setCharacterEncoding("utf-8");
 
 Connection conn = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;
 

 
 int total =0;
 try{
	 conn = DBcon.getConnection();
	 String numsql = "SELECT COUNT(*) FROM net_list";
	 pstmt = conn.prepareStatement(numsql);
	 rs = pstmt.executeQuery();
	 if(rs.next()){
		 total = rs.getInt(1);
		 
	 }
	 
	 
	 int sort=1;
	 String sql = "select * from net_list order by listNum desc";
	 pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	%>
	
 	<table class="list">
 	<thead>
 	<tr>
 	<td>글번호</td>
 	<td>제목</td>
 	<td>작성자</td>
 	<td>작성일</td>
 	<td>조회수</td>
 	</tr>
 	</thead>
 	<tbody>
 	<%
 	if(total == 0){
 	
 	
 	%>
 	<tr><td colspan="6">등록된 게시물이 없습니다.</td></tr>
 	<%
 	}else{
 		 int listNum;
 		
 		 String title,memName,viewCount;
 		 Date date = new Date();
 		SimpleDateFormat simple = new SimpleDateFormat("yyyyMMdd");
 		String sysdate = simple.format(date);
 		 
 		while(rs.next()){
 			 listNum = rs.getInt("listNum");
 			 title = rs.getString("title");
 			 memName = rs.getString("memName");
 			 sysdate = rs.getString("listday");
 			 viewCount = rs.getString("viewCount");
 			sysdate=sysdate.substring(0,10);
 			
 	%>
 	
 	<tr>
 	<td><%=listNum %></td>
 	  
 	 <td><a href="listEdit.jsp?listNum=<%=listNum%>"><%=title %></a></td> 	
 	<td><%=memName %></td>
 	<td><%=sysdate %></td>
 	<td><%=viewCount %></td>
 	
 	</tr>	
 	<% 
 	
 	session.setAttribute("date", sysdate);
 	}
	}
  }catch(Exception e){
	 e.printStackTrace();
 }
 
 
 %>
 </tbody>
 <tr><td colspan="6"><a class="buttons" style="width: 4.5%; margin-left: 85%; " href="writeList.jsp">글쓰기</a></tr>
 	</table>
	
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