<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.PreparedStatement"  %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="DBPKG.DBcon" %>
<%@ page import="java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>처리중</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String memID = request.getParameter("memID");
	String memPassword = request.getParameter("memPassword");
	try{
		conn = DBcon.getConnection();
		String sql = "select * FROM net_mem WHERE memID ='"+memID+"' AND memPassword='"+memPassword+"'";
		
		pstmt = conn.prepareStatement(sql);
			
		rs = pstmt.executeQuery(sql);
		boolean login_chk = false;
		while(rs.next()) {
		login_chk = true;
		}
		if(login_chk){
			session.setAttribute("id", memID);
			session.setAttribute("pw", memPassword);
			response.sendRedirect("index.jsp");  
		}else{
			%>
			<script>
			alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
			history.back();
			</script>
			<% 
			
		}
	} catch(Exception e){
		
		System.out.println("DB Connection error : "+ e);
		%>
		<script>
		 alert("데이터베이스 연결이 실패되어 로그인이 완료되지 못했습니다.");
		 history.back();
		</script>
		<% 	
		}
			
			
		
	
	
	

%>




</body>
</html>