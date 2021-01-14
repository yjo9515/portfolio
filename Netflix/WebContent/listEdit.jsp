<%@page import="DBPKG.DBcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
 
 String date = (String)session.getAttribute("date");
 System.out.println(date);
	String num = request.getParameter("listNum");
	session.setAttribute("Num",num);
	
 try{
	 conn = DBcon.getConnection();
	 String sql = "select * from net_list where listnum="+num;
	 pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	 int listNum;
		 int viewCount;
		 String title,memName,content;
	if(rs.next()){
		 listNum = rs.getInt("listNum");
			 title = rs.getString("title");
			 memName = rs.getString("memName");
			 content = rs.getString("content");
			 viewCount = rs.getInt("viewCount");
			 viewCount++;
			
	%>
 	<table class="list">
 	<thead>
 	<tr>
 	
 	<td><%=listNum %></td>
 	<td colspan="4"><%=title %></td>
 	</tr>
 	
 	<tr>
 	<td style="width: 10%;">작성자</td>
 	 	<td style="width: 65%; text-align: left;"><%=memName %></td>
 	<td style="width: 5%"><img src="./image/viewcount.png" alt="조회수" style="width: 100%; height: 20px;" /></td>
 	<td><%=viewCount %></td>
 	<td style="width: 15%;"><%=date %></td>
 	</tr> 	
 	 
 	<tr style="height: 550px;">
 	<td>내용</td>
 	<td colspan="4" style="text-align: left;"><%=content %></td>
 	</tr>
 	
 	</thead>
 	<tbody>
 	<tr>
 	<td>
 
	 	</td>
	 	</tr>
	 	
<%
	
	String viewsql = "update net_list set viewcount="+viewCount+"where listnum="+listNum;
pstmt = conn.prepareStatement(viewsql);
pstmt.executeQuery();
	
	
	 
	
%>
 
 </tbody>
 <tr>
 <td colspan="2"></td>
 <%
 request.setCharacterEncoding("utf-8");
 String memID = (String)session.getAttribute("id");
 
 if(memID.equals(memName)&&memID!=null&&memName!=null){
	 

 %>
 <td><a class="buttons" style="width: 45%; margin: 0 auto; " href="reWrite.jsp">수정</a></td>
 <td><a class="buttons" style="width: 50%; margin: 0 auto; margin-left: 30%;  " href="delete.jsp">삭제</a></td>
 <td><a class="buttons" style="width: 23%; margin: 0 auto; " href="list.jsp">목록</a></td>
 <% }else
	{%>
 <td><a class="buttons" style="width: 50%; margin: 0 auto; " href="list.jsp">목록</a></td>
 <%}
	}}catch(Exception e){
		 e.printStackTrace();
	 }
 %>
 </tr>
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