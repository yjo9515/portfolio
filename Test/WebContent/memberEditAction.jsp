<%@page import="DBPKG.DBcon"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*,java.net.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
</head>

<body>
	<%request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String str = request.getParameter("custno");
	String ustr = URLDecoder.decode(str,"utf-8");
	int custno = Integer.parseInt(ustr);
	System.out.println(custno);
	try{
		conn = DBcon.getConnection();
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("custname"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("grade"));
		pstmt.setString(4, request.getParameter("city"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		pstmt.setInt(7,custno);
		pstmt.executeQuery();
	} catch(Exception e){
		System.out.println("DB CONNECTION error : "+e);

	}finally{
		try{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			%>
			<script>
			alert("수정완료");
			location.href="memberEdit.jsp?custno=<%=custno%>";
			</script>
			<% 
		} catch(Exception e){
			// 핸들 에러 포인트
			System.out.println("DB Close error : "+ e);
		}
	}
	
	
	
	
	
	%>
</body>
</html>