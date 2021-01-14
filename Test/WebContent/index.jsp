<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
</head>
<style>
body{height: 100%;}
*{width: 100%;  margin: 0 auto; overflow-x:hidden;}
.hd {height: 100px; background-color: blue; }
.hd h1 {text-align: center; color: #fff; padding-top: 15px;}
a {text-decoration: none;}
ul, li {list-style: none;}
.tnb {background-color: yellow; height: 60px;}
.tnb ul li a {display: block; width: 140px; height: 40px; background-color: green; color: #fff; float: left; border: 1px #fff solid; text-align: center; padding-top: 10px;}

.content1 { background-color: gray; height: 600px;}
.top_menu { text-align: center;}
.ft{height: 100px; background-color: blue;}
.ft_wrap p {text-align: center; font-size : 20px}

 
</style>
<body>
	<header class="hd">
	<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	<nav class="tnb">
		<ul>
			<li>
				<a href="newmem.jsp" class="tnb_box">회원등록</a>
				<a href="memberList.jsp" class="tnb_box">회원목록조회/수정</a>
				<a href="memberSearch.jsp" class="tnb_box">회원매출 조회</a>
				<a href="index.jsp" class="tnb_box">홈으로</a>
			</li>
		</ul>
	</nav>
	<section class="content1">
	<h2 class="top_menu">쇼핑몰회원관리 프로그램</h2>
	<div>
		<ul>
			<li>쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.</li>
			<li>프로그램 작성 순서</li>
			<li>1.회원정보 테이블을 생성한다.</li>
			<li>2.매출정보 테이블을 생성한다.</li>
			<li>3.회원정보,매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li>4.회원정보 입력 화면프로그램을 작성한다.</li>
			<li>5.회원정보 조회 프로그램을 작성한다.</li>
			<li>6.회원매출정보 조회 프로그램을 작성한다.</li>
		</ul>
	</div>
	</section>
	<footer class="ft">
	<div class="ft_wrap">
		<p>copyright</p>
	</div>
	</footer>
</body>
</html>