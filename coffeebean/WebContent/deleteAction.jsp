<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO" %>
    <%@ page import="user.UserBeans" %>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import = "java.sql.*" %>
    
    <% request.setCharacterEncoding("UTF-8"); %>
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		
		userID = (String)session.getAttribute("userID");
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.delete(userID);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('탈퇴에 실패하였습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
			session.invalidate();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('탈퇴가 완료되었습니다')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
					
	
	%>
	
	
	
	
</body>
</html>