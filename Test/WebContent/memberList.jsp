<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="DBPKG.DBcon"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
</head>
<style>
body {
	height: 100%;
}

* {
	
	margin: 0 auto;
	overflow-x: hidden;
}

.hd {
	height: 100px;
	background-color: blue;
}

.hd h1 {
	text-align: center;
	color: #fff;
	padding-top: 15px;
}

a {
	text-decoration: none;
}

ul, li {
	list-style: none;
}

.tnb {
	background-color: yellow;
	height: 60px;
}

.tnb ul li a {
	display: block;
	width: 140px;
	height: 40px;
	background-color: green;
	color: #fff;
	float: left;
	border: 1px #fff solid;
	text-align: center;
	padding-top: 10px;
}

.content1 {
	background-color: gray;
	height: 600px;
}
.tb{ display: table; border:1; width: 960px;}

.top_menu {
	text-align: center;
}

.ft {
	height: 100px;
	background-color: blue;
}

.ft_wrap p {
	text-align: center;
	font-size: 20px
}
</style>
<body>
	<header class="hd">
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	<nav class="tnb">
		<ul>
			<li><a href="newmem.jsp" class="tnb_box">회원등록</a> <a
				href="memberList.jsp" class="tnb_box">회원목록조회/수정</a> <a
				href="memberSearch.jsp" class="tnb_box">회원매출 조회</a> <a
				href="index.jsp" class="tnb_box">홈으로</a></li>
		</ul>
	</nav>
	<section class="content1">
		<h2 class="top_menu">회원목록조회/수정</h2>
		<div>
		

				<table class="tb">
					<thead>
						<tr>
							<th><label for="custno">회원번호</label></th>
							<th><label for="custname">회원성명</label></th>
							<th><label for="phone">회원전화</label></th>
							<th><label for="address">회원주소</label></th>
							<th><label for="joindate">가입일자</label></th>
							<th><label for="grade">고객등급</label></th>
							<th><label for="city">거주지역</label></th>
						</tr>
						</thead>
					<%
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		int custno;
		String custname, phone, address, joindate, grade, city;
		
		try{
			conn = DBcon.getConnection();
			String sql = "select * from member_tbl_02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				custno = rs.getInt("custno");
				custname = rs.getString("custname");
				phone = rs.getString("phone");
				address = rs.getString("address");
				joindate = rs.getString("joindate");
				grade = rs.getString("grade");
				city = rs.getString("city");
				
				switch (grade) {
				case "A" : grade = "VIP";
				break;
				case "B" : grade = "일반";
				break;
				case "C" : grade = "직원";
				break;
				}
				String sdate = joindate.substring(0,10);	
		%>
					<tbody>
						<tr>
							<td><a href="memberEdit.jsp?custno=<%=custno%>"><%=custno %></a></td>
							<td><%=custname %></td>
							<td><%=phone %></td>
							<td><%=address %></td>
							<td><%=sdate %></td>
							<td><%=grade %></td>
							<td><%=city %></td>
						</tr>
								<%
			}
						%>
					</tbody>
				</table>
			


			
		</div>
	</section>
	<footer class="ft">
		<div class="ft_wrap">
			<p>copyright</p>
		</div>
	</footer>
</body>
<%
			
		} catch(Exception e){
			System.out.println("DB CONNECTION error : "+e);
	
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e){
				// 핸들 에러 포인트
				System.out.println("DB Close error : "+ e);
			}
		}
		
%>
</html>