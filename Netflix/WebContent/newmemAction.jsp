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
	
	try{
		conn = DBcon.getConnection();
		String sql = "insert into net_mem values (net_seq.nextval,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("memID"));
		pstmt.setString(2, request.getParameter("memPassword"));
		pstmt.setString(3, request.getParameter("memName"));
		pstmt.setString(4, request.getParameter("memNum"));
		pstmt.setString(5, request.getParameter("memEmail"));
		pstmt.executeQuery();
		
	} catch(Exception e){
		
		System.out.println("DB Connection error : "+ e);
		%>
		<script>
		 alert("데이터베이스 연결이 실패되어 회원등록이 완료되지 못했습니다.");
		 location.href = "newmem.jsp";
		</script>
		<% 	
		} finally{
			try{
				if(pstmt!=null){pstmt.close();}
				if(conn!=null){conn.close();}
			%>
			<script>
			alert("Netfilx 회원 등록이 정상적으로 완료되었습니다.");
			location.href = "index.jsp";
			</script>
			<% 
			}catch(Exception e){
				System.out.println("DB Close error : "+e);
			}
			
			}
		
	
	
	

%>




</body>
</html>