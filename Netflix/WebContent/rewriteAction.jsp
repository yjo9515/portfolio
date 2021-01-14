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
	
	Date date = new Date();
	SimpleDateFormat simple = new SimpleDateFormat("yyyyMMdd");
	String sysdate = simple.format(date);
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	try{
		String memID = null;
		if(session.getAttribute("id") != null){
			
			memID = (String)session.getAttribute("id");
			
		}
		if(memID == null){
			%>
			<script>
			alert("로그인 후 이용하실 수 있습니다.");
			location.href="login.jsp";
			</script>
			
			<% 
		}
		
		else{
		
			
		
		conn = DBcon.getConnection();
		String sql = "update net_list SET title=?,content=?,listday=? where memName='"+memID+"' ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, sysdate);
		pstmt.executeQuery();
		
		}
		%>
		<script>
		alert("수정완료");
		location.href="list.jsp";
		</script>
		
		<% 
			
		
	} catch(Exception e){
		
		System.out.println("DB Connection error : "+ e);
		%>
		<script>
		 alert("데이터베이스 연결이 실패되어 글등록이 완료되지 못했습니다.");
		 location.href = "reWrite.jsp";
		</script>
		<% 	
		}
	

%>




</body>
</html>