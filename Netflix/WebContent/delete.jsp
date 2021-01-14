<%@page import="DBPKG.DBcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 처리 중입니다</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String num2 = (String)session.getAttribute("Num");
if(session.getAttribute("id") == null){
	%>
	<script>
	alert("삭제 권한이 없습니다.");
	history.back();
	</script>
	
	<% 
}else{
try{
	conn = DBcon.getConnection();
	String sql = "delete from net_list where listNum="+num2;
	pstmt = conn.prepareStatement(sql);
	pstmt.executeQuery();
	%>
	<script>
	alert("해당 게시글을 삭제하였습니다.");
	location.href="list.jsp";
	</script>
	<%
	  session.removeAttribute("Num");
}catch(Exception e){
	e.printStackTrace();
}
}

%>
</body>
</html>