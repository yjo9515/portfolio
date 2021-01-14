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
		<h2 class="top_menu">쇼핑몰회원 등록</h2>
		<div>
			<%
		request.setCharacterEncoding("utf-8");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		
		String custno = request.getParameter("custno");
		String custname, phone, address, joindate, grade, city;
		try{
			conn = DBcon.getConnection();
			String sql = "select * from member_tbl_02 where custno="+custno;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				custname = rs.getString("custname");
				phone = rs.getString("phone");
				address = rs.getString("address");
				joindate = rs.getString("joindate");
				grade = rs.getString("grade");
				city = rs.getString("city");
				
				joindate = joindate.substring(0,10);
			
		
		
		
		%>

			<form name="register1" id="register1" action="memberEditAction.jsp" method="get">
				<table class="tb">
					<tbody>
						<tr>
							<th><label for="custno">회원번호(자동발생)</label></th>
							<td><input type="text" name="custno" id="custno"
								value="<%=custno%>" /></td>
						</tr>
						<tr>
							<th><label for="custname">회원성명</label></th>
							<td><input type="text" name="custname" id="custname" /></td>
						</tr>
						<tr>
							<th><label for="phone">회원전화</label></th>
							<td><input type="text" name="phone" id="phone" /></td>
						</tr>
						<tr>
							<th><label for="address">회원주소</label></th>
							<td><input type="text" name="address" id="address" /></td>
						</tr>
						<tr>
							<th><label for="joindate">가입일자</label></th>
							<td><input type="text" name="joindate" id="joindate"
								value="<%=joindate %>" /></td>
						</tr>
						<tr>
							<th><label for="grade">고객등급(A:VIP, B:일반, C:직원)</label></th>
							<td><input type="text" name="grade" id="grade"
								value="<%=grade %>" /></td>
						</tr>
						<tr>
							<th><label for="city">도시코드</label></th>
							<td><input type="text" name="city" id="city" value="<%=city %>" /></td>
						</tr>
						<tr>
							<td colspan="2"><button type="button" id="submit_btn">수정</button>
								<button type="button" id="search_btn">조회</button></td>
						</tr>

					</tbody>
				</table>
				<script>
		var form = document.register1;
		var submit_btn = document.getElementById("submit_btn");
		var search_btn = document.getElementById("search_btn");
		var custname= form.custname;
		var phone = form.phone;
		var address = form.address;
		var grade = form.grade;
		var city = form.city;
		
			submit_btn.addEventListener("click", function(e){
			if(custname.value==""){
				alert("회원 이름이 입력되지 않았습니다.");
				custname.focus();
				return;
			}
			if(phone.value==""){
				alert("전화번호가 입력되지 않았습니다.");
				phone.focus();
				return;
			}
			if(address.value==""){
				alert("회원 주소가 입력되지 않았습니다.");
				address.focus();
				return;
			}
			if(grade.value==""){
				alert("등급이 입력되지 않았습니다.");
				grade.focus();
				return;
			}
			if(city.value==""){
				alert("도시 코드가 입력되지 않았습니다.");
				city.focus();
				return;
			}
			if(custname.value!=""&& phone.value!=""&&address.value!=""&&grade.value!=""&&city.value!=""){
				form.submit();
			}	
		});
			
			search_btn.addEventListener("click", function(){
				location.href = "memberlist.jsp";	
			
			});
		
		</script>


			</form>
		</div>
	</section>
	<footer class="ft">
		<div class="ft_wrap">
			<p>copyright</p>
		</div>
	</footer>
</body>
<%
}
		} catch(Exception e){
			System.out.println("ProductBean error : "+e);
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